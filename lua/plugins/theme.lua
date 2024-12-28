return {
	'sainnhe/gruvbox-material',
	priority = 1000,
	init = function()
		vim.o.background = "dark"
		vim.cmd.colorscheme "gruvbox-material"
	end
}
