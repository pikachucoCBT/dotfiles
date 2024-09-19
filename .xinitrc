#!/bin/sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap  
xrdb -merge ~/.Xresources && xrdbpid=$!

dwmblocks &

# Confirmar que xrdb acabou antes de iniciar o DWM
[ -n "$xrdbpid" ] && wait "$xrdbpid"

exec dwm

