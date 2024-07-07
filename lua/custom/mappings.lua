local set = vim.keymap.set

set("n", "<C-h>", [[ <C-w>h ]])
set("n", "<C-l>", [[ <C-w>l ]])
set("n", "<C-j>", [[ <C-w>j ]])
set("n", "<C-k>", [[ <C-w>k ]])

set("n", "<M-j>", [[ 10j ]])
set("n", "<M-k>", [[ 10k ]])

set("n", "<M-Left>", [[ <C-w>5< ]])
set("n", "<M-Right>", [[ <C-w>5> ]])
set("n", "<M-Down>", [[ <C-w>- ]])
set("n", "<M-Up>", [[ <C-w>+ ]])

set("n", "<C-s>", [[<cmd>split<CR>]])
set("n", "<C-v>", [[<cmd>vsplit<CR>]])
set("n", "<C-q>", [[<cmd>close<CR>]])
