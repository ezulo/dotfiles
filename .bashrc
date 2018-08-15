#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;37m\]\u@\h \W\$ \[\e[m\]'
# >>> Added by cnchi installer
EDITOR=/usr/local/bin/vim

stty -ixon

# aliases
alias ls='ls --color=auto'
alias l='ls -l'
alias gitignore-untracked='git status --porcelain | grep '^??' | cut -c4- >> .gitignore'
alias hibernate='systemctl hibernate'
alias mysql='mysql -S /run/mysqld/mysqld.sock'
alias mpv-webcam='mpv av://v4l2:/dev/video0'

