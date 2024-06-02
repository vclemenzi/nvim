return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    event = 'VimEnter',
    lazy = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim",
      "lukas-reineke/lsp-format.nvim",
      "zbirenbaum/copilot-cmp",
      "zbirenbaum/copilot.lua",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    },
    config = function()
      local zero = require("lsp-zero")

      zero.on_attach(function(client, bufnr)
        zero.default_keymaps({ buffer = bufnr })

        if client.supports_method('textDocument/formatting') then
          require('lsp-format').on_attach(client)
        end
      end)

      -- Mason
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
          zero.default_setup,
        },
      })

      -- CMP
      local cmp = require("cmp")
      local lspkind = require('lspkind')

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace,
          }),
          ["<C-Space>"] = cmp.mapping.complete(),

          ["<S-j>"] = cmp.mapping.select_next_item(),
          ["<S-k>"] = cmp.mapping.select_prev_item(),
          ["<C-e>"] = cmp.mapping.close(),
        }),
        formatting = {
          format = lspkind.cmp_format({
            symbol_map = { Copilot = "" }
          }),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        sources = {
          { name = 'copilot' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      })

      -- Copilot
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require('copilot_cmp').setup()

      -- Snippets
      local luasnip = require('luasnip')

      require("luasnip.loaders.from_vscode").lazy_load()

      local s = luasnip.snippet
      local t = luasnip.text_node
      local i = luasnip.insert_node

      -- Error handling for go
      -- if err != nil {
      --   |
      -- }
      luasnip.add_snippets("go", {
        s("error", {
          t({ "if err != nil {", "  " }),
          i(0),
          t({ "", "}" }),
        }),
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end,
  },
  {
    'andersevenrud/nvim_context_vt',
    after = 'nvim-treesitter',
    lazy = true,
    event = 'BufRead',
    opts = {},
  },
  {
    'folke/neodev.nvim',
    lazy = true,
    event = 'BufRead',
    opts = {},
  }
}
