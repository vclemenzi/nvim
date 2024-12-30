return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = 'BufReadPost',
	main = 'nvim-treesitter.configs',
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		}
	}
}
