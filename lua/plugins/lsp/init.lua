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
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
}
