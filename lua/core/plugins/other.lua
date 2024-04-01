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
    "IogaMaster/neocord",
    lazy = true,
    event = "BufRead",
    opts = {
      auto_update        = true,
      main_image         = "language",
      logo               = nil,
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
