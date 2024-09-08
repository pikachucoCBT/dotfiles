# Add all directories in `~/.local/bin` to $PATH
export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"

# Autostart on tty1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

