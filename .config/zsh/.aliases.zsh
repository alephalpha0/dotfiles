##################################################
## alephalpha0 | ZSH aliases. How many options? ##
## created:2020-10-26   |   modified:2020-11-12 ##
##----------------------------------------------##
##        https://github.com/alephalpha0        ##
##            http://rootofpi.me                ##
####################           ###################
#############                        #############
## Many thanks to those who have shared and     ##
## discussed their dotfiles/source code/scripts ## 
## on blogs, stackoverflow, dev.to, gitlab /    ##
## github, and any open forum for ideas on the  ##
##  world wide web. I am continually learning   ##
## and discovering new things because of you.   ##
##################################################
## There is no LICENSE attached to this file.   ##
##     I require no attribute for its use.      ##
## Do what thou will. That's the whole of law.  ##
##----------------------------------------------##
##!!!!!!!!!!NO WARRANTY PROVIDED FOR!!!!!!!!!!!!##
##!!!!!!!!!!!ANY POSSIBLE USE EITHER!!!!!!!!!!!!##
##################################################
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### SUFFIX ALIASES FOR EASY FILE OPENING;;;;;;;;;;
alias -s {txt,md,mdown,markdown,yml,yaml,conf,zsh}=micro
alias -s {html,htm,org,com,net,io}=w3m
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### LS DAILY DRIVER -- GIT BUILT IN!;;;;;;;;;;;;;;
l.() {
	case ${1} in
	e) # https://the.exa.website/
	  exa -alh --git -F -s=name --time-style=long-iso --group-directories-first ${2}
	;;
	et) # https://the.exa.website/
	  exa -a --tree --level=4 --long --time-style=long-iso --git ${2}
	;;
	c) # https://github.com/athityakumar/colorls
	  colorls -Al --gs --sd --dark ${2}
	;;
	ct) # https://github.com/athityakumar/colorls
	  colorls -Al --gs --sd --dark --tree=4 ${2}
	;;
	l)
	  lsd -lAF --blocks=permission,size,date,name --date=relative ---total-size --group-dirs first ${2}
	;;
	lt)
	  lsd -lAF --blocks=permission,size,date,name --date=relative --group-dirs first --tree --depth 3 -I .git -I .cache -I cache -I .bundle -I _cacache ${2}
	;;
	*)
	  exa -alh --git -F -s=name --time-style=long-iso --group-directories-first ${2}
	;;
	esac
}
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### BETTER, LITTLE MORE SANE UTILS;;;;;;;;;;;;;;;;
alias cat="bat --color=always --italic-text=always --style=full"
alias ls="lsd -lAF --blocks=permission,size,date,name --date=date --total-size --group-dirs first"
alias grep="rg --hidden --follow"
alias cpy="rsync -avz --checksum --progress -h"
alias mov="rsync -avz --checksum --progress -h --remove-source-files"
alias sync="rsync -avzu --checksum --progress -h"
alias rmv="rm -fd -R -I"
alias spelling="codespell --builtin clear,rare,code,informal --summary -i 3 -q 2 -H -C 1 -w"

#;;;;;;;;;;;;;;;;BETTER DEFAULTS;;;;;;;;;;;;;;;;;;
alias lsd="lsd -lAF --blocks=permission,size,date,name --date=date --total-size --group-dirs first"

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
alias rop="cd ~/rootofpi.me"
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
### I'M LAZY AND MAKE NO EXCUSES;;;;;;;;;;;;;;;;;;!
vol() {
	termux-volume music $1
}

alias pkgs="pkg show"
alias pkgse="pkg search"
alias pkgi="pkg install"
alias pkgu="pkg upgrade"
#--- for use na term in micro;;;;;;;;;;;;;;;;;;;;;;
alias batdir="l. | bat"
#¡;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# Serving up that file, or directory, or entire ;;;
# file system with the quickness, please. ;;;;;;;;;
alias mserv="miniserve -urzqv -i ::"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
###  WEBSITE GENERATION / UPKEEP / DEPLOYMENT  ;;;;
# pelican build site ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
buildblog() {
	if [[ -d !~/rootofpi.me/neov2 ]]; then
	  cd ~/rootofpi.me/neov2
	  pelican
	  if [[ -d !~/rootofpi.me/neov2/output ]]; then
	    cd ~/rootofpi.me/neov2/output
	    neocities push
	  fi
	fi
}
# neocities funtimes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias neopush="neocities push ."
alias neodel="neocities delete"
alias neols="neocities list -a -d /"
# surge tools ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias surgels="surge list"
alias surgedel="surge teardown"

