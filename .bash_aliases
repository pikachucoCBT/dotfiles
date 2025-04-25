#!/bin/sh

# Usa neovim ao invés de vim caso presente
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# não precisa usar sudo para esses comandos
for command in mount umount apt nala updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

# Verbosidade e configurações sempre desejadas
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	ffmpeg="ffmpeg -hide_banner"
# Outros aliases
alias \
	nix#="nix profile install nixpkgs#"
