#!/bin/sh

xrdb="xrdb"
xmodmap="xmodmap"
xinitdir="/etc/X11/xinit"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"

# load user Xresources (DPI, cursor, etc.)
if [ -f "$userresources" ]; then
  if [ -x /usr/bin/cpp ] ; then
    "$xrdb" -merge "$userresources"
  else
    "$xrdb" -nocpp -merge "$userresources"
  fi
fi

# load user keyboard remappings
if [ -f "$usermodmap" ]; then
  "$xmodmap" "$usermodmap"
fi

# run system xinit scripts (dbus, etc.)
if [ -d "$xinitdir"/xinitrc.d ] ; then
  for f in "$xinitdir/xinitrc.d"/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# keyboard repeat: 200ms delay, 50 keys/sec
xset r rate 200 50

# VM clipboard/display sharing
spice-vdagent &

# clipboard history daemon (for clipmenu)
clipmenud &

# screen saver - start, wait for ready, lock, THEN start i3
xscreensaver --no-splash &

# wait for xscreensaver daemon to initialize
while ! xscreensaver-command -time >/dev/null 2>&1; do
    sleep 0.1
done

# lock before starting window manager
xscreensaver-command -lock
sleep 0.5  # let lock window fully render before i3 starts

exec i3
