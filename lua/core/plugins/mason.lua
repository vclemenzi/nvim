return {
  {
    "williamboman/mason.nvim",
    init = function()
      require("mason").setup({
        ensure_installed = {
          "prettier",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local m = require("mason-lspconfig")

      m.setup({
        ensure_installed = {},
      })

      m.setup_handlers({
        function(server)
          require("lspconfig")[server].setup({})
        end,
      })
    end,
  }
}
