#!/bin/sh

unlink() {
  local name=/usr/share/$1/translations
  if ! [ -L $name ] ; then
    echo "No-link: $name"
    return 1
  fi
  rm -v $name
  mv -v $name.org $name
  echo
}

unlink pcmanfm-qt
unlink libfm-qt
