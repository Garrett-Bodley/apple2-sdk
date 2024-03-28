# Apple ][ SDK

This should help you get set up for developing on the Apple ][

## Installation

`scripts/install` installs the requisite homebrew packages. You can call it directly or via `make`

```
./scripts/install

# or

make install
```

**Virtual ][**

This app requires a ROM image, which must be downloaded and installed
separately.

See https://virtualii.com/VirtualIIHelp/virtual_II_help.html#ROMImage

**For MacOS only**

MacOS has a command called `ac`, but the command line version of AppleCommander installed via homebrew aliases itself as `ac`. This script should find and rename the alias of the homebrew installation to `aplc`.

There is no `make` command as it should only be run on MacOS systems.

```
./scripts/rename-ac
```

## Uninstall

`scripts/uninstall` uninstalls the homebrew packages (and deletes the renamed symlink if it exists). You can call it directly or via `make`

```
./scripts/uninstall

# or

make uninstall
```

## Make Commands

```

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