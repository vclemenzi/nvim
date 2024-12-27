vim.g.mapleader        = ' '
vim.g.maplocalleader   = ' '

vim.opt.relativenumber = true
vim.opt.cursorline     = true

vim.opt.mouse          = 'a'

vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2

vim.o.foldcolumn       = '0'
vim.o.foldlevel        = 999
vim.o.foldlevelstart   = 999
vim.o.foldenable       = true

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})

		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})
