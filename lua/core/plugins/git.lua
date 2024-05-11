return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
    lazy = true,
    event = "BufRead",
    cmd = "Gitsigns",
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    lazy = true,
  },
}
