return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {},
		lazy = true,
		cmd = "Telescope",
		opts = {
			layout_config = {
				vertical = { width = 0.5 },
			},
			file_ignore_patterns = {
				"node_modules",
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
				buffers = {
					sort_lastused = true,
					theme = "dropdown",
					previewer = false,
				},
				current_buffer_fuzzy_find = {
					theme = "dropdown",
					previewer = false,
				},
				oldfiles = {
					theme = "dropdown",
					previewer = false,
				},
			},
		},
		keys = {
			{ "<leader><space>", "<cmd>Telescope buffers<cr>",                   desc = "Open buffers" },
			{ "<leader>?",       "<cmd>Telescope find_files<cr>",                desc = "Open files picker" },
			{ "<leader>/",       "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzily search in current buffer" },
		},
	},
	{
		'nvim-lua/plenary.nvim',
		lazy = true,
	}
}
