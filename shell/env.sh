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

