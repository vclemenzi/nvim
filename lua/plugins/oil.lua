return {
  {
    'stevearc/oil.nvim',
    lazy = false,
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
      { "echasnovski/mini.icons", opts = {} }
    },
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Open file explorer" },
    },
  }
}
