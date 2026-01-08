#!/bin/bash
# Custom taskbar for waybar - shows windows in current workspace
# Event-driven using Hyprland IPC socket

TITLE_MAX_LEN=30

# Map app titles to nerd font icons (shell applications)
icon_by_title() {
  local title="$1"
  case "${title,,}" in
    nvim*) echo "" ;;
    launcher*) echo "󰈸" ;;
    btop|htop) echo "󰨇" ;;
    notes) echo "" ;;
    session) echo "󰐥" ;;
    bash|zsh|fish) echo "" ;;
    *) echo "" ;;
  esac
}

# Map app classes to nerd font icons
icon_by_class() {
    local class="$1"
    case "$class" in
        firefox|librewolf|floorp) echo "" ;;
        zen-browser|zen) echo "󰰶" ;;
        chromium|google-chrome*|brave*) echo "󰖟" ;;
        alacritty|kitty|ghostty) echo "";;
        code|code-oss|vscodium) echo "󰨞" ;;
        bruno|insomnia|postman) echo "" ;;
        thunar|nautilus|dolphin|nemo|pcmanfm) echo "" ;;
        spotify) echo "" ;;
        discord) echo "󰙯" ;;
        slack) echo "󰒱" ;;
        steam) echo "" ;;
        gimp) echo "" ;;
        krita) echo "" ;;
        *inkscape*) echo "" ;;
        blender) echo "󰂫" ;;
        obs) echo "" ;;
        mpv|vlc|celluloid) echo "" ;;
        zathura|evince|okular) echo "󰈙" ;;
        qutebrowser) echo "󰖟" ;;
        libreoffice|soffice) echo "󰈙" ;;
        libreoffice-calc) echo "" ;;
        libreoffice-draw) echo "" ;;
        libreoffice-impress) echo "" ;;
        libreoffice-write) echo "" ;;
        godot*) echo "" ;;
        unity*) echo "" ;;
        jetbrains-studio) echo "󰀴" ;;
        SFML*) echo "" ;;
        *) echo "󰣆" ;;
    esac
}

truncate_title() {
    local title="$1"
    local max_len="${TITLE_MAX_LEN:-20}"
    if [ ${#title} -gt $max_len ]; then
        echo "${title:0:$((max_len-1))}…"
    else
        echo "$title"
    fi
}

output_taskbar() {
    local workspace_id
    workspace_id=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.id')

    if [ -z "$workspace_id" ] || [ "$workspace_id" = "null" ]; then
        echo '{"text": "", "tooltip": "No workspace"}'
        return
    fi

    local clients
    clients=$(hyprctl clients -j 2>/dev/null | jq -c --argjson ws "$workspace_id" '[.[] | select(.workspace.id == $ws and .mapped == true)]')

    local count
    count=$(echo "$clients" | jq 'length')

    if [ "$count" -eq 0 ]; then
        echo '{"text": "", "tooltip": "No windows"}'
        return
    fi

    local text=""
    local tooltip="Windows in workspace $workspace_id:\n"
    local focused_addr
    focused_addr=$(hyprctl activewindow -j 2>/dev/null | jq -r '.address')

    local sep
    sep=""
    while IFS= read -r client; do
        local class title addr
        class=$(echo "$client" | jq -r '.class')
        title=$(echo "$client" | jq -r '.title' | xargs)
        addr=$(echo "$client" | jq -r '.address')

        local icon
        icon=$(icon_by_title "$title")
        if [ -z "$icon" ]; then icon=$(icon_by_class "$class"); fi

        local short_title
        short_title=$(truncate_title "$title")

        base_text="$icon $short_title"
        if [ "$addr" = "$focused_addr" ]; then
            text+="$sep <span weight='bold' underline='single'>$base_text</span> "
        else
            text+="$sep <span weight='bold'>$base_text</span> "
        fi
        sep="|"
        tooltip+="• $class: $title\n"
    done < <(echo "$clients" | jq -c '.[]')

    text="${text% }"
    tooltip="${tooltip%\\n}"

    printf '{"text": "%s", "tooltip": "%s", "class": "has-windows"}\n' "$text" "$tooltip"
}

# Output initial state
output_taskbar

# Listen for relevant Hyprland events
SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - "UNIX-CONNECT:$SOCKET" 2>/dev/null | while read -r event; do
    case "$event" in
        activewindow*|openwindow*|closewindow*|movewindow*|workspace*|windowtitle*)
            output_taskbar
            ;;
    esac
done
