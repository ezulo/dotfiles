local M = {}

M.terminal = "alacritty"
M.launcher = os.getenv("HOME") .. "/.config/scripts/dmenu-wrapper"
M.editor = os.getenv("EDITOR") or "nano"
M.editor_cmd = M.terminal .. " -e " .. M.editor
M.modkey = "Mod4"

return M
