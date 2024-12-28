return {
	{
		'j-hui/fidget.nvim',
		opts = {},
		init = function()
			vim.notify = require('fidget').notify
		end,
	},
	{
		'stevearc/dressing.nvim',
		opts = {},
		lazy = true,
		event = 'VeryLazy',
	},
	{
		'nvim-lualine/lualine.nvim',
		lazy = true,
		event = 'VimEnter',
		opts = {
			options = {
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'filename' },
				lualine_c = {
					{
						'branch',
						icon = '',
					},
					{
						'diff',
						symbols = {
							added = ' ',
							modified = '󰜥 ',
							removed = ' ',
						}
					}
				},
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
		}
	},
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		cmd = "Alpha",
		init = function()
			if vim.fn.argc() == 0 then
				vim.cmd("Alpha")
			end
		end,
		config = function()
			local status_ok, alpha = pcall(require, "alpha")

			if not status_ok then
				return
			end

			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"                                   ",
				"                                   ",
				"                                   ",
				"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
				"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
				"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
				"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
				"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
				"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
				"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
				" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
				" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
				"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
				"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
				"                                   ",
			}

			dashboard.section.buttons.val = {
				dashboard.button("e", "  New File", ":enew<CR>"),
				dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
				dashboard.button("h", "  Recently Opened Files", ":Telescope oldfiles<CR>"),
				dashboard.button("p", "  View Loaded Plugins", ":Lazy<CR>"),
				dashboard.button("q", "  How do I exit Vim?", ":qa<CR>"),
			}

			dashboard.section.footer.val = "Talk is cheap. Show me the code"

			alpha.setup(dashboard.opts)
		end
	}
}
