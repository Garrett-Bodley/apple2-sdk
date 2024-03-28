# Apple ][ SDK

This should help you get set up for developing on the Apple ][

## Installation

`scripts/init.bash` installs the requisite homebrew packages

```
bash scripts/init.bash
```

**For MacOS users only**

MacOS has a command called `ac`, but the command line version of AppleCommander installed via homebrew aliases itself as `ac`. This script should find and rename the alias of the homebrew installation

```
bash scripts/rename-ac.bash
```