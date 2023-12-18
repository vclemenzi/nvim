return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
     require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      columns = {
        "icon",
      },
    })
  end,
  keys = {
    {
       "<leader>e",
       "<cmd>Oil<cr>", 
       desc = "Browse files"
    }
  }
}
