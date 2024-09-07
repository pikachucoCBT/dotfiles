#!/bin/sh

#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap 
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xrdb -merge ~/.Xresources

xwallpaper --zoom ~/Pictures/wallpapers/wallhaven.png

while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
     sleep 1
done &

while true; do
    # Log do stderror para um arquivo
    dwm 2> ~/.dwm.log
done
