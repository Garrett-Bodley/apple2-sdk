OLDIFS=$IFS
IFS=:

# Search PATH for an executable "ac" that is installed via homebrew
for dir in $PATH; do
  if [[ -d "$dir" && -x "$dir/ac" ]]; then
    if echo "$dir" | grep -q "homebrew"; then
      DIR="$dir"
      AC_PATH="$dir/ac"
      break
    fi
  fi
done

IFS="$OLDIFS"

if [[ -z "$AC_PATH" ]]; then
  echo "error: homebrew ac path could not be found"
  exit 1
fi

if ! test -f "$AC_PATH"; then
  echo "error: $AC_PATH is not a file"
fi

mv -v "$AC_PATH" "$DIR/aplc"