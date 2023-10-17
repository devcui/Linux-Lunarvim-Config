-- Builtin config
-- =========================================
lvim.builtin_tag_provider = "symbols-outline"
lvim.builtin.lastplace = { active = true }

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Additional Keybindings
-- =========================================
require("user.keybindings").config()
