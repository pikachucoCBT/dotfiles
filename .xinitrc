#!/bin/sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap  
xrdb -merge ~/.Xresources && xrdbpid=$!

# Confirmar que xrdb acabou antes de iniciar o DWM
[ -n "$xrdbpid" ] && wait "$xrdbpid"

setbg 

while true; do
    # Log do stderror para um arquivo
    dwm 2> ~/.dwm.log
done

