return {
  'epwalsh/obsidian.nvim',
  lazy = true,
  event = {
    'BufReadPre /Users/uzubair/vaults/**.md',
    'BufNewFile /Users/uzubair/vaults/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
      {
        name = 'work',
        path = '~/vaults/work',
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['<leader>nf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ['<leader>nh'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      -- local suffix = ""
      -- if title ~= nil then
      --     -- If title is given, transform it into valid file name.
      --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      -- else
      --     -- If title is nil, just add 4 random uppercase letters to the suffix.
      --     for _ = 1, 4 do
      --         suffix = suffix .. string.char(math.random(65, 90))
      --     end
      -- end
      -- return tostring(os.time()) .. "-" .. suffix
      return title
    end,
  },
  config = function()
    local obsidian = require 'obsidian'
    obsidian.setup()
  end,
}
