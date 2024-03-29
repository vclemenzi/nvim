return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
    lazy = true,
    cmd = "Octo",
    keys = {
      {
        "<leader>gp",
        "<cmd>Octo pr list<cr>",
        desc = "List pull requests",
      },
      {
        "<leader>gi",
        "<cmd>Octo issue list<cr>",
        desc = "List issues",
      },
    }
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    lazy = true,
  },
}
