return {
  {
    "Eandrju/cellular-automaton.nvim",
    event = "BufRead",
  },
  {
    "ThePrimeagen/vim-be-good"
  },
  {
    "vclemenzi/presence.nvim",
    config = function()
      require("presence").setup({
        auto_update        = true,
        neovim_image_text  = "I use Neovim, btw",
        main_image         = "file",
        file_explorer_text = "Browsing files...",
      })
    end,
  }
}
