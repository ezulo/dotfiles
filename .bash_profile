#
# ~/.bash_profile
#

export TERMINAL="st"
export EDITOR="vim"
export BROWSER="chromium"
export READER="zathura"

export PATH="$HOME/.scripts:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
