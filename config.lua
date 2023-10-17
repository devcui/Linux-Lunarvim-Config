-- Builtin config
-- =========================================
lvim.builtin_tag_provider = "symbols-outline"
lvim.builtin.lastplace = { active = true }
lvim.builtin.motion_provider = "hop"
lvim.builtin.tabnine = { active = true }
lvim.builtin.rust_programming = { active = true }
lvim.builtin.lsp_lines = true
lvim.builtin.tmux_lualine = true
lvim.builtin.indentlines = { active = true }

-- Additional Plugins
-- =========================================
require("user.plugins").config()


-- Additional Keybindings
-- =========================================
require("user.keybindings").config()
