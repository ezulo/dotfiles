# Eduardo's Dotfiles

A set of dotfiles tailored towards Arch Linux (and derivative) distros. Currently tailored for
my workflow in hyprland, and eventually any other Wayland compositors I choose to support.

I attempt to keep these dotfiles as **simple** and **modular** as I humanly can, while keeping
third-party dependencies to an absolute minimum. There are no nice-to-have animations or robust
applications doing the heavy lifting, only very simple configuration for a functional, reliable,
and (most importantly) serviceable Arch Linux desktop system.

Every directory in this repo is most certainly not required; they are simply configurations for
services I'm currently using.

## To-Dos
- Add SwayWM compatibility
- Write ncurses wizard to install dependencies

## Dependencies
What dependencies are required depends on your use case and how much of the submodules in this
repository you choose to use. This list will assume you'd like to use everything contained herein.

**General Dependencies**:
- Wayland + Wayland compositor (currently, `hyprland` is the preferred environment)
- `zsh` for interactive shell
- `bash` for scripts
- `qutebrowser` for vim-like web browsing
- `dunst` for notifications
- `neovim` for text editor
- `kitty` for terminal emulator

**`hypr` (Hyprland Dots) Dependencies**:
- `kitty` for terminal emulator
- `dunst` for notifications
- `pipewire` and `wireplumber` for audio control, and `playerctl` for next/pause/play/prev
- `hypridle` for idle logic
- `wofi` for application launcher
- `thunar` for file explorer
- `neovim` for text editor

**`scripts` (User scripts) Dependencies**:
"themectl / zmenu module" designation simply implies that either zmenu or themectl will attempt to
write config files for these things in `$USER/.config/..` ,but they are not required for any
other purpose unless otherwise stated here.

- `kitty` (themectl module), and for use of [kitty-prompt](scripts/kitty-prompt) script
  (currently only used when creating a new theme via `zmenu theme`)
- `hyprland` (themectl module), configured by zmenu
  [scaling](scripts/include/zmenu/modules/scaling.sh) module and invoked (`hyprctl`) by zmenu
  [session](scripts/include/zmenu/modules/session.sh) module (for logout functionality).
- `hyprlock`, invoked by zmenu [session](scripts/include/zmenu/modules/session.sh) module for
  desktop locking functionality.
- `hyprshot` for [screenshot](scripts/screenshot) script.
- `hyprpaper` (themectl module)
- `waybar` (themectl module)
- `reflector` for [update-mirrots](scripts/update-mirrors) script.
- `dunst` for notifications and [script logging](scripts/include/util/log.sh)
- `jq` for bash JSON file processing
- `bc` for use in the themectl [color script](scripts/include/themectl/color.sh), zmenu
  [calculator](scripts/include/zmenu/modules/calc.sh), [scaling](scripts/include/zmenu/modules/scaling.sh), and
  [unit conversion](scripts/include/zmenu/convert/) modules.
- `wofi` (or similar) for use in zmenu [utils](scripts/include/zmenu/util.sh) 
- `pipewire` + `wireplumber` for zmenu [audio control](scripts/include/zmenu/modules/audio.sh)
- `neovim` for text editor, and for zmenu [notes](scripts/include/zmenu/modules/notes.sh)
- `zeit` for zmenu [tasks](scripts/include/zmenu/modules/tasks.sh) module (may get rid of it)
- `fastfetch` for [fetch](scripts/fetch) script, to support custom fetch icons from theme.

**`nvim` (Neovim dots) Dependencies**:
- `neovim` itself
- `nvim-lazy`
