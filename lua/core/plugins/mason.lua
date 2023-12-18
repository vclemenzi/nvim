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
    dependencies = { "neovim/nvim-lspconfig", "lukas-reineke/lsp-format.nvim" },
    config = function()
      local m = require("mason-lspconfig")

      m.setup({
        ensure_installed = {},
      })

      m.setup_handlers({
        function(server)
          require("lspconfig")[server].setup({
            on_attach = function(client)
              require("lsp-format").on_attach(client)
            end,
          })
        end,
      })
    end,
  }
}
