local M = {}

M.config = function()
    lvim.plugins = {{
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
        end
    }, {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("user/lsp_signature").config()
        end,
        event = {"BufRead", "BufNew"}
    }, {
        "vladdoster/remember.nvim",
        config = function()
            require("remember").setup {}
        end,
        enabled = lvim.builtin.lastplace.active
    }, {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("user.todo_comments").config()
        end,
        event = "BufRead"
    }}
end

return M
