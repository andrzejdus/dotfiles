#!/bin/bash

xmodmap ~/.capslock_remap
#sudo loadkeys ~/.keymap

xrandr --output VGA-1 --auto --right-of DVI-I-1

synergys

xscreensaver &

/usr/bin/xmonad

