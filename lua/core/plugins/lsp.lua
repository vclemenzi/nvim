return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
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
      "zbirenbaum/copilot.lua"
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
        sources = {
          { name = 'copilot' },
          { name = 'nvim_lsp' },
        },
      })

      -- Copilot
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require('copilot_cmp').setup()
    end,
  },
}
