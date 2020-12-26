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
cat $DIR/user.js > $profile_folder/user.js

echo "Done"
