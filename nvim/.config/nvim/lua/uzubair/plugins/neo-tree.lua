return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>b', ':Neotree toggle<CR>', { desc = 'Toggle FileSystem' })
    local neotree = require 'neo-tree'
    neotree.setup {
      close_if_last_window = true,
      enable_git_status = true,
      popup_border_style = 'rounded',
    }
  end,
}
