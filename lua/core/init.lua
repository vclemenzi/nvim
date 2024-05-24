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

require("core.aliases")
require("core.mappings")

-- Plugins
local plugins = {
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
    config = function()
      require("ibl").setup({
        indent = {
          char = "▏",
        },
      })
    end,
  }
}

-- Plugin Manager
local lazy = require("lazy")

local function getConfigFiles()
  local files = {}
  local script_path = vim.fn.stdpath("config") ..
      "/lua/core/plugins"
  local dir_contents = vim.fn.readdir(script_path)
  for _, item in ipairs(dir_contents) do
    if item:match("%.lua$") then
      local config_name = item:match("(.+)%.lua$")
      table.insert(files, "core.plugins." .. config_name)
    end
  end

  return files
end

local config_files = getConfigFiles()

local lazy_configurations = {}

for _, config_name in ipairs(config_files) do
  local config = require(config_name)
  table.insert(lazy_configurations, config)
end

table.insert(lazy_configurations, 1, plugins)

lazy.setup(lazy_configurations)
