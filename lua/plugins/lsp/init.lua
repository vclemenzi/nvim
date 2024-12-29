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
				'williamboman/mason-lspconfig.nvim',
				event = 'BufReadPost',
			},
			{
				'saghen/blink.cmp',
				event = 'InsertEnter',
			},
			{
				"folke/lazydev.nvim",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local ms_lsp = require('mason-lspconfig')

			ms_lsp.setup({
				ensure_installed = {},
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({
							capabilities = require('blink.cmp').get_lsp_capabilities(),
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
}
