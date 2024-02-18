return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kdheepak/lazygit.nvim',
    'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  -- keys = {
  -- 	{"<leader>o", "<cmd>Telescope oldfiles<cr>", desc = "[?] Find recently opened files"},
  -- 	{"<leader>u", "<cmd>Telescope buffers<cr>", desc = "Find existing buffers"},
  -- 	-- {"<leader>/", function()
  -- 	-- You can pass additional configuration to telescope to change theme, layout, etc.
  -- 	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
  -- 		winblend = 10,
  -- 		previewer = false,
  -- 	})
  -- 	end, desc = "[/] Fuzzily search in current buffer]"},
  -- 	{"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Search Files"},
  -- 	{"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Search Help"},
  -- 	{"<leader>fe", "<cmd>Telescope grep_string<cr>", desc = "Search current Word"},
  -- 	{"<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Documet Symbols"},
  -- 	{"<leader>fy", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols"},
  -- 	{"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep"},
  -- 	{"<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Search Diagnostics"},
  -- 	{"<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Search Braches"},
  -- 	{"<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps"},
  -- 	{"<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzy Find in File"},
  -- 	{"<leader>fr", "<cmd>Telescope resume<cr>", desc = "Telescope Resume"},
  -- 	{"<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps"},
  -- 	{"<leader>fl", "<cmd>Telescope repo list<cr>", desc = "Search Repos"},
  -- 	{"<leader>fp", "<cmd>Telescope projects<cr>", desc = "Search Repos"},
  -- 	{"<leader>ft", "<cmd>Telescope tmux sessions<cr>", desc = "Search tmux sessions"},
  -- 	{"<leader>fw", "<cmd>Telescope tmux windows<cr>", desc = "Search tmux windows"},
  -- 	{"<leader>fa", "<cmd>Telescope tmux pane_contents<cr>", desc = "Search in tmux pane\"s history"},
  -- 	{"<leader>fm", "<cmd>Telescope harpoon marks<cr>", desc= "Search for harpoon marks"},
  -- },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    telescope.setup {
      defaults = {
        prompt_prefix = ' > ',
        layout_config = {
          width = 0.80,
          prompt_position = 'top',
          preview_cutoff = 120,
          horizontal = { mirror = false },
          vertical = { mirror = false },
        },
        find_command = {
          'rg',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        path_display = {},
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
        mappings = {
          i = {
            ['<C-n>'] = actions.move_selection_next,
            ['<C-p>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<esc>'] = actions.close,
            ['<CR>'] = actions.select_default + actions.center,
          },
          n = {
            ['<C-n>'] = actions.move_selection_next,
            ['<C-p>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = false,
        },
        live_grep = {
          additional_args = function()
            return { '-u', '--max-depth=99' }
          end,
        },
      },
      extensions = {
        repo = {
          list = {
            layout_strategy = 'vertical',
            fd_opts = {
              '--no-ignore-vcs',
            },
            search_dirs = {
              '/Users/uzubair/workspace/git',
              '/Users/uzubair/dotfiles',
            },
          },
        },
      },
    }

    telescope.load_extension 'fzf'
    telescope.load_extension 'repo'
    telescope.load_extension 'projects'
    telescope.load_extension 'harpoon'
    telescope.load_extension 'advanced_git_search'
    telescope.load_extension 'neoclip'
    telescope.load_extension 'refactoring'
    -- telescope.load_extension 'noice'
  end,
}
