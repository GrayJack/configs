#!/usr/bin/env bash

function run {
  if ! pgrep $1 ; then
    $@&
  fi
}
run nm-applet
run blueman-applet
# run dbus-launch update-checker
# run light-locker
run pulseaudio -D
run conky -c ~/.conky/conkyrc -d 
# run compton --config ~/.config/compton.conf --shadow-exclude '!focused' -b
run compton --config ~/.config/compton.conf -b
# run xcape -e 'Super_L=Super_L|Shift_L|p'
run /usr/lib/polkit-kde-authentication-agent-1
run indicator-kdeconnect
# run pa-applet
run xrdb merge ~/.Xresources
# run gnome-keyring-daemon
