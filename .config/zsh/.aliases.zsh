##################################################
## alephalpha0 | ZSH aliases. How many options? ##
## created:2020-10-26   |   modified:2020-10-26 ##
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
	  colorls -Al --gs --sd ${2}
	;;
	ct) # https://github.com/athityakumar/colorls
	  colorls -Al --gs --sd --tree=4 ${2}
	;;
	l)
	  lsd -lAF --blocks=permission,size,date,name --date=relative ---total-size --group-dirs first ${2}
	;;
	lt)
	  lsd -lAF --blocks=permission,size,date,name --date=relative --group-dirs first --tree --depth 3 -I .git -I .cache -I cache -I .bundle -I _cacache 
	;;
	*)
	  exa -alh --git -F -s=name --time-style=long-iso --group-directories-first ${2}
	;;
	esac
}
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### BETTER, LITTLE MORE SANE UTILS;;;;;;;;;;;;;;;;
alias cat="bat "
alias ls="exa"
alias cpy="rsync -avz --checksum --progress -h"
alias mov="rsync -avz --checksum --progress -h --remove-source-files"
alias sync="rsync -avzu --checksum --progress -h"
alias rmv="rm -fd -R -I"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### SSH QOL QUICK UP AND ADD;;;;;;;;;;;;;;;;;;;;;;
sshup() {
	eval $(ssh-agent -s)
	ssh-add ~/.ssh/${1}
}
#alias ssheval="eval $(ssh-agent -s)"
#alias sshadd="ssh-add ~/.ssh/id_ecdsa_rootofpime"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### FREQ EDITED FILES / DIRECTORIES;;;;;;;;;;;;;;;
#--- FILES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias myrc="$EDITOR $ZDOTDIR/.zshrc"
alias myenv="$EDITOR ~/.zshenv"
alias motd="$EDITOR $PREFIX/etc/motd"
#--- DIRECTORIES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias proj="cd ~/projects"
alias conf="cd ~/.config"
alias rootofpi="cd ~/rootofpi.me"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### DUC QOL FUN TIMES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias ducindex="duc index -pbv " 
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### TIMEWARRIOR;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias timeweek="timew summary :week :ids"
alias timemonth="timew summary :month :ids"
alias timeyear="timew summary :year :ids"
timemod() {
    # args are $1=start/end $2=id $3=modification
	timew modify ${1} @${2} ${3}
}
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### GIST ACTIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias newgist="gist -sco -d "  # shorten, copy, open, desc
alias gistu="gist -u "         # update
alias gistls="gist -l "        # list gists
alias gistdel="gist --delete"  # delete gist ID | URL
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### UPDATE PIP / GEMS / NPM;;;;;;;;;;;;;;;;;;;;;;;
alias pipsup="pip install --upgrade pip wheel setuptools"
alias pipup="pipx update-all"
alias gemup="gem update --system && gem update"
alias npmup="npm up --global"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### Website / Youtube kung-fu. Mirror and download etc.
# mirror a single webpage;;;;;;;;;;;;;;;;;;;;;;;;;
alias mirror="wget --adjust-extension --span-hosts --convert-links --backup-converted --page-requisites"
# youtube-dl for best video, shorthand;;;;;;;;;;;;
alias yt="youtube-dl"
#download best audio file and convert to mp3;;;;;;
alias ytm="youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 "
#youtube search all formats;;;;;;;;;;;;;;;;;;;;;;;
alias ytf="youtube-dl -F"
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### IMG MANIPULATION;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
alias ascii="jp2a --term-zoom --background=light --colors "
asciihtml() {
  # parameters $1 = input file, $2 = output html file
  jp2a --term-zoom --background=light --colors --html ${1} > ${2}
}
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
### I'M LAZY AND MAKE NO EXCUSES;;;;;;;;;;;;;;;;;;
alias pkgs="pkg show"
alias pkgi="pkg install"
alias pkgu="pkg upgrade"
#--- for use na term in micro;;;;;;;;;;;;;;;;;;;;;
alias batdir="l. | bat"
