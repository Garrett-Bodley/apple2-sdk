# Apple ][ SDK

This should help you get set up for developing on the Apple ][

## Installation

`scripts/init.bash` installs the requisite homebrew packages

```
bash scripts/init.bash
```

**For MacOS only**

MacOS has a command called `ac`, but the command line version of AppleCommander installed via homebrew aliases itself as `ac`. This script should find and rename the alias of the homebrew installation to `aplc`.

```
bash scripts/rename-ac.bash
```

## Make Commands

```
# Stub out project directories
make dir

# Compile to 6502
make target

# Generate wav file
make wav

# Generate aif file
make aif

# Generate dsk file
make disk

# Do all of the above
make all
```