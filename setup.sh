#!/bin/bash
DIR=$(dirname "$(readlink -f "$0")")
PROFILE_NAME=Dynamo

# Get Profile folder
_get_profile() {
  find "${HOME}/.mozilla/firefox/" -maxdepth 1 -type d -regextype egrep -regex '.*[a-zA-Z0-9]+.'$PROFILE_NAME
}

# Create symbolic link for config
# $1: The source of symlink
# $2: The destination of symlink
# $3: When true, create parent directories to the link as needed. (default: true)
# $4: Force removes the old destination, file or folder, and forces a new link (default: true)
_link() {
  local need_create_parent=${3:-true}
  local is_force=${4:-true}

  if [[ -e "$2" || -L "$2" ]]; then
  # Check destination is existed or is a symlink
    if test "$1" -ef "$(readlink -f "$2")"; then
    # If symlink is setup same with source then finish
      echo "${2} linked"
      return
    else
    # Delete destination if not a symlink or target of symlink is not same with source
      [ "$is_force" = true ] && rm -rf "$2"
    fi
  fi
  [ "$need_create_parent" = true ] && mkdir -p "$(dirname "$2")"
  ln -sv "$1" "$2"
}

if ! type firefox > /dev/null; then
  exit
fi

if [ -z "$(_get_profile)" ]; then
  firefox -CreateProfile $PROFILE_NAME
fi
profile_folder=$(_get_profile)
echo "Profile folder is $profile_folder"

echo "Setting user preference"
curl -SL https://raw.githubusercontent.com/arkenfox/user.js/master/user.js -o "$profile_folder/user.js"
cat "$DIR/user.js" >> "$profile_folder/user.js"

echo "Setting theme"
_link "$DIR/chrome" "$profile_folder/chrome"

echo "Restore search engines"
_link "$DIR/search.json.mozlz4" "$profile_folder/search.json.mozlz4"

echo "Restore containers"
_link "$DIR/containers.json" "$profile_folder/containers.json"

echo "Restore bookmarks"
_link "$DIR/sensitive/bookmarks" "$profile_folder/bookmarkbackups"

echo "Restore site preferences"
_link "$DIR/sensitive/site-prefs/permissions.sqlite" "$profile_folder/permissions.sqlite"
_link "$DIR/sensitive/site-prefs/content-prefs.sqlite" "$profile_folder/content-prefs.sqlite"

echo "Done"
