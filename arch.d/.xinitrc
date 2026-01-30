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
# screen lock with i3lock via xss-lock idle timeout: 10 seconds (change to 300
# for 5 min, etc.)
xset s 60

# VM clipboard/display sharing
spice-vdagent &

# clipboard history daemon (for clipmenu)
clipmenud &

# xss-lock handles: idle timeout, suspend, lid close, loginctl lock-session
xss-lock --transfer-sleep-lock -- /home/softboi/.scripts/lock.sh &

# lock before starting window manager (i3lock blocks until unlock, no sleep needed)
i3lock -e -f -n -i ~/Pictures/background.png

# background
feh --no-fehbg --bg-scale ~/Pictures/background.png

exec i3
