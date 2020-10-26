##################################################
## alephalpha0 | ZSH RC File. Magic Happening.  ##
## created:2020-08-04   |   modified:2020-10-22 ##
##----------------------------------------------##
##   TERMUX 0.99 RUNNING ON ANDROID 10@A205U    ##
##        https://github.com/alephalpha0        ##
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
##################################################
##           ZSH COMPLETION AQUISITION          ##
##################################################
autoload -Uz compinit;
## check if comp cache was updated today.
## if it was, LET IT BE MAN!
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist
##################################################
##         ZSH OPTIONS GIVE LIFE MEANING!       ##
##################################################
###               HISTORY
###               HERSTORY
unsetopt HIST_SAVE_NO_DUPS	# i like knowing how many times i type out ls ok?
setopt INC_APPEND_HISTORY	# save that history as soon as it happens.
setopt SHARE_HISTORY 		# many instances of zsh going, save it all
setopt EXTENDED_HISTORY		# not entirely sure what this does, but it sounds good.
setopt HIST_IGNORE_DUPS		# when searching history from cmd line, ignore those dupes
setopt HIST_EXPIRE_DUPS_FIRST # let the old dupes go duke.
setopt HIST_FIND_NO_DUPS	# searching from cmd line, find no dupes.
setopt HIST_REDUCE_BLANKS 	# remove useless whitespace from hist file
setopt HIST_VERIFY
####### GENERAL QOL OPTIONS
### CORRECT MY INPUT
setopt CORRECT 		# nyae?
setopt CORRECT_ALL	# nyae?
### AUTOMAGIC CD WITHOUT TYPING CD
setopt AUTO_CD			# just type the dirpath!
setopt NO_CASE_GLOB 	# makes completion and gob caseless
setopt GLOBDOTS			# dot files are matched w/o explicit  .
###
### COMPLETION OPTIONS
###
setopt COMPLETE_IN_WORD			# Complete from both ends
setopt ALWAYS_TO_END			# Cursor goes to end of compl
setopt PATH_DIRS				# path search on input with /
setopt AUTO_PARAM_SLASH			# if compl param is dir, add /
setopt EXTENDED_GLOB			# file mod glob modifiers w/compinit
setopt LIST_PACKED
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
##################################################
#########  FANCYING UP THE COMPLETIONS ###########
# select completions with arrow keys
zstyle ':completion:*' menu select 
# group results by category
zstyle ':completion:*' group-name '' 
#enable approximate matches for completion
zstyle ':completion:::::' completer _expand _complete _ignored _approximate 
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true
##################################################
##      ANTIBODY PLUGIN MANAGER TRICKERY:       ##
##        CAUSE FUCK OMZ, THAT'S WHY!           ##
##################################################
### DYNAMIC LOADING FOR NOW, PROBABLY CHANGING
source <(antibody init)
antibody bundle < $ZDOTDIR/.zsh-plugins.txt
##################################################
###    Reloading compinit to enable zstyles    ###
autoload -Uz compinit;compinit -i
##################################################
###  Some programs only have bash completion.  ###
###  Loading bashcompinit and getting their    ###
###  completions into the shell.               ###
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"
##################################################
## ZSH ALIASES. BC WHY REMEMBER EVERY OPTION?   ##
##################################################
### LS DAILY DRIVER -- GIT BUILT IN!
# https://the.exa.website/ 
alias l.="exa -alh --git --classify -s=name --group-directories-first"
alias lt="exa -a --tree --level=4 --long --git"
##################################################
### BETTER, LITTLE MORE SANE UTILS
alias cat="bat "
alias ls="exa"
alias cpy="rsync -avz --checksum --progress -h"
alias mov="rsync -avz --checksum --progress -h --remove-source-files"
alias sync="rsync -avzu --checksum --progress -h"
alias rmv="rm -fd -R -I"
##################################################
### SSH QOL quick go and add!
alias ssheval="eval $(ssh-agent -s)"
alias sshadd="ssh-add ~/.ssh/id_ecdsa_rootofpime"
##################################################
### FREQ EDITED FILES / MANIP OF FILES
alias myrc="$EDITOR $ZDOTDIR/.zshrc"
alias myenv="$EDITOR ~/.zshenv"
alias motd="$EDITOR $PREFIX/etc/motd"
## default editors to use for MD|TXT|YML|YAML files
alias -s txt=micro
alias -s (md|mdown|markdown)=micro
# mainly for use in a terminal frame in micro,
alias batdir="l. | bat"
## image mogrifyance
alias ascii="jp2a --fit-zoom --background=light --colors "
alias ascii="jp2a --fit-zoom --background=light --colors --html --output=~/rootofpi.me/assests/pictures"
##################################################
### Duc QOL fun times.
alias duci="duc index -pbv " 
##################################################
### TIMEWARRIOR
alias timeweek="timew summary :week :ids"
alias timemonth="timew summary :month :ids"
alias timeyear="timew summary :year :ids"
##################################################
### GIST ACTIONS
alias newgist="gist -sco -d "
alias giste="gist -e "
alias gistu="gist -u "
alias gistls="gist -l "
alias gistout="gist -R "
alias gistdel="gist --delete"
##################################################
### UPDATE PIP / GEMS / ETC
alias pipsup="pip install --upgrade pip wheel setuptools"
alias pipup="pipx update-all"
alias gemup="gem update --system && gem update"
##################################################
### Website / Youtube /  HTTP kung-fu. Mirror and download etc.
# mirror a single webpage
alias mirror="wget --adjust-extension --span-hosts --convert-links --backup-converted --page-requisites"
#
# youtube-dl for best video, shorthand
alias yt="youtube-dl"
#
#download best audio file and convert to mp3
alias ytm="youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 "
#
#youtube search all formats
alias ytf="youtube-dl -F"
##################################################
### I'M LAZY AND MAKE NO EXCUSES
alias pkgs="pkg show"
alias pkgi="pkg install"
alias pkgu="pkg upgrade"
