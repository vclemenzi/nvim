return {
	{
		'kevinhwang91/nvim-ufo',
		event = 'BufReadPost',
		dependencies = {
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
		'kevinhwang91/promise-async',
		lazy = true,
	}
}
