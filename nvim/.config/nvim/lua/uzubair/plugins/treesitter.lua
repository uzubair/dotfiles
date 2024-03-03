return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'html',
          'lua',
          'markdown',
          'markdown_inline',
          'vim',
          'vimdoc',
          'lua',
          'css',
          'javascript',
          'typescript',
          'python',
          'go',
          'hcl',
          'terraform',
          'yaml',
          'json',
          'graphql',
          'make',
          'toml',
          'sql',
          'java',
          'jq',
          'jsonnet',
          'kotlin',
          'make',
          'dockerfile',
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
