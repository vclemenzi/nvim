return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'VimEnter',
    opts = {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
    }
  }
}
