#!/bin/bash
DIR=$(dirname "$(readlink -f "$0")")
PROFILE_NAME=Dynamo

_get_profile() {
  find "${HOME}/.mozilla/firefox/" -maxdepth 1 -type d -regextype egrep -regex '.*[a-zA-Z0-9]+.'$PROFILE_NAME
}

if ! type firefox > /dev/null; then
  exit
fi

if [ -z $(_get_profile) ]; then
  firefox -CreateProfile $PROFILE_NAME
fi
profile_folder=$(_get_profile)
echo "Profile folder is $profile_folder"

echo "Setting user preference"
curl -SL https://raw.githubusercontent.com/arkenfox/user.js/master/user.js -o $profile_folder/user.js
cat $DIR/user.js >> $profile_folder/user.js

echo "Setting theme"
rm -rf $profile_folder/chrome
ln -s $DIR/chrome $profile_folder/chrome

echo "Restore search engines"
ln -s $DIR/search.json $profile_folder/search.json.mozlz4

echo "Restore containers"
ln -s $DIR/containers.json $profile_folder/containers.json

echo "Restore bookmarks"
ln -s $DIR/sensitive/bookmarks $profile_folder/bookmarkbackups

echo "Restore site preferences"
ln -s $DIR/sensitive/site-prefs/permissions.sqlite $profile_folder/permissions.sqlite
ln -s $DIR/sensitive/site-prefs/content-prefs.sqlite $profile_folder/content-prefs.sqlite

echo "Done"
