# Bitcomplete Homebrew Tap repository: Developer Guide

Developer Guide to deploy new plz release. 

## Release a new version

- Copy the new `plz` command line into the `dist` folder.
- Update VERSION in Makefile (TODO ch4765 to retrieve version from `plz version`)
- Run `make push-release` to generate and push the new release to GH
- Run `make push-formula`to push the updated formula in GH

