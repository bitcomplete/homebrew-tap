SHELL := /bin/bash

VERSION ?= $(shell sed -e 's/ *version "\(.*\)"/\1/' -e tx -e d -e ':x' plz.rb)
ARCHIVE := plz-darwin-amd64-$(VERSION).tar.gz
ARCHIVE_URL := https://github.com/bitcomplete/plz-cli/releases/download/$(VERSION)/$(ARCHIVE)

all: help

.PHONY: all

dist/$(ARCHIVE):
	@mkdir -p dist
	@cd dist && curl -sSfLO "$(ARCHIVE_URL)"

plz.rb: dist/$(ARCHIVE)
	@sha=`shasum -a 256 dist/$(ARCHIVE) | awk '{print $$1}'` && \
		echo "Updating plz formula with version $(VERSION) and SHA $$sha" && \
		sed -i '' -E 's#version ".*"#version "$(VERSION)"#g' plz.rb && \
		sed -i '' -E 's#url ".*"#url "$(ARCHIVE_URL)"#g' plz.rb && \
		sed -i '' -E 's#sha256 ".*"#sha256 "'$$sha'"#g' plz.rb

update-formula:
	@VERSION=`gh --repo bitcomplete/plz-cli release list | awk '{ if ($$2 == "Latest") { print $$3 } }'` $(MAKE) plz.rb

.PHONY: update-formula


push-formula:
	git add plz.rb
	git commit -m "plz v$(VERSION)"

.PHONY: push-formula

help:

	@echo 'Usage: make [TARGET]'
	@echo
	@echo '    make update-formula     udpdate plz formula'
	@echo '    make push-formula       push the new formula to github'
	@echo

.PHONY: help


# ------------------------------------------------------------------ context-atlas
#
# context-atlas is Node source, so there is nothing to compile and one
# platform-independent tarball covers every machine. The source repo is private, so the
# tarball is published as a release on THIS repo - the same arrangement kploy uses.

CA_VERSION ?= $(shell sed -e 's/ *version "\(.*\)"/\1/' -e tx -e d -e ':x' Formula/context-atlas.rb)
CA_ARCHIVE := context-atlas-$(CA_VERSION).tar.gz
CA_TAG := v$(CA_VERSION)-context-atlas
CA_URL := https://github.com/bitcomplete/homebrew-tap/releases/download/$(CA_TAG)/$(CA_ARCHIVE)
CA_SRC ?= $(HOME)/Code/context-atlas

# Build the tarball from a source checkout. Only what the formula installs goes in.
context-atlas-archive:
	@mkdir -p dist/context-atlas
	@rm -rf dist/context-atlas/*
	@cp -R "$(CA_SRC)/src" "$(CA_SRC)/public" "$(CA_SRC)/package.json" "$(CA_SRC)/README.md" dist/context-atlas/
	@tar -czf "dist/$(CA_ARCHIVE)" -C dist context-atlas
	@echo "built dist/$(CA_ARCHIVE)"

.PHONY: context-atlas-archive

# Publish the tarball and point the formula at it. Run after bumping the version in
# Formula/context-atlas.rb, or pass CA_VERSION=x.y.z.
context-atlas-release: context-atlas-archive
	@gh release create "$(CA_TAG)" --repo bitcomplete/homebrew-tap \
		--title "context-atlas $(CA_VERSION)" --notes "context-atlas $(CA_VERSION)" \
		"dist/$(CA_ARCHIVE)"
	@sha=`shasum -a 256 "dist/$(CA_ARCHIVE)" | awk '{print $$1}'` && \
		echo "Updating context-atlas formula with version $(CA_VERSION) and SHA $$sha" && \
		sed -i '' -E 's#version ".*"#version "$(CA_VERSION)"#' Formula/context-atlas.rb && \
		sed -i '' -E 's#url ".*"#url "$(CA_URL)"#' Formula/context-atlas.rb && \
		sed -i '' -E 's#sha256 ".*"#sha256 "'$$sha'"#' Formula/context-atlas.rb
	@echo "Now commit Formula/context-atlas.rb and push."

.PHONY: context-atlas-release
