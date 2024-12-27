return {
	{
		'neovim/nvim-lspconfig',
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		dependencies = {
			{
				'lukas-reineke/lsp-format.nvim',
				event = 'BufWritePre',
			},
			{
				'hrsh7th/cmp-nvim-lsp',
				event = 'InsertEnter',
			},
			{
				'williamboman/mason-lspconfig.nvim',
				event = 'BufReadPost',
			}
		},
		config = function()
			local ms_lsp = require('mason-lspconfig')

			ms_lsp.setup({
				ensure_installed = {},
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({
							capabilities = require('cmp_nvim_lsp').default_capabilities(),
							on_attach = function(client, bufnr)
								require('lsp-format').on_attach(client, bufnr)
							end
						})
					end,
				}
			})
		end
	},
	{
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
			},
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				opts = {}
			},
			{
				"zbirenbaum/copilot-cmp",
				lazy = true,
				event = "InsertEnter",
				dependencies = {
					'zbirenbaum/copilot.lua',
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
	},
	{
		'williamboman/mason.nvim',
		cmd = { 'MasonInstall', 'MasonUninstall', 'Mason' },
		opts = {
			ui = {
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = ""
				}
			}
		}
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = 'BufReadPost',
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
	{
		'kevinhwang91/nvim-ufo',
		event = 'BufReadPost',
		dependencies = {
			'kevinhwang91/promise-async',
			'nvim-treesitter/nvim-treesitter',
		},
		opts = {
			filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
			provider_selector = function(_, _, _)
				return { 'treesitter', 'indent' }
			end
		}
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
}
