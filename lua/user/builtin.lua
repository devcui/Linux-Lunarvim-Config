local M = {}
local kind = require "user.lsp_kind"
M.default_diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = kind.icons.error },
      { name = "DiagnosticSignWarn",  text = kind.icons.warn },
      { name = "DiagnosticSignInfo",  text = kind.icons.info },
      { name = "DiagnosticSignHint",  text = kind.icons.hint },
    },
  },
  virtual_text = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    source = "if_many",
    header = "",
    prefix = "",
    border = {
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
    },
    format = function(d)
      local t = vim.deepcopy(d)
      local code = d.code or (d.user_data and d.user_data.lsp.code)
      for _, table in pairs(M.codes) do
        if vim.tbl_contains(table, code) then
          return table.message
        end
      end
      return t.message
    end,
  },
}

return M
