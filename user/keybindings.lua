local M = {}

M.set_wezterm_keybindings = function()
end

M.fzf_projects = function()
end

M.set_terminal_keymaps = function()
end

M.set_hop_keymaps = function()
end

M.set_hop_keymaps = function()
end

local function set_bufferline_keymaps()
  lvim.keys.normal_mode["<S-x>"] = "<Cmd>lua require('user.bufferline').delete_buffer()<CR>"
  lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
end

local function set_harpoon_keymaps()
end

M.set_task_runner_keymaps = function()
end

M.set_lsp_lines_keymap = function()
end

M.config = function()
  if lvim.builtin.bufferline.active then
    set_bufferline_keymaps()
  end
  lvim.builtin.which_key.mappings["T"] = {
    name = " Trouble",
    t = { "<cmd>TodoLocList <cr>", "Todo" },
  }
end

M.set_mind_keymaps = function()
end

return M
