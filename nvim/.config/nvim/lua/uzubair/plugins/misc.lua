return {
  { 'tpope/vim-sleuth', lazy = false },
  { 'tpope/vim-surround', lazy = false },
  { 'tpope/vim-repeat', lazy = false },
  { 'tpope/vim-obsession', lazy = false },
  { 'tpope/vim-fugitive', event = 'VeryLazy' },
  { 'tpope/vim-rhubarb', lazy = false },
  { 'szw/vim-maximizer', lazy = true },
  { 'cljoly/telescope-repo.nvim', event = 'VeryLazy' },
  { 'camgraff/telescope-tmux.nvim', event = 'VeryLazy' },
  { 'mbbill/undotree', event = 'VeryLazy' },
  { 'nvim-telescope/telescope-live-grep-args.nvim', event = 'VeryLazy' },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'theprimeagen/harpoon', opts = {} },
  { 'stevearc/dressing.nvim', opts = {}, event = 'VeryLazy' },
  {
    'aaronhallaert/advanced-git-search.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tpope/vim-fugitive',
      'tpope/vim-rhubarb',
    },
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require 'notify'
      vim.opt.termguicolors = true
      vim.notify = require 'notify'
      notify.setup {
        minimum_width = 50,
        background_colour = '#1d2021',
        stages = 'fade',
        timeout = 2000,
        fps = 60,
      }
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
}
