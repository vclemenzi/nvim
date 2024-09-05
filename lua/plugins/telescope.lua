return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    cmd = "Telescope",
    opts = {
      layout_config = {
        vertical = { width = 0.5 },
      }
    },
    keys = {
      { "<leader><space>", "<cmd>Telescope buffers<cr>",                   desc = "Open buffers" },
      { "<leader>?",       "<cmd>Telescope find_files<cr>",                desc = "Open files picker" },
      { "<leader>/",       "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzily search in current buffer" },
    },
  }
}
