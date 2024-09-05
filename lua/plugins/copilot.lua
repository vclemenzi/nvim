return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    opts = {}
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
    opts = {}
  }
}
