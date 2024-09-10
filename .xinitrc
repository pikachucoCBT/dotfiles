#!/bin/sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap  
xrdb -merge ~/.Xresources && xrdbpid=$!

# Confirmar que xrdb acabou antes de iniciar o DWM
[ -n "$xrdbpid" ] && wait "$xrdbpid"

setbg 
dwmblocks &

exec dwm

