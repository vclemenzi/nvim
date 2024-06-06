return {
  {
    "Eandrju/cellular-automaton.nvim",
    lazy = true,
    cmd = "CellularAutomaton",
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = true,
    cmd = "VimBeGood",
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    setup = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  }
}
