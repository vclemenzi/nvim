return {
  {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    lazy = true,
    event = 'VimEnter',
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      columns = {
        "icon",
      },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons", opts = {}, lazy = true }
    },
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Open file explorer" },
    },
  }
}
