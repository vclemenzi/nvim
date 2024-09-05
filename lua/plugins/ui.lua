return {
  {
    'rcarriga/nvim-notify',
    lazy = true,
    event = 'VeryLazy',
    init = function()
      vim.notify = require("notify")
    end
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
    lazy = true,
    event = 'VeryLazy',
  }
}
