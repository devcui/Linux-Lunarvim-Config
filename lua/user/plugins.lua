local M = {}

M.config = function()
  lvim.plugins = {
    -- catppuccin theme
    { "catppuccin/nvim" },
    -- show function signature when you type
    { "ray-x/lsp_signature.nvim" },
    -- intelligently reopen files at your last edit position. By default git, svn, and mercurial commit messages are ignored because you probably want to type a new message and not re-edit the previous one.
    { "vladdoster/remember.nvim" },
    -- todo comments is a lua plugin for Neovim >= 0.8.0 to highlight and search for todo comments like TODO, HACK, BUG in your code base.
    { "folke/todo-comments.nvim" },
    -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
    { "folke/trouble.nvim" },
    -- Leap is a general-purpose motion plugin for Neovim, building and improving primarily on vim-sneak, with the ultimate goal of establishing a new standard interface for moving around in the visible area in Vim-like modal editors. It aims to be consistent, reliable, needs zero configuration, and tries to get out of your way as much as possible.
    { "ggandor/leap.nvim" },
    -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
    { "phaazon/hop.nvim" },
    -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
    -- {"simrat39/symbols-outline.nvim"},
    -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
    { "tzachar/cmp-tabnine" },
    -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing.
    { "folke/twilight.nvim" },
    -- The goal of nvim-bqf is to make Neovim's quickfix window better.
    { "kevinhwang91/nvim-bqf" },
    -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text. It extends vim's % key to language-specific words instead of just single characters.
    -- {"andymass/vim-matchup"},
    -- markdown preview
    { "iamcco/markdown-preview.nvim" },
    -- A plugin to improve your rust experience in neovim.
    { "simrat39/rust-tools.nvim" },
    -- lsp_lines is a simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
    {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      lazy = true,
    },
    -- zen mod
    { "folke/zen-mode.nvim" },
    -- A search panel for neovim.
    { "windwp/nvim-spectre" },
    -- The fastest Neovim colorizer.
    { "norcalli/nvim-colorizer.lua" },
    --  Simple session management for Neovim with git branching, autoloading and Telescope support
    { "olimorris/persisted.nvim" },
    -- Discord Rich Presence for Neovim
    { "andweeb/presence.nvim" },
    -- Extensions for the built-in LSP support in Neovim for eclipse.jdt.ls
    { "mfussenegger/nvim-jdtls" },
    -- Orgmode clone written in Lua for Neovim 0.9+
    { "kristijanhusak/orgmode.nvim" },
    -- A better annotation generator. Supports multiple languages and annotation conventions.
    { "danymat/neogen" },
    -- Vim test
    { "vim-test/vim-test" },
    -- A Lua plugin, written in TypeScript, to write TypeScript (Lua optional).
    { "jose-elias-alvarez/typescript.nvim" },
    --  All the npm/yarn/pnpm commands I don't want to type
    { "vuki656/package-info.nvim" },
    -- VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.
    { "lervag/vimtex" },
    -- An extensible framework for interacting with tests within NeoVim.
    { "nvim-neotest/neotest" },
    { "nvim-neotest/neotest-go" },
    { "nvim-neotest/neotest-python" },
    { "rouge8/neotest-rust" },
    -- flutter tools
    { "akinsho/flutter-tools.nvim" },
    -- cheat.sh integration for neovim in elegant way
    { "RishabhRD/nvim-cheat.sh" },
    -- Clipboard manager neovim plugin with telescope integration
    { "AckslD/nvim-neoclip.lua" },
    {
      "kristijanhusak/vim-dadbod-completion",
    },
    {
      "kristijanhusak/vim-dadbod-ui",
      dependencies = {
        {
          "tpope/vim-dadbod",
          lazy = true,
        },
      },
      lazy = true,
    },
    {
      "karb94/neoscroll.nvim",
    },
    {
      "declancm/cinnamon.nvim",
    },
    {
      "github/copilot.vim",
    },
    {
      "zbirenbaum/copilot.lua",
      dependencies = { "zbirenbaum/copilot-cmp", "nvim-cmp" },
    },
    {
      "ThePrimeagen/harpoon",
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
      },
    },
    {
      "sindrets/diffview.nvim",
    },
    {
      "chipsenkbeil/distant.nvim",
    },
    {
      "abzcoding/nvim-mini-file-icons",
    },
    { "mtdl9/vim-log-highlighting", ft = { "text", "log" } },
    {
      "yamatsum/nvim-cursorline",
    },
    {
      "abecodes/tabout.nvim",
    },
    {
      "kevinhwang91/nvim-hlslens",
    },
    {
      "chrisbra/csv.vim",
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = true,
      dependencies = "nvim-treesitter",
    },
    {
      "sidebar-nvim/sidebar.nvim",
    },
    {
      "skywind3000/asynctasks.vim",
      dependencies = {
        { "skywind3000/asyncrun.vim" },
      },
    },
    {
      "scalameta/nvim-metals",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
      "jbyuki/instant.nvim",
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    {
      "j-hui/fidget.nvim",
    },
    {
      "michaelb/sniprun",
    },
    {
      "liuchengxu/vista.vim",
    },
    {
      "p00f/clangd_extensions.nvim",
    },
    {
      "saecki/crates.nvim",
      dependencies = { { "nvim-lua/plenary.nvim" } },
    },
    {
      "hrsh7th/cmp-cmdline",
    },
    {
      "mrjones2014/legendary.nvim",
    },
    {
      "stevearc/dressing.nvim",
      lazy = true,
    },
    {
      "kdheepak/cmp-latex-symbols",
      dependencies = "hrsh7th/nvim-cmp",
    },
    {
      "ThePrimeagen/refactoring.nvim",
      lazy = true,
    },
    {
      "b0o/incline.nvim",
    },
    {
      "fgheng/winbar.nvim",
    },
    {
      "SmiteshP/nvim-gps",
      dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
      "vimpostor/vim-tpipeline",
    },
    {
      "stevearc/overseer.nvim",
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
      },
    },
    { "MunifTanjim/nui.nvim" },
    {
      "folke/noice.nvim",
      dependencies = {
        "rcarriga/nvim-notify",
      }
    },
    {
      "olexsmir/gopher.nvim",
    },
    {
      "leoluz/nvim-dap-go",
    },
    {
      "AckslD/swenv.nvim",
    },
    {
      "mfussenegger/nvim-dap-python",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      lazy = true,
    },
    {
      "smjonas/inc-rename.nvim",
      lazy = true,
    },
    {
      "m-demare/hlargs.nvim",
      lazy = true,
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
      "cshuaimin/ssr.nvim",
      lazy = true,
    },
    {
      "Civitasv/cmake-tools.nvim",
    },
    {
      "raimon49/requirements.txt.vim",
    },
    {
      "phaazon/mind.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "ibhagwan/fzf-lua" },
    { "folke/flash.nvim" },
    { "piersolenski/wtf.nvim",              dependencies = { "MunifTanjim/nui.nvim", } },
    { "james1236/backseat.nvim" },
    { "lukas-reineke/indent-blankline.nvim" }


  }
end

return M
