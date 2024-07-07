vim.o.hlsearch        = false
vim.o.ignorecase      = true
vim.o.smartcase       = true
vim.opt.termguicolors = true
vim.wo.relativenumber = true
vim.opt.cursorline    = true
vim.opt.cursorlineopt = "number"
vim.o.timeout         = true
vim.o.timeoutlen      = 500
vim.opt.tabstop       = 2
vim.opt.shiftwidth    = 2
vim.opt.expandtab     = true
vim.opt.laststatus    = 3
vim.api.nvim_set_option("clipboard", "unnamedplus")

require("custom.aliases")
require("custom.mappings")

-- Plugin Manager
require("lazy").setup(
  { import = "custom/plugins" }, 
  {
    'neovim/nvim-lspconfig',
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {}
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufReadPre",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
    }
  }
)
