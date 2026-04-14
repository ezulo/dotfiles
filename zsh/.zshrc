#!/bin/zsh

# Disable partial line marker (the '%' shown for output without trailing newline)
PROMPT_EOL_MARK=''

zstyle :compinstall filename "$ZDOTDIR/.zshrc"
autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
unsetopt beep
unsetopt PROMPT_SP
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line
bindkey  "^[[3~"  delete-char

setopt interactivecomments
# source ~/zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source files
source ~/.config/shell/alias.sh
source ~/.config/shell/env.sh

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Set terminal title to running command (for tmux/terminal)
preexec() { print -Pn "\e]2;$1\a" }
precmd() { print -Pn "\e]2;%~\a" }

# Custom prompt
setopt PROMPT_SUBST
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '[ %F{magenta}%b%f] '
zstyle ':vcs_info:git:*' actionformats '[ %F{magenta}%b%f|%F{red}%a%f] '

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Directory (blue), git branch (magenta), prompt char (green/red based on exit code)
PROMPT='%F{blue}%~%f ${vcs_info_msg_0_}%(?.%F{green}.%F{red})❯%f '

. "$HOME/.local/share/../bin/env"

