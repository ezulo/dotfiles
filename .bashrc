#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;37m\]\u@\h \W\$ \[\e[m\]'
# >>> Added by cnchi installer
EDITOR=/usr/local/bin/vim

HOME=/home/eduardo
PATH=$PATH:$HOME/.scripts

XORG=/etc/X11/xorg.conf.d
SERVICES=/etc/systemd/system

# disable pausing terminal
stty -ixon

# aliases
alias ls='ls --color=auto'
alias l='ls -l'
alias gitignore-untracked='git status --porcelain | grep '^??' | cut -c4- >> .gitignore'
alias hibernate='i3lock && systemctl hibernate'
alias mysql='mysql -S /run/mysqld/mysqld.sock'
alias mpv-webcam='mpv av://v4l2:/dev/video0'
#alias calcurse='retry timeout 1 /home/eduardo/.scripts/sync-calcurse && calcurse && retry timeout 1 /home/eduardo/.scripts/sync-calcurse'
alias pac='sudo pacman'
alias dmenu='dmenu -fn "Dina:style=Regular:size=6" -i'
alias ncmp='ncmpcpp'
alias xbindkeys='xbindkeys -f $HOME/.config/xbindkeys/config'
alias clear-vim-swap='rm $HOME/.cache/vim/swap/*'
alias calcurse='calcurse-caldav && calcurse && calcurse-caldav'
alias pow='acpi'
