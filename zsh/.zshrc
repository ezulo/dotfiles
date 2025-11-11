# PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Custom PATH paths
export PATH=$XDG_CONFIG_HOME/scripts:$PATH

# Options
setopt autocd
#setopt interactive_comments
stty stop undef

# History
HISTSIZE=10000000
SAVEHIST=10000000
HIST_STAMPS="mm/dd/yyyy"
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt inc_append_history

# oh-my-zsh
# export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="robbyrussell"
# ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh
# plugins=(git shrink-path)
# source $ZSH/oh-my-zsh.sh

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.utf8
export LC_ALL=en_US.utf8

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# source files
source $XDG_CONFIG_HOME/zsh/env.zsh
source $XDG_CONFIG_HOME/zsh/alias.zsh
source $XDG_CONFIG_HOME/zsh/prompt.zsh


