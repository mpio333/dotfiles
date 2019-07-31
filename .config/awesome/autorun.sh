#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

setxkbmap -layout us -variant altgr-intl -option caps:escape

feh --bg-fill ~/.config/wallpaper
run redshift
bash ~/.scripts/fzic/trackpad_enable_tap
run thunar --daemon
run compton -b
# run cmst
run mpd
