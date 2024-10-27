# Bash config
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

stty -ixon # Desativa ctrl-s e ctrl-q (usado para pausar o terminal) 

# Histórico
HISTCONTROL=ignoreboth
shopt -s histappend 
HISTSIZE=1000
HISTFILESIZE=2000 #

shopt -s checkwinsize # Checa o tamanho da janela a cada commando e, se necessário, atualiza os valores de LINES e COLUMS

shopt -s autocd # Permite que você mude para um diretório apenas digitando seu nome

set -o vi # Modo Vim

# Cores para ls e outros programas
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# GCC avisos e erros
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# PS1 Customizada
#PS1="\[\e[32m\]\h\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[34m\]\u\[\e[m\] \W \$ " 
# Código das cores
RED="\\[\\e[1;31m\\]"
GREEN="\\[\\e[1;32m\\]"
YELLOW="\\[\\e[1;33m\\]"
BLUE="\\[\\e[1;34m\\]"
MAGENTA="\\[\\e[1;35m\\]"
CYAN="\\[\\e[1;36m\\]"
WHITE="\\[\\e[1;37m\\]"
ENDC="\\[\\e[0m\\]"

# Prompt de duas linhas. Se estiver usando com ssh incluir a mensagem: 'ssh-session'.
if [[ -n "$SSH_CLIENT" ]]; then ssh_message="-ssh_session"; fi
PS1="${MAGENTA}\t ${GREEN}\u ${WHITE}at ${YELLOW}\h${RED}${ssh_message} ${WHITE}in ${BLUE}\w \n${CYAN}\$${ENDC} "

# Carregar aliases
[ -f "${XDG_CONFIG_HOME:-$HOME}/.bash_aliases" ] && source "${XDG_CONFIG_HOME:-$HOME}/.bash_aliases"

