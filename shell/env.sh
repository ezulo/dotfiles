export ARCHFLAGS="-arch $(uname -m)"
export MANPATH="/usr/local/man:${MANPATH#/usr/local/man:}"
export LANG=en_US.utf8
export LC_ALL=en_US.utf8
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

export HYPRLAND_LOG_FILE="$XDG_RUNTIME_DIR/hypr/$(ls -t $XDG_RUNTIME_DIR/hypr/ | head -n 1)/hyprland.log"
export KITTY_CONFIG_DIRECTORY=$HOME/.config/kitty
export WAYBAR_CONFIG_DIRECTORY=$HOME/.config/waybar
export HYPRPAPER_CONFIG_DIRECTORY=$HOME/.config/hypr
export THEME_DIR="$HOME/.config/theme"
export THEME="$(cat $THEME_DIR/current-theme)"
export TERM="kitty"

export ZEIT_DB="$HOME/.config/zeit/zeit.db"

# esp-idf
export ESP32_COMPONENT_HOME="$HOME/Projects/esp32/esp32_components"

