# Homebrew Tap repository for Bitcomplete tools

Homebrew Tap repository for Plz Review and other tools.

## Install

```
    # (optional) brew update
    brew tap bitcomplete/homebrew-tap
    brew install plz

    # or install directly 
    brew install bitcomplete/homebrew-tap/plz
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