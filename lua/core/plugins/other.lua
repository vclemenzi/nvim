return {
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = true,
    cmd = "VimBeGood",
  },
  {
    "vclemenzi/presence.nvim",
    lazy = true,
    event = "BufRead",
    opts = {
      auto_update        = true,
      neovim_image_text  = "I use Neovim, btw",
      main_image         = "file",
      file_explorer_text = "Browsing files...",
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  }
}
