brew uninstall c2t
brew uninstall cc65
brew uninstall applecommander
brew uninstall applecommander-ac
brew uninstall --cask virtual-ii
brew untap lifepillar/appleii

test -f "$(brew --prefix)/bin/aplc" || echo "aplc symlink not found" && exit 0

rm -v "$(brew --prefix)/bin/aplc" || echo "trouble deleting symlink" && exit 1

echo "Uninstalled successfully"