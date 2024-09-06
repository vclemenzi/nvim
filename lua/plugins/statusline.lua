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
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = {
          {
            'branch',
            icon = '',
          },
          {
            'diff',
            symbols = {
              added = ' ',
              modified = ' ',
              removed = ' ',
            }
          }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  }
}
