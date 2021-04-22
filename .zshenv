##################################################
## alephalpha0  |  ZSH Environmental Variables  ##
## created:2020-09-11   |  modified:2020-11-03  ##
##----------------------------------------------##
##   TERMUX 0.99 RUNNING ON ANDROID 10@A205U    ##
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
##################################################2
##################################################
################## ENV VARIABLES ################# 
############## LIKE A FUCKING BOSS ###############a
####
### setting up my XDG compliance yo!
## At least I've got that going for me, so that's good.
### https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$XDG_CONFIG_HOME"/local/share
export XDG_CACHE_HOME="$XDG_CONFIG_HOME"/cache
### Further terminal/linux compliance. 
export TMPDIR="$HOME"/tmp
export HOMEDIR=/data/data/com.termux/files/home

### ZSH QOL here. Makes dealing with Antibody/ZSH specific things
### easier and more unified. 
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
### ZSH ANTIBODY HOME REBASE
### Did not like antibody's default HOME dir. WHO'S HOUSE?
export ANTIBODY_HOME="$ZDOTDIR"/antibody
### PIPX's default bin location was messing with my OCD.
export PIPX_BIN_DIR="$HOME"/bin
### Make's PIP stop polluting my HDD with its damn cache.
export PIP_NO_CACHE_DIR=true
### Starship Prompt's cache directory made me unhappy.
export STARSHIP_CACHE="$XDG_CACHE_HOME"/starship
### Did somebody call for some kind of text editor?
### Helps other programs go into editing mode in my pref editor.
export EDITOR="micro"
export VISUAL="micro"
export PAGER="less"
export BROWSER="w3m"
### ZSH can remember? LET IT BE!
export HISTFILE="$ZDOTDIR"/.zhistory
export HISTTIMEFORMAT="[%F %T]"
export HISTSIZE=10000
export SAVEHIST=10000
### This is my system's locale!
export LANG=en_US.UTF-8
export TZ="America/Chicago"
### THE PATH FOR BINARY SUMMONING
### The repetition of $PATH at beginning appends my additions
### to the currently set $PATH.
### The use of variables other than $PATH (eg. ~, $PREFIX) 
### is not always guaranteed to resolve properly. Go ahead
### and type out the full path to your directories.
export PATH="/data/data/com.termux/files/home/bin:/data/data/com.termux/files/home/.local/bin:/data/data/com.termux/files/usr/lib/ruby/gems/2.7.0:/data/data/com.termux/files/usr/bin/ruby:/data/data/com.termux/files/home/.cargo/bin:$PATH"
### BAT OPTIONS
### https://github.com/sharkdp/bat
export BAT_THEME="gruvbox"
### MICRO OPTIONS
export MICRO_TRUECOLOR=1
###PasswordStore options
export PASSWORD_STORE_GENERATED_LENGTH=20
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

### WARBOXING / CAPTURE THE FLAG
# overthewire.org
export WECHALLUSER="alephalpha0"
export WECHALLTOKEN="124E1-C61B2-46DFE-71B10-314AF-4E1A6"
