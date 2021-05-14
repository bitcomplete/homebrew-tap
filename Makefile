SHELL := /bin/bash

# TODO ch4765 retrieve version from `plz version`
# VERSION = $(shell ./dist/plz version)
VERSION = 0.0.2
ARCHIVE = dist/$(VERSION)/plz-$(VERSION).tar.gz
SHA = $(shell shasum -a 256 $(ARCHIVE) | awk '{print $$1}')

all: help

.PHONY: all

prepare-dist: 
	@echo 'Build version $(VERSION)'
	mkdir -p dist/$(VERSION)
	rm -f dist/$(VERSION)/*
	tar -czf $(ARCHIVE) -C dist plz
	cp dist/plz dist/$(VERSION)/plz
	ls -lh dist/$(VERSION)

update-formula: prepare-dist
	@echo 'Update formula with version $(VERSION) and SHA $(SHA)'
	sed -i '' -E 's/sha256 ".*"/sha256 "$(SHA)"/g' plz.rb
	sed -i '' -E 's/v.*\.tar\.gz/v$(VERSION)\/plz-$(VERSION).tar.gz/g' plz.rb
.PHONY: update-formula

push-release: update-formula
	@echo 'Release version $(VERSION)'
	
	gh release create v$(VERSION) ./dist/$(VERSION)/* --title $(VERSION) --notes ""
	
	git add . 
	git commit -m "version X.Y.Z"
.PHONY: push-release

push-formula: 
	git add plz.rb
	git commit -m "plz v$(VERSION)"

.PHONY: push-formula


help:

	@echo 'Usage: make [TARGET]'
	@echo
	@echo '    make prepare-dist       create dist files'
	@echo '    make update-formula     udpdate plz formula'
	@echo '    make push-release       create and push a new github releated'
	@echo '    make push-formula       push the new formula to github'
	@echo

.PHONY: help

