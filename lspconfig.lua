return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-cmdline',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local lspui = require 'lspconfig.ui.windows'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'
    local cmp = require 'cmp'
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    cmp.setup {
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
      }, {
        { name = 'buffer' },
      }),
    }

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    })

    --LspInfo Borders
    lspui.default_options.border = 'double'

    -- Managing language servers individually
    -- pyright
    lspconfig.pyright.setup {
      capabilities = capabilities,
    }
    -- tsserver
    lspconfig.tsserver.setup {
      capabilities = capabilities,
    }
    -- rust_analyzer
    lspconfig.rust_analyzer.setup {
      capabilities = capabilities,
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ['rust-analyzer'] = {},
      },
    }

    -- html
    lspconfig.html.setup {
      capabilities = capabilities,
    }
    -- configure emmet language server
    lspconfig.emmet_ls.setup {
      capabilities = capabilities,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
    }

    -- Lua LS
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }

    -- Terraform
    lspconfig.terraformls.setup {
      capabilities = capabilities,
    }

    lspconfig.tflint.setup {
      capabilities = capabilities,
    }

    -- CSS LS
    lspconfig.cssls.setup {
      capabilities = capabilities,
    }

    -- Tailwind
    -- Support for tailwind auto completion
    -- install the tailwind server : "sudo npm install -g @tailwindcss/language-server"
    lspconfig.tailwindcss.setup {
      capabilities = capabilities,
    }
  end,
}
