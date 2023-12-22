return {
  'Mofiqul/vscode.nvim',
  priority = 1000,
  config = function()
    vim.o.background = 'dark'
    require('vscode').load()
  end,
}
