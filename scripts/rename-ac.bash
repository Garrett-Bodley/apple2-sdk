AC_PATH="$(brew --prefix)/bin/ac"

if test -z "$AC_PATH" ; then
  echo "error: homebrew ac path could not be found"
  exit 1
fi

if ! test -f "$AC_PATH"; then
  echo "error: $AC_PATH is not a file"
fi

mv -v "$AC_PATH" "$(brew --prefix)/bin/aplc"