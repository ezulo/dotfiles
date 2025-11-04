# Wrappers
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias sudo='doas'

# Hyprland
alias hyprlog='tail -f '"$HYPRLAND_LOG_FILE"

# Neovim
alias v='nvim'
alias vim='nvim'

# Zathura
alias z='zathura'

# Git
alias gitc='git commit'
alias gitd='git diff'
alias gitl='git log'
alias gits='git status'
alias gitp='git pull'
# alias gitps='git push'
alias push='git push'

# PlatformIO
alias piols='pio boards'
alias pioinit='pio project init'
alias piomon='pio device monitor'
alias piorun='pio run'
alias pioupload='pio run --target upload'
alias pioclean='pio run --target clean'

# ESP-IDF
alias idf-load='. /opt/esp-idf/export.sh'
alias idf='idf.py'

# Themes
alias theme='themectl get'
alias themes='themectl set'
alias themer='themectl reload'
alias color='themecolor'

# Custom
alias zshconf="nvim ~/.zshrc"
alias cdc="cd ~/.config"

# feh
alias pics="feh --fullscreen -."
