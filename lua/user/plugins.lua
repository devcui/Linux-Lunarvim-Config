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
    }, {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                auto_open = false,
                auto_close = true,
                padding = false,
                height = 10,
                use_diagnostic_signs = true
            }
        end,
        event = "VeryLazy",
        cmd = "Trouble"
    }, {
        "ggandor/leap.nvim",
        config = function()
            require("user.leap").config()
        end,
        enabled = lvim.builtin.motion_provider == "leap"
    }}
end

return M
