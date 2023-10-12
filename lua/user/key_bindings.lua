local M = {}

local function set_bufferline_keymaps()
  lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
end

M.config = function()
  set_bufferline_keymaps()
end

return M
