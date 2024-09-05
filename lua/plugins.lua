return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    opts = {
      indent = { char = "▏" },
    },
  },
  {
    'm4xshen/autoclose.nvim',
    event = 'InsertEnter',
    opts = {}
  },
}
