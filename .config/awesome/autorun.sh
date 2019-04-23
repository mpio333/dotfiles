#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

setxkbmap -layout us -variant altgr-intl -option caps:escape

run redshift
bash ~/.scripts/fzic/trackpad_enable_tap
run cmst
#run connma-gtk --tray
run thunar --daemon
run compton -b
