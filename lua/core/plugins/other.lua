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
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    cmd = "Spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>S",
        "<cmd>:Spectre<cr>",
        desc = "Search and replace globally"
      },
      {
        "<leader>sp",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Search on current file"
      },
      {
        "<leader>sw",
        mode = "v",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Search current word"
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual()
        end,
        desc = "Search current word"
      }
    }
  }
}
