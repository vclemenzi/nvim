vim.cmd.colorscheme 'catppuccin-mocha'

vim.o.hlsearch       = false
vim.opt.laststatus   = 3

vim.o.foldcolumn     = '0'
vim.o.foldlevel      = 999
vim.o.foldlevelstart = 999
vim.o.foldenable     = true

require('config.keymaps')
