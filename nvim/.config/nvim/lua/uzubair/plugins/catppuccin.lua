return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.o.background = 'dark' -- or "light" for light mode
    vim.cmd [[colorscheme catppuccin-mocha]] -- Set color scheme
  end,
}
