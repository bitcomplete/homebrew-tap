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

