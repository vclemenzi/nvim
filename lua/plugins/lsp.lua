return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    event = 'BufEnter',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'onsails/lspkind.nvim',
      'L3MON4D3/LuaSnip',
      'lukas-reineke/lsp-format.nvim',
    },
    opts = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = function(client, bufnr)
          lsp_zero.default_keymaps({ buffer = bufnr })
          require('lsp-format').on_attach(client, bufnr)
        end,
        preserve_mappings = false,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = "copilot",  group_index = 2 },
          { name = 'nvim_lsp', group_index = 2 },
          { name = "luasnip",  group_index = 2 },
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace,
          }),
          ['<C-Space>'] = cmp.mapping.complete(),

          ['<S-j>'] = cmp.mapping.select_next_item(),
          ['<S-k>'] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping.close(),
        }),
        formatting = {
          format = require('lspkind').cmp_format({
            symbol_map = { Copilot = "" }
          })
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
      })

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })

      return {}
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = function()
      require('nvim-treesitter.configs').setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })

      return {}
    end
  },
}
