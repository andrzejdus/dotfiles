#!/bin/bash

xmodmap ~/.capslock_remap

xrandr --output VGA-1 --auto --right-of DVI-I-1

synergys --name server

xscreensaver &

/usr/bin/xmonad

