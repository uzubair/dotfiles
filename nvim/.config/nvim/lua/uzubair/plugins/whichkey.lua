return {
  'folke/which-key.nvim',
  dependencies = {
    'akinsho/toggleterm.nvim',
  },

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require 'which-key'
    wk.setup {
      window = {
        border = 'double',
      },
    }

    local terminal = require('toggleterm.terminal').Terminal
    local toggle_float = function()
      local float = terminal:new { direction = 'float' }
      return float:toggle()
    end

    local toggle_lazygit = function()
      local lazygit = terminal:new { cmd = 'lazygit', direction = 'float' }
      return lazygit:toggle()
    end

    -- Keymaps
    local mappings = {
      -- Telescope
      f = {
        name = 'Telescope',
        g = { ':Telescope git_files', 'Search Git Files' },
        a = { '<cmd>AdvancedGitSearch<cr>', 'AdvancedGitSearch' },
        n = { '<cmd>Telescope neoclip<cr>', 'Telescope neoclip' },
        b = { ':Telescope git_branches', 'Search Git Branches' },
        o = { ':Telescope repo list', 'Search Git Repos' },
        p = { ':Telescope projects', 'Search Projects' },
        h = { ':Telescope harpoon marks', 'Search Harpoon Marks' },
      },
      -- Windows & Tab management
      w = {
        name = 'Windows & Tabs',
        -- Windows
        v = { ':vsplit<cr>', 'Split Vertically' },
        h = { ':split<cr>', 'Split Vertically' },
        i = { ':vertical resize +20<CR>', 'Vertical resize +20' },
        d = { ':vertical resize -20<CR>', 'Vertical resize -20' },
        e = { '<C-w>=', 'Make split windows equal in width and height' },
        q = { ':close<CR>', 'Close the current window' },
        -- Tabs
        o = { ':tabnew<CR>', 'Open wew tab' },
        n = { ':tabn<CR>', 'Go to next tab' },
        p = { ':tabp<CR>', 'Go to previous tab' },
        x = { ':tabclose<CR>', 'Close current tab' },
        -- Vim-Maximizer: Mazimize split window
        m = { ':MaximizerToggle<CR>' },
        -- Tagbar for function list
        f = { ':TagbarToggle<cr>', 'Functions List Tagbar' },
      },

      -- Harpoon
      m = {
        name = 'Harpoon Marks',
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", 'Add file' },
        r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", 'Remove file' },
        m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", 'Menu' },
        n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", 'Next file' },
        p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", 'Previous file' },
        ['1'] = { "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", 'File 1' },
        ['2'] = { "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", 'File 2' },
        ['3'] = { "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", 'File 3' },
        ['4'] = { "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", 'File 4' },
        ['5'] = { "<cmd> lua require('harpoon.ui').nav_file(5)<cr>", 'File 5' },
        ['6'] = { "<cmd> lua require('harpoon.ui').nav_file(6)<cr>", 'File 6' },
        ['7'] = { "<cmd> lua require('harpoon.ui').nav_file(7)<cr>", 'File 7' },
        ['8'] = { "<cmd> lua require('harpoon.ui').nav_file(8)<cr>", 'File 8' },
        ['9'] = { "<cmd> lua require('harpoon.ui').nav_file(9)<cr>", 'File 9' },
      },

      -- Notes using Obsidian
      n = {
        name = 'Obsidian',
        o = { ':ObsidianOpen<CR>', 'Obsidian Open' },
        b = { ':ObsidianBacklinks<CR>', 'Obsidian Backlinks' },
        c = { ':ObsidianToday<CR>', 'Obsidian Today' },
        t = { ':ObsidianTomorrow<CR>', 'Obsidian Tomorrow' },
        y = { ':ObsidianYesterday<CR>', 'Obsidian Yesterday' },
        s = { ':ObsidianSearch<CR>', 'Obsidian Search' },
      },      
      
      -- Markdown
      p = {
        name = 'Markdown controls',
        p = { ':<C-U>MarkdownPreview<CR>', 'Start Preview Markdown' },
        s = { ':<C-U>MarkdownPreviewStop<CR>', 'Stop Markdown Preview' },
      },

      -- Refactor
      r = {
        name = 'Refactor Code',
        -- n = { ':IncRename', 'Rename' },
        r = { mode = { 'n', 'x' }, prefix = "<cmd>lua require('telescope').extensions.refactoring.refactors()", desc = 'Refactor' },
      },      
      
      -- Terminal
      t = {
        name = 'Terminal',
        t = { ':ToggleTerm<cr>', 'Split Below' },
        f = { toggle_float, 'Floating Terminal' },
        l = { toggle_lazygit, 'LazyGit' },
        g = { ':G<cr>', 'Vim fugitive' },
      },

      x = { mode = {'n'}, prefix = '<cmd>!chmod +x %<CR>', desc = 'Enable execute mode', silent = true },
      
      -- Undotree
      u = { ':UndotreeToggle<cr>', 'Git Undotree' },
    }

    local opts = { prefix = '<leader>' }
    wk.register(mappings, opts)
  end,
}
