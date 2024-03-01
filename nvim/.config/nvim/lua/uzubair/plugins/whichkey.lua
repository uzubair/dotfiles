return {

  'folke/which-key.nvim',
  dependencies = {
    'akinsho/toggleterm.nvim',
  },

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require 'which-key'
    -- border
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
      -- Lsp
      c = {
        name = 'LSP',
        i = { ':LspInfo<cr>', 'Connected Language Servers' },
        k = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature Help' },
        K = { '<cmd>Lspsaga hover_doc<cr>', 'Hover Commands' },
        w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add Workspace Folder' },
        W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Remove Workspace Folder' },
        l = {
          '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
          'List Workspace Folders',
        },
        t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type Definition' },
        d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go To Definition' },
        D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go To Declaration' },
        r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
        R = { '<cmd>Lspsaga rename<cr>', 'Rename' },
        a = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
        e = { '<cmd>Lspsaga show_line_diagnostics<cr>', 'Show Line Diagnostics' },
        n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Go To Next Diagnostic' },
        N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Go To Previous Diagnostic' },
        -- Code Formatting
        M = { ':lua vim.lsp.buf.format()<cr>', 'Format code' },
      },

      -- Buffers
      b = {
        name = 'Buffers',
        x = { ':bdelete<cr>', 'Close Buffer' },
        n = { ':bnext<cr>', 'Next Buffer' },
        p = { ':bprev<cr>', 'Prev Buffer' },
        l = { ':blast<cr>', 'Last Buffer' },
      },

      -- NvimTree
      e = {
        name = 'NvimTree',
        e = { ':NvimTreeToggle<cr>', 'NvimTreeToggle' },
        f = { ':NvimTreeFocus<cr>', 'NvimTreeFocus' },
        h = { ':e ~/<cr>', 'NvimTreeHome' },
      },

      -- Telescope
      f = {
        name = 'Telescope',
        o = { ':Telescope oldfiles theme=ivy<cr>', 'Telescope oldfiles' },
        f = { ':Telescope find_files theme=ivy<cr>', 'Search Files' },
        g = { ':Telescope git_files theme=ivy<cr>', 'Search Git Files' },
        e = { ':Telescope grep_string theme=ivy<cr>', 'Search Current Word' },
        l = { ':Telescope live_grep theme=ivy<cr>', 'Telescope live_grep' },
        s = { ':Telescope lsp_document_symbols theme=ivy<cr>', 'Search Document Symbols' },
        Y = { ':Telescope lsp_dynamic_workspace_symbols theme=ivy<cr>', 'Search Workspace Symbols' },
        d = { ':Telescope diagnostics theme=ivy<cr>', 'Search Diagnostics' },
        a = { '<cmd>AdvancedGitSearch<cr>', 'AdvancedGitSearch' },
        n = { '<cmd>Telescope neoclip<cr>', 'Telescope neoclip' },
        u = { ':Telescope buffers theme=ivy<cr>', 'Telescope buffers' },
        b = { ':Telescope git_branches theme=ivy<cr>', 'Search Git Branches' },
        k = { ':Telescope keymaps theme=ivy<cr>', 'Search Keymaps' },
        r = { ':Telescope repo list theme=ivy<cr>', 'Search Git Repos' },
        p = { ':Telescope projects theme=ivy<cr>', 'Search Projects' },
        w = { ':Telescope tmux windows theme=ivy<cr>', 'Search Tmux Windows' },
        t = { ':Telescope tmux sessions theme=ivy<cr>', 'Search Tmux Sessions' },
        h = { ':Telescope harpoon marks theme=ivy<cr>', 'Search Harpoon Marks' },
        c = { ':Telescope current_buffer_fuzzy_find theme=ivy<cr>', 'Fuzzy Find in File' },
        -- a = { ':Telescope tmux pane_contents theme=ivy<cr>', 'Search Tmux Pane History' },
        -- h = { ':Telescope help_tags theme=ivy<cr>', 'Search Help' },
        -- r = { ':Telescope resume theme=ivy<cr>', 'Telescope resume' },
      },

      -- Control Operations
      g = {
        name = 'Control Operations',
        a = { mode = 'n', prefix = 'gg<S-v>G', desc = 'Select all text' },
        h = { mode = 'c', prefix = '<HOME>', desc = 'Go to beginning of the command' },
        d = { mode = 'i', prefix = '<DEL>', desc = 'Delete the cursor to the right of the cursor' },
        x = { mode = 'n', prefix = '<cmd>!chmod +x %<CR>', desc = 'Enable execute mode', silent = true },
        c = { mode = 'v', prefix = '"+y', noremap = true, desc = 'Copy the text' },
        s = { mode = 'n', prefix = '"+P', noremap = true, desc = 'Paste the text' },
        m = { mode = 'n', prefix = ':nohlsearch<cr>', noremap = false, silent = false, desc = 'Unhighlight searched elements' },
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

      -- Windows Selection
      h = { ':wincmd h<CR>', 'Move to left window' },
      j = { ':wincmd j<CR>', 'Move to bottom window' },
      k = { ':wincmd k<CR>', 'Move to top window' },
      l = { ':wincmd l<CR>', 'Move to right window' },

      -- Markdown
      m = {
        name = 'Markdown controls',
        p = { ':<C-U>MarkdownPreview<CR>', 'Start Preview Markdown' },
        s = { ':<C-U>MarkdownPreviewStop<CR>', 'Stop Markdown Preview' },
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

      -- Terminal
      t = {
        name = 'Terminal',
        t = { ':ToggleTerm<cr>', 'Split Below' },
        f = { toggle_float, 'Floating Terminal' },
        l = { toggle_lazygit, 'LazyGit' },
        g = { ':G<cr>', 'Vim fugitive' },
      },

      -- Harpoon
      p = {
        name = 'Harpoon',
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", 'add file' },
        r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", 'remove file' },
        m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", 'harpoon menu' },
        n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", 'next file' },
        p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", 'previous file' },
        ['1'] = { "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", 'file 1' },
        ['2'] = { "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", 'file 2' },
        ['3'] = { "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", 'file 3' },
        ['4'] = { "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", 'file 4' },
        ['5'] = { "<cmd> lua require('harpoon.ui').nav_file(5)<cr>", 'file 5' },
        ['6'] = { "<cmd> lua require('harpoon.ui').nav_file(6)<cr>", 'file 6' },
        ['7'] = { "<cmd> lua require('harpoon.ui').nav_file(7)<cr>", 'file 7' },
        ['8'] = { "<cmd> lua require('harpoon.ui').nav_file(8)<cr>", 'file 8' },
        ['9'] = { "<cmd> lua require('harpoon.ui').nav_file(9)<cr>", 'file 9' },
      },

      -- Refactor
      r = {
        name = 'Refactor Code',
        n = { ':IncRename', 'Rename' },
        r = { mode = { 'n', 'x' }, prefix = "<cmd>lua require('telescope').extensions.refactoring.refactors()", desc = 'Refactor' },
      },

      -- Undotree
      u = { ':UndotreeToggle<cr>', 'Git Undotree' },
    }

    local opts = { prefix = '<leader>' }
    wk.register(mappings, opts)
  end,
}
