return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{
			'hrsh7th/cmp-buffer',
			event = 'InsertEnter',
		},
		{
			'hrsh7th/cmp-nvim-lsp',
			event = 'InsertEnter',
		},
		{
			'hrsh7th/cmp-path',
			event = 'InsertEnter',
		},
		{
			'hrsh7th/cmp-vsnip',
			event = 'InsertEnter',
		},
		{
			'hrsh7th/vim-vsnip',
			event = 'InsertEnter',
		},
		{
			'onsails/lspkind.nvim',
			event = 'InsertEnter',
		},
		{
			'L3MON4D3/LuaSnip',
			event = 'InsertEnter',
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		{
			"zbirenbaum/copilot-cmp",
			lazy = true,
			event = "InsertEnter",
			dependencies = {
				{
					'zbirenbaum/copilot.lua',
					cmd = "Copilot",
					opts = {}
				}
			},
			opts = {}
		}
	},
	opts = function()
		local cmp = require('cmp')

		return {
			sources = {
				{ name = "copilot",  group_index = 2 },
				{ name = 'nvim_lsp', group_index = 2 },
				{ name = "luasnip",  group_index = 2 },
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
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
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
				}),
				documentation = cmp.config.window.bordered({
					documentation = {
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					},
				}),
			},
		}
	end
}
