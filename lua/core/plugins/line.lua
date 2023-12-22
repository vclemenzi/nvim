return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = 'vscode',
        component_separators = { '|', '|' },
        section_separators = { '', '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'branch', 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
      },
    })
  end,
}
