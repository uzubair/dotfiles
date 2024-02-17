return {
  { 'tpope/vim-surround', lazy = false },
  { 'tpope/vim-repeat', lazy = false },
  { 'tpope/vim-obsession', lazy = false },
  { 'tpope/vim-fugitive', lazy = false },
  { 'tpope/vim-rhubarb', lazy = false },
  { 'szw/vim-maximizer', lazy = false },
  { 'cljoly/telescope-repo.nvim', lazy = false },
  { 'camgraff/telescope-tmux.nvim', lazy = false },
  { 'mbbill/undotree' },
  { 'nvim-telescope/telescope-live-grep-args.nvim' },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
  },
  {
    'aaronhallaert/advanced-git-search.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tpope/vim-fugitive',
      'tpope/vim-rhubarb',
    },
  }, -- { 'christoomey/vim-tmux-navigtor', lazy = false },
}
