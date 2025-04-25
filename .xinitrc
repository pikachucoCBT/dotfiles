#!/bin/sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap  
xrdb -merge ~/.Xresources && xrdbpid=$!

xinput --set-prop 'Logitech USB Receiver' 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 'Logitech USB Receiver' 'libinput Accel Speed' -0.4

dwmblocks &

# Confirmar que xrdb acabou antes de iniciar o DWM
[ -n "$xrdbpid" ] && wait "$xrdbpid"

exec dwm

