local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup({
  -- FuzzyFinder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },

  -- SyntacAnalysis
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Filer
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/nerdfont.vim",
      "lambdalisue/fern-git-status.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
    }
  },

  -- Registers
  {
    "tversteeg/registers.nvim",
    name = "registers",
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    opts = {}
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  -- Colorschemes
  "EdenEast/nightfox.nvim",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig",
  "onsails/lspkind-nvim",
  "dense-analysis/ale",
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
  },

  -- CMP
  {
    "hrsh7th/nvim-cmp",
    config = function() require("config.cmp") end,
  },
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",

  -- Snipets
  "L3MON4D3/LuaSnip",

  -- Debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  "theHamsta/nvim-dap-virtual-text",

  -- Dashboard
  "glepnir/dashboard-nvim",

  -- Comment
  "terrortylor/nvim-comment",

  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },

  -- Indent-line
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- Splitting/Joining blocks (arrays, dictionaries, etc)
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    options = { use_default_keymaps = false }
  },

  -- Notification
  {
    "folke/noice.nvim",
    -- event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },

  -- Git Operation
  {
    "TimUntersberger/neogit",
    dependencies = 'nvim-lua/plenary.nvim'
  },
  "lewis6991/gitsigns.nvim",

  -- For ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    }
  },

  -- For Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end
  },

  -- For YARA
  "s3rvac/vim-syntax-yara",

  -- For Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
})

require("config.autopairs")
require("config.cmp")
require("config.comment")
require("config.dashboard")
require("config.nightfox")
require("config.fern")
require("config.lspconfig")
require("config.lspsignature")
require("config.lualine")
require("config.mason")
require("config.neogit")
require("config.gitsigns")
require("config.snipets")
require("config.telescope")
require("config.treesitter")
require("config.yara_syntax")
require("config.surround")
require("config.trouble")
require("config.treesj")
require("config.dap")
require("config.noice")
require("config.chatgpt")
require("config.bufferline")
require("config.registers")
