# Programas default:
export EDITOR="vim"
export TERMINAL="scroll"
export TERMINAL_PROG="scroll"
export BROWSER="librewolf"
export BT_DEVICE_MAC="84:AC:60:97:B3:24"

# Adiciona todos diretórios em `~/.local/bin` para o $PATH
if [ -d "$HOME/.local/bin" ]; then
  PATH="$PATH:$HOME/.local/bin"
  for d in "$HOME/.local/bin"/*/; do
    [ -d "$d" ] && PATH="$PATH:$d"
  done
  export PATH
fi

# Autostart tty1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

