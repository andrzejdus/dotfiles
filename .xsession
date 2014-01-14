#!/bin/bash

#~/bin/xmodmap-capslock-remap
xmodmap ~/.capslock_remap

xrandr --output VGA-1 --auto --right-of DVI-I-1

synergys --name server

xscreensaver &
xsetroot -cursor_name left_ptr

/usr/bin/xmonad

