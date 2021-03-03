#--------------------------------------------------------------------------------#
# Friendly Interactive Shell Configuration File. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# CREATED: 2021-03-02 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# MODIFIED: 2021-03-03 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# brought to you by alephalpha0@tutanota.com ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
#;;;;;;;;;;;;;;;;;;; https://rootofpi.me ;;; https://github.com/alephalpha0 ;;;;;#
# MORS CERTA; VITA INCERTA ------------------------------------------------------#
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# Many thanks to those who have shared and discussed their dotfiles/source       #
# code/scripts on blogs, stackoverflow, dev.to, gitlab/github, and any open      #
# forum for ideas on the world wide web. I am continually learning and           #
# discovering new things because of you.                                         #
#--------------------------------------------------------------------------------#
# There is no LICENSE attached to this file. I require no attribute for its use. #
#               Do what thou will. That's the whole of law.                      #
#--------------------------------------------------------------------------------#
#           !!NO WARRANTY PROVIDED FOR ANY POSSIBLE USE EITHER!!                 #


###ENV VARIABLES LIKE SOME KIND OF BOSS
# This is my system's locale!
set -gx LANG en_US.UTF-8
set -gx TZ America/Chicago


# Setting default dirs and XDG compliance, so everything stays in one area.
set -gx PATH $PATH /data/data/com.termux/files/home/bin
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_DATA_HOME ~/.config/local/share
set -gx XDG_CACHE_HOME ~/.config/cache
set -gx TMPDIR ~/tmp
set -gx HOMEDIR /data/data/com.termux/files/home

### PIPX's default bin location was messing with my OCD.
set -gx PIPX_BIN_DIR ~/bin
### Make's PIP stop polluting my HDD with its damn cache.
set -gx PIP_NO_CACHE_DIR true
### Starship Prompt's cache directory made me unhappy.
set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship

### Did somebody call for some kind of text editor?
### Helps other programs go into editing mode in my pref editor.
set -Ux EDITOR micro
set -Ux VISUAL micro
set -Ux PAGER less
set -Ux BROWSER w3m

### BAT OPTIONS
### https://github.com/sharkdp/bat
set -gx BAT_THEME gruvbox
### MICRO OPTIONS
set -gx MICRO_TRUECOLOR 1
###PasswordStore options
set -gx PASSWORD_STORE_GENERATED_LENGTH 20
set -gx PASSWORD_STORE_ENABLE_EXTENSIONS true

source ("/data/data/com.termux/files/usr/bin/starship" init fish --print-full-init | psub)
