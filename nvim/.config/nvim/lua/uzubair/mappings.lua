local keymap = vim.keymap
local api = vim.api

-- GENERAL
-- Re map semi-colon to colon
keymap.set({"n","i"}, ";", ":")
keymap.set({"n","i"}, ":", ";")

-- Alternate ways to save and quit
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>x", ":x<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>Q", ":q!<CR>")
keymap.set({"n","i"}, "C-Q", ":q!<CR>")

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Delete single char without copying to register
keymap.set("n", "x", '"_x')

-- Move selected text up/ down
keymap.set('v', "<leader>J", ":m '>+1<CR>gv=gv")
keymap.set('v', "<leader>K", ":m '<-2<CR>gv=gv")-- Window Management

-- Continuous visual shifting
keymap.set("x", "<", "<gv")
keymap.set("x", ">", ">gv")

-- Select all text
keymap.set('n', "C-a", "gg<S-v>G")

-- Enable execute mode
keymap.set("n", "<leader>e", "<cmd>!chmod +x %<CR>", { silent = true })

-- Go to the beginning of command in command-line mode
keymap.set("c", "<C-h>", "<HOME>")

-- Delete the cursor to the right of the cursor
keymap.set("i", "<C-d>", "<DEL>")

-- Split window vertically 
keymap.set("n", "<leader>wv", "<C-w>v")
-- Split window horizontally
keymap.set("n", "<leader>wh", "<C-w>s") -- split window horizontally
-- Make split windows equal in width and height
keymap.set("n", "<leader>we", "<C-w>=")
-- Close window
keymap.set("n", "<leader>wx", ":close<CR>")
keymap.set("n", "<leader>h", ":wincmd h<CR>")
keymap.set("n", "<leader>j", ":wincmd j<CR>")
keymap.set("n", "<leader>k", ":wincmd k<CR>")
keymap.set("n", "<leader>l", ":wincmd l<CR>")
keymap.set("n", "<leader>+", ":vertical resize +20<CR>")
keymap.set("n", "<leader>-", ":vertical resize -20<CR>")

-- Tab management
-- Open new tab
keymap.set("n", "<leader>to", ":tabnew<CR>")
-- Close current tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")
-- Go to next tab
keymap.set("n", "<leader>tn", ":tabn<CR>")
-- Go to previous tab
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- PLUGINS

-- vim-mazimizer
-- Maximize split window
keymap.set("n", "<leader>vm", ":MaximizerToggle<CR>")

-- nvim-tree
-- Toggle file explorer
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")

-- vim-markdown
keymap.set("n", "<leader>mp", ":<C-U>MarkdownPreview<CR>")
keymap.set("n", "<leader>mps", ":<C-U>MarkdownPreviewStop<CR>")

-- Undo-tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Hop
api.nvim_set_keymap('n', '<leader>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})
api.nvim_set_keymap('n', '<leader>hl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
api.nvim_set_keymap({'n', 'o'}, 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
api.nvim_set_keymap({'n', 'o'}, 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
api.nvim_set_keymap({'n', 'o'}, 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
api.nvim_set_keymap({'n', 'o'}, 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

-- Telescope
keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, {desc = '[?] Find recently opened files'})
keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, {desc = '[ ] Find existing buffers'})
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, { desc = '[D]documet [S]ymbols' })
keymap.set('n', '<leader>fy', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap.set("n", "<leader>fb", require('telescope.builtin').git_branches, { desc = '[S]earch [B]raches' })

