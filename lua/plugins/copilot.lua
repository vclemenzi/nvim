return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = true,
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    opts = {}
  },
  {
    "zbirenbaum/copilot-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
    opts = {}
  }
}
