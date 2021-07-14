#!/bin/zsh

### SUFFIX ALIASES FOR EASY FILE OPENING;;;;;;;;;;
alias -s {txt,md,mdown,markdown,yml,yaml,conf,zsh}=micro
alias -s {html,htm,org,com,net,io}=w3m
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### LS DAILY DRIVER -- VARIOUS EDITIONS;;;;;;;;;;;
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias l.="exa --long --header --extended --git --classify --color=automatic --color-scale --icons --all --sort=Name --group-directories-first"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias lsd="lsd -lAF --blocks=permission,size,date,name --date=date --total-size --group-dirs first"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### BETTER, LITTLE MORE SANE UTILS;;;;;;;;;;;;;;;;
alias cat="bat --color=always --italic-text=always --style=full"
alias ls="lsd -lAF --blocks=permission,size,date,name --date=date --total-size --group-dirs first"
#alias grep="rg --hidden --follow"
alias cpy="rsync -avz --checksum --progress -h"
alias mov="rsync -avz --checksum --progress -h --remove-source-files"
alias sync="rsync -avzu --checksum --progress -h"
alias rmv="rm -fd -R -I"
alias spelling="codespell --builtin clear,rare,code,informal --summary -i 3 -q 2 -H -C 1 -w"

#;;;;;;;;;;;;;;;;BETTER DEFAULTS;;;;;;;;;;;;;;;;;;


#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### SSH QOL QUICK UP AND ADD;;;;;;;;;;;;;;;;;;;;;;
sshup() {
	eval $(ssh-agent -s)
	ssh-add ~/.ssh/${1}
}
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### FREQ EDITED FILES / DIRECTORIES;;;;;;;;;;;;;;;
#--- FILES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias myrc="$EDITOR $ZDOTDIR/.zshrc"
alias myenv="$EDITOR ~/.zshenv"
alias motd="$EDITOR $PREFIX/etc/motd"
alias myalias="$EDITOR ~/projects/dotfiles/.config/zsh/.aliases.zsh"
#--- DIRECTORIES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias proj="cd ~/projects"
alias dot="cd ~/projects/dotfiles"
alias conf="cd ~/.config"
alias rop="cd ~/projects/rootofpi.me"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### DUC QOL FUN TIMES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias ducindex="duc index -pbv " 
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### UPDATE PIP / GEMS / NPM;;;;;;;;;;;;;;;;;;;;;;;
alias pipsup="pip install --upgrade pip wheel setuptools"
alias pipup="pipx upgrade-all"
alias gemup="gem update --system && gem update"
alias npmup="npm up --global"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# youtube-dlc for best video, shorthand;;;;;;;;;;;;
alias yt="youtube-dl"
#download best audio file and convert to mp3;;;;;;
alias ytm="youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 "
# youtube search all formats;;;;;;;;;;;;;;;;;;;;;;;
alias ytf="youtube-dl -F"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### IMG MANIPULATION;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias ascii="jp2a --term-zoom --background=light --colors "
asciihtml() {
  # parameters $1 = input file, $2 = output html file
  jp2a -z --background=dark --colors --color-depth=24 --html --html-fontsize=2 --output=${2} ${1}
}
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### I'M LAZY AND MAKE NO EXCUSES;;;;;;;;;;;;;;;;;;;
alias pkgs="pkg show"
alias pkgse="pkg search"
alias pkgi="pkg install"
alias pkgu="pkg upgrade"
#--- for use in term in micro;;;;;;;;;;;;;;;;;;;;;;
alias batdir="l. | bat"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# Serving up that file, or directory, or entire ;;;
# file system with the quickness, please. ;;;;;;;;;
alias mserv="miniserve -urzqv -i ::"
# neocities funtimes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias neopush="neocities push ."
alias neodel="neocities delete"
alias neols="neocities list -a -d /"

#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# Password creation / manipulation / maintaining;;;
alias pwgensec="pwgen -sc -B"
alias passin="pass insert -m"
alias passs="pass search" 
