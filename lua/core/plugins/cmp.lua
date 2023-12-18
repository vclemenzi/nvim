return {
  "hrsh7th/nvim-cmp",
  dependencies = { "onsails/lspkind.nvim" },
  init = function()
    local cmp = require("cmp")

    require("cmp").setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "path" },
        { name = "crates" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          Text = "󰚞",
          Method = "",
          Function = "󰊕",
          Constructor = "󱌣",
          Field = "",
          Variable = "",
          Class = "",
          Interface = "",
          Module = "",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        }),
      },
    })
  end,
}
