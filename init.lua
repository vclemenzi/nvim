vim.g.mapleader        = ' '
vim.g.maplocalleader   = ' '

vim.opt.relativenumber = true
vim.opt.cursorline     = true

vim.opt.mouse          = 'a'

vim.opt.laststatus     = 3

vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2

vim.o.foldcolumn       = '0'
vim.o.foldlevel        = 999
vim.o.foldlevelstart   = 999
vim.o.foldenable       = true

vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

-- Create splits
vim.keymap.set('n', '<C-s>', '<cmd>split<CR>', { noremap = true, desc = 'Split window horizontally' })
vim.keymap.set('n', '<C-v>', '<cmd>vsplit<CR>', { noremap = true, desc = 'Split window vertically' })

-- Navigate between windows
vim.keymap.set("n", "<C-h>", [[ <C-w>h ]])
vim.keymap.set("n", "<C-l>", [[ <C-w>l ]])
vim.keymap.set("n", "<C-j>", [[ <C-w>j ]])
vim.keymap.set("n", "<C-k>", [[ <C-w>k ]])

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
		{ import = "plugins.lsp" },
	},
})
