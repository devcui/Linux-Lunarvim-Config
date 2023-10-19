local M = {}

M.config = function()
  local neoclip_req = { "kkharji/sqlite.lua" }
  lvim.plugins = {
    -- catppuccin theme
    { "catppuccin/nvim" },
    -- show function signature when you type
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user.lsp_signature").config()
      end,
      event = { "BufRead", "BufNew" },
    },
    -- intelligently reopen files at your last edit position. By default git, svn, and mercurial commit messages are ignored because you probably want to type a new message and not re-edit the previous one.
    {
      "vladdoster/remember.nvim",
      config = function()
        require("remember").setup {}
      end,
      enabeld = lvim.builtin.lastplace.active
    },
    -- todo comments is a lua plugin for Neovim >= 0.8.0 to highlight and search for todo comments like TODO, HACK, BUG in your code base.
    {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("user.todo_comments").config()
      end,
      event = "BufRead"
    },
    -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
    {
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup {
          auto_open = false,
          auto_close = true,
          padding = false,
          height = 10,
          use_diagnostic_signs = true,
        }
      end,
      event = "VeryLazy",
      cmd = "Trouble",
    },
    -- Leap is a general-purpose motion plugin for Neovim, building and improving primarily on vim-sneak, with the ultimate goal of establishing a new standard interface for moving around in the visible area in Vim-like modal editors. It aims to be consistent, reliable, needs zero configuration, and tries to get out of your way as much as possible. { "ggandor/leap.nvim" },
    {
      "ggandor/leap.nvim",
      config = function()
        require("user.leap").config()
      end,
      enabled = lvim.builtin.motion_provider == "leap",
    },
    -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
    {
      "phaazon/hop.nvim",
      event = "VeryLazy",
      cmd = { "HopChar1CurrentLineAC", "HopChar1CurrentLineBC", "HopChar2MW", "HopWordMW" },
      config = function()
        require("user.hop").config()
      end,
      enabled = lvim.builtin.motion_provider == "hop",
    },
    -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("user.symbols_outline").config()
      end,
      event = "BufReadPost",
      enabled = lvim.builtin_tag_provider == "symbols-outline",
    },
    -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
    {
      "tzachar/cmp-tabnine",
      build = "./install.sh",
      dependencies = "hrsh7th/nvim-cmp",
      config = function()
        local tabnine = require "cmp_tabnine.config"
        tabnine:setup {
          max_lines = 1000,
          max_num_results = 10,
          sort = true,
        }
      end,
      lazy = true,
      event = "InsertEnter",
      enabled = lvim.builtin.tabnine.active,
    },
    -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing.
    {
      "folke/twilight.nvim",
      lazy = true,
      config = function()
        require("user.twilight").config()
      end,
    },
    -- The goal of nvim-bqf is to make Neovim's quickfix window better.
    {
      "kevinhwang91/nvim-bqf",
      event = "WinEnter",
      config = function()
        require("user.bqf").config()
      end,
    },
    -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text. It extends vim's % key to language-specific words instead of just single characters.
    -- {"andymass/vim-matchup"},
    -- markdown preview
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      ft = "markdown",
    },
    -- A plugin to improve your rust experience in neovim.
    {
      "simrat39/rust-tools.nvim",
      lazy = true,
      config = function()
        require("user.rust_tools").config()
      end,
      ft = { "rust", "rs" },
      enabled = lvim.builtin.rust_programming.active,
    },
    -- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
    {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      lazy = true,
      config = function()
        require("lsp_lines").setup()
      end,
      enabled = lvim.builtin.lsp_lines,
    },
    -- zen mod
    {
      "folke/zen-mode.nvim",
      lazy = true,
      cmd = "ZenMode",
      config = function()
        require("user.zen").config()
      end,
    },
    -- A search panel for neovim.
    {
      "windwp/nvim-spectre",
      lazy = true,
      config = function()
        require("user.spectre").config()
      end,
    },
    -- The fastest Neovim colorizer.
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
      event = "BufReadPre",
    },
    --  Simple session management for Neovim with git branching, autoloading and Telescope support
    {
      "olimorris/persisted.nvim",
      event = "BufReadPre",
      lazy = true,
      config = function()
        require("user.persist").config()
      end,
      enabled = lvim.builtin.persistence.active,
    },
    -- Discord Rich Presence for Neovim
    -- { "andweeb/presence.nvim" },
    -- Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls
    { "mfussenegger/nvim-jdtls", ft = "java" },
    -- Orgmode clone written in Lua for Neovim 0.9+
    {
      "kristijanhusak/orgmode.nvim",
      keys = { "go", "gC" },
      ft = { "org" },
      config = function()
        require("user.orgmode").setup()
      end,
      enabled = lvim.builtin.orgmode.active,
    },
    -- A better annotation generator. Supports multiple languages and annotation conventions.
    {
      "danymat/neogen",
      lazy = true,
      config = function()
        require("neogen").setup {
          enabled = true,
        }
      end,
      dependencies = "nvim-treesitter/nvim-treesitter",
    },
    -- Vim test
    {
      "vim-test/vim-test",
      cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
      config = function()
        require("user.vim_test").config()
      end,
      enabled = (lvim.builtin.test_runner.active and lvim.builtin.test_runner.runner == "ultest"),
    },
    -- A Lua plugin, written in TypeScript, to write TypeScript (Lua optional).
    {
      "jose-elias-alvarez/typescript.nvim",
      ft = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      lazy = true,
      config = function()
        require("user.tss").config()
      end,
      enabled = lvim.builtin.web_programming.active,
    },
    --  All the npm/yarn/pnpm commands I don't want to type
    {
      "vuki656/package-info.nvim",
      config = function()
        require("package-info").setup()
      end,
      lazy = true,
      event = { "BufReadPre", "BufNew" },
      enabled = lvim.builtin.web_programming.active,
    },
    -- VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.
    {
      "lervag/vimtex",
      init = function()
        require("user.tex").init()
      end,
      config = function()
        vim.cmd "call vimtex#init()"
      end,
      ft = "tex",
      event = "VeryLazy",
      enabled = lvim.builtin.latex.active,
    },
    -- An extensible framework for interacting with tests within NeoVim.
    {
      "nvim-neotest/neotest",
      config = function()
        require("user.ntest").config()
      end,
      dependencies = {
        { "nvim-neotest/neotest-plenary" },
      },
      event = { "BufReadPost", "BufNew" },
      enabled = (lvim.builtin.test_runner.active and lvim.builtin.test_runner.runner == "neotest"),
    },
    { "nvim-neotest/neotest-go",     event = { "BufEnter *.go" } },
    { "nvim-neotest/neotest-python", event = { "BufEnter *.py" } },
    { "rouge8/neotest-rust",         event = { "BufEnter *.rs" } },
    -- flutter tools
    {
      "akinsho/flutter-tools.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("user.flutter_tools").config()
      end,
      ft = "dart",
    },
    -- cheat.sh integration for neovim in elegant way
    {
      "RishabhRD/nvim-cheat.sh",
      dependencies = "RishabhRD/popfix",
      config = function()
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
      lazy = true,
      cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
      keys = "<leader>?",
      enabled = lvim.builtin.cheat.active,
    },
    -- Clipboard manager neovim plugin with telescope integration
    {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("user.neoclip").config()
      end,
      lazy = true,
      keys = "<leader>y",
      dependencies = neoclip_req,
      enabled = lvim.builtin.neoclip.active,
    },
    -- Database auto completion powered by vim-dadbod.
    { "kristijanhusak/vim-dadbod-completion", enabled = lvim.builtin.sql_integration.active },
    {
      "kristijanhusak/vim-dadbod-ui",
      cmd = {
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUI",
        "DBUIFindBuffer",
        "DBUIRenameBuffer",
      },
      init = function()
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_show_database_icon = 1
      end,
      dependencies = {
        {
          "tpope/vim-dadbod",
          lazy = true,
        },
      },
      lazy = true,
      enabled = lvim.builtin.sql_integration.active,
    },
    -- Smooth scrolling neovim plugin written in lua
    {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup {
          easing_function = "quadratic",
          hide_cursor = true,
        }
      end,
      event = "BufRead",
      enabled = lvim.builtin.smooth_scroll == "neoscroll",
    },
    -- Smooth scrolling for ANY movement command 🤯. A Neovim plugin written in Lua!
    {
      "declancm/cinnamon.nvim",
      config = function()
        require("cinnamon").setup {
          default_keymaps = true,
          default_delay = 4,
          extra_keymaps = true,
          extended_keymaps = false,
          centered = true,
          scroll_limit = 100,
        }
      end,
      event = "BufRead",
      enabled = lvim.builtin.smooth_scroll == "cinnamon",
    },
    {
      "github/copilot.vim",
      config = function()
        require("user.copilot").config()
      end,
      enabled = lvim.builtin.sell_your_soul_to_devil.active or lvim.builtin.sell_your_soul_to_devil.prada,
    },
    {
      "zbirenbaum/copilot.lua",
      dependencies = { "zbirenbaum/copilot-cmp", "nvim-cmp" },
      config = function()
        local cmp_source = { name = "copilot", group_index = 2 }
        table.insert(lvim.builtin.cmp.sources, cmp_source)
        vim.defer_fn(function()
          require("copilot").setup()
        end, 100)
      end,
      enabled = lvim.builtin.sell_your_soul_to_devil.prada,
    },
    --  Getting you where you want with the fewest keystrokes.
    {
      "ThePrimeagen/harpoon",
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
      },
      enabled = lvim.builtin.harpoon.active,
    },
    {
      "sindrets/diffview.nvim",
      lazy = true,
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
      keys = { "<leader>gd", "<leader>gh" },
      config = function()
        require("user.diffview").config()
      end,
      enabled = lvim.builtin.fancy_diff.active,
    },
    -- About 🚧 (Alpha stage software) Edit files, run programs, and work with LSP on a remote machine from the comfort of your local environment 🚧
    {
      "chipsenkbeil/distant.nvim",
      lazy = true,
      build = { "DistantInstall" },
      cmd = { "DistantLaunch", "DistantRun" },
      config = function()
        require("distant").setup {
          ["*"] = vim.tbl_extend(
            "force",
            require("distant.settings").chip_default(),
            { mode = "ssh" } -- use SSH mode by default
          ),
        }
      end,
      enabled = lvim.builtin.remote_dev.active,
    },
    -- icons
    {
      "abzcoding/nvim-mini-file-icons",
      config = function()
        require("nvim-web-devicons").setup()
      end,
      enabled = lvim.builtin.custom_web_devicons or not lvim.use_icons,
    },
    { "mtdl9/vim-log-highlighting",           ft = { "text", "log" } },
    { "yamatsum/nvim-cursorline" },
    { "abecodes/tabout.nvim" },
    { "kevinhwang91/nvim-hlslens" },
    { "chrisbra/csv.vim" },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = true,
      dependencies =
      "nvim-treesitter"
    },
    { "sidebar-nvim/sidebar.nvim" },
    { "skywind3000/asynctasks.vim",                dependencies = { { "skywind3000/asyncrun.vim" } } },
    { "scalameta/nvim-metals",                     dependencies = { "nvim-lua/plenary.nvim" } },
    { "jbyuki/instant.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "j-hui/fidget.nvim" },
    { "michaelb/sniprun" },
    { "liuchengxu/vista.vim" },
    { "p00f/clangd_extensions.nvim" },
    { "saecki/crates.nvim",                        dependencies = { { "nvim-lua/plenary.nvim" } } },
    { "hrsh7th/cmp-cmdline" },
    { "mrjones2014/legendary.nvim" },
    { "stevearc/dressing.nvim",                    lazy = true },
    { "kdheepak/cmp-latex-symbols",                dependencies = "hrsh7th/nvim-cmp" },
    { "ThePrimeagen/refactoring.nvim",             lazy = true },
    { "b0o/incline.nvim" },
    { "fgheng/winbar.nvim" },
    { "SmiteshP/nvim-gps",                         dependencies = "nvim-treesitter/nvim-treesitter" },
    { "vimpostor/vim-tpipeline" },
    { "stevearc/overseer.nvim" },
    { "nvim-neo-tree/neo-tree.nvim",               dependencies = { "MunifTanjim/nui.nvim" } },
    { "MunifTanjim/nui.nvim" },
    { "folke/noice.nvim",                          dependencies = { "rcarriga/nvim-notify" } },
    { "olexsmir/gopher.nvim" },
    { "leoluz/nvim-dap-go" },
    { "AckslD/swenv.nvim" },
    { "mfussenegger/nvim-dap-python" },
    { "mxsdev/nvim-dap-vscode-js",                 lazy = true },
    { "smjonas/inc-rename.nvim",                   lazy = true },
    {
      "m-demare/hlargs.nvim",
      lazy = true,
      dependencies = {
        "nvim-treesitter/nvim-treesitter" }
    },
    { "cshuaimin/ssr.nvim",                 lazy = true, },
    { "Civitasv/cmake-tools.nvim" },
    { "raimon49/requirements.txt.vim" },
    { "phaazon/mind.nvim",                  dependencies = { "nvim-lua/plenary.nvim" }, },
    { "ibhagwan/fzf-lua" },
    { "folke/flash.nvim" },
    { "piersolenski/wtf.nvim",              dependencies = { "MunifTanjim/nui.nvim" } },
    { "james1236/backseat.nvim" },
    { "lukas-reineke/indent-blankline.nvim" }
  }
end

return M
