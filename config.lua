lvim.leader = " "
lvim.colorscheme = "catppuccin" -- set to a custom theme
lvim.lsp.code_lens_refresh = true

-- Customization
-- =========================================
lvim.builtin.sell_your_soul_to_devil = { active = true, prada = false, openai = false } -- if you want microsoft to abuse your soul
lvim.builtin.lastplace = { active = true }                                              -- change to false if you are jumping to future

-- Custom User Config
-- =========================================
local user = vim.env.USER
if user and user == "cui" then
  lvim.reload_config_on_save = true
  require("user.custom_user").config()
end

-- Additional Actions Based on Custom User Config
-- =========================================
if lvim.builtin.winbar_provider == "navic" then
  vim.opt.showtabline = 1
  lvim.keys.normal_mode["<tab>"] =
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>"
  lvim.builtin.bufferline.active = false
  lvim.builtin.breadcrumbs.active = true
end

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Additional Keybindings
-- =========================================
require("user.keybindings").config()
