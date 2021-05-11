# Homebrew Tap repository for Bitcomplete tools

Homebrew Tap repository for Plz Review and other tools.

## Install

```
    # (optional) brew update
    brew tap bitcomplete/plz
    brew install plz

    # or install directly 
    brew install bitcomplete/tap/plz
```
[See ascii cast](https://asciinema.org/a/DhpKaKBoWdH5FrwtS3AAIdlkA)

## Other useful commands

```
    # Upgrade formula
    brew upgrade bitcomplete/tap/plz

    # Display tap info
    brew tap-info bitcomplete/tap
```

## Troubleshooting

If any issue during installation / update, just reinstall the tap:

```
    brew cleanup
    brew uninstall plz
    brew untap bitcomplete/tap
    brew tap bitcomplete/tap
    brew install plz
```