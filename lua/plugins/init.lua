return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local conf = require "nvchad.configs.nvimtree"

      conf.view.width = 50

      -- ensure tables exist before modifying
      conf.filters = conf.filters or {}
      conf.git = conf.git or {}

      -- show .env and other dotfiles
      conf.filters.dotfiles = false
      conf.git.ignore = false

      return conf
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Inline git changes (like GitLens)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  -- Full Git UI (like VSCode Source Control)
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true,
        },
      }
    end,
  },

  -- Merge conflict helper
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },

  -- JSX / TSX auto close tags
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true,
  },

  -- React / JS snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- Faster TypeScript tooling
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },

  -- Quick TypeScript compiler
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
      },
    },
  },
}
