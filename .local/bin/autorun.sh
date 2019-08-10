#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

xrdb -merge ~/.Xresources

setxkbmap -layout us -variant altgr-intl -option caps:escape

feh --bg-fill ~/.config/wallpaper
run redshift
bash ~/.local/bin/trackpad_enable_tap
run thunar --daemon
run compton -b
# run cmst
# run mpd

while true
do
  bash ~/.local/bin/status
  sleep 30
done &
