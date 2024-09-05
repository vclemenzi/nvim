-- Split windows
vim.keymap.set('n', '<C-s>', '<cmd>split<CR>', { noremap = true, desc = 'Split window horizontally' })
vim.keymap.set('n', '<C-v>', '<cmd>vsplit<CR>', { noremap = true, desc = 'Split window vertically' })

-- Navigate between windows
vim.keymap.set("n", "<C-h>", [[ <C-w>h ]])
vim.keymap.set("n", "<C-l>", [[ <C-w>l ]])
vim.keymap.set("n", "<C-j>", [[ <C-w>j ]])
vim.keymap.set("n", "<C-k>", [[ <C-w>k ]])
