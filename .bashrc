#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;37m\]\u@\h \W\$ \[\e[m\]'
# >>> Added by cnchi installer
EDITOR=/usr/local/bin/vim

# aliases
alias ls='ls --color=auto'
alias gitignore-untracked='git status --porcelain | grep '^??' | cut -c4- >> .gitignore'
