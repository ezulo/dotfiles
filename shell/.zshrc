#
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

# source files
source $XDG_CONFIG_HOME/zsh/env.zsh
source $XDG_CONFIG_HOME/zsh/alias.zsh
source $XDG_CONFIG_HOME/zsh/prompt.zsh


