#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\u@\h \W\$ '
# >>> Added by cnchi installer
EDITOR=/usr/bin/nano

# aliases
alias ls='ls --color=auto'
alias gitignore-untracked='git status --porcelain | grep '^??' | cut -c4- >> .gitignore'
