# Programas default:
export EDITOR="vim"
export TERMINAL="st"
export TERMINAL_PROG="st"
export BROWSER="firefox"

# Adiciona todos diretórios em `~/.local/bin` para o $PATH
export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"

# Autostart tty1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

