#!/bin/sh

if [ -z "$SNAP_NAME" ] ; then
  SNAP_NAME=pcmanfm-qt-weblate
fi
dir=/snap/$SNAP_NAME/current

link() {
  local target=$dir/usr/share/$1/translations
  local name=/usr/share/$1/translations
  if [ -L $name ] ; then
    rm -v $name
  else
    rm -vrf $name.org
    mv -v $name $name.org
  fi
  ln -svf $target $name
  echo
}

echo "Make links translations directories
"

link pcmanfm-qt
link libfm-qt

echo "PCManFM-Qt Restart Required.
If you uninstall $SNAP_NAME, please run 'sudo /snap/$SNAP_NAME/current/revert-link.sh'.
"
