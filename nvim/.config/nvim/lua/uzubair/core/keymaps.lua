local map = vim.map

-- General

vim.g.mapleader = " "

-- Remap semi-colon to colon
map({"n", "i"}, ";", ":")
map({"n", "i"}, ":", ";")

-- Alternate ways to save and quit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>x", ":x<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":q!<CR>")
map({"n", "i"}, "C-Q", ":qall<CR>")

-- Unhighlight searched elements
map("n", "<C-m>", ":nohlsearch<cr>", { noremap = true, silent = true })

-- Indenting
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

-- Copy-Pasting
map("v", "<C-c>", '"+y', { noremap = true, silent = false })
map("n", "<C-s>", '"+P', { noremap = true, silent = false })

-- BufferLine
map("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

-- Select all text
map('n', "C-a", "gg<S-v>G")

-- Enable execute mode
map("n", "<leader>e", "<cmd>!chmod +x %<CR>", { silent = true })

-- Go to the beginning of command in command-line mode
map("c", "<C-h>", "<HOME>")

-- Delete the cursor to the right of the cursor
map("i", "<C-d>", "<DEL>")

-- Delete single char without copying to register
map("n", "x", '"_x')

-- Delete lines without yanking it
-- 'd' still cuts and 'p' still pastes
-- <leader>d delets for real and <leader>p throws away
-- the selected text and pastes the content of the default
-- register
-- map({"n", "v"}, "d", '"_d')
-- map({"n", "v"}, "d", '"_d')
map({"n", "x"}, "<leader>d", '"_d')
map("x", "<leader>p", '"_dP')

-- Move selected text up/ down
map('v', "J", ":m '>+1<CR>gv=gv")
map('v', "K", ":m '<-2<CR>gv=gv")

-- Window Management
map("n", "<leader>wv", "<C-w>v")       -- Split window vertically
map("n", "<leader>wh", "<C-w>s")       -- split window horizontally
map("n", "<leader>we", "<C-w>=")       -- Make split windows equal in width and height
map("n", "<leader>wx", ":close<CR>")   -- Close window
map("n", "<leader>h", ":wincmd h<CR>")
map("n", "<leader>j", ":wincmd j<CR>")
map("n", "<leader>k", ":wincmd k<CR>")
map("n", "<leader>l", ":wincmd l<CR>")
map("n", "<leader>+", ":vertical resize +20<CR>")
map("n", "<leader>-", ":vertical resize -20<CR>")

-- Tab management
map("n", "<leader>to", ":tabnew<CR>")    -- Open new tab
map("n", "<leader>tx", ":tabclose<CR>")  -- Close current tab
map("n", "<leader>tn", ":tabn<CR>")      -- Go to next tab
map("n", "<leader>tp", ":tabp<CR>")      -- Go to previous tab

-- Plugins

-- vim-fugitive
map("n", "<leader>g", ":G<CR>")

-- vim-mazimizer
-- Maximize split window
map("n", "<leader>vm", ":MaximizerToggle<CR>")

-- nvim-tree
-- Toggle file explorer
map("n", "<leader>b", ":NvimTreeToggle<CR>")

-- vim-markdown
map("n", "<leader>mp", ":<C-U>MarkdownPreview<CR>")
map("n", "<leader>mps", ":<C-U>MarkdownPreviewStop<CR>")

-- Undo-tree
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Hop
map('n', '<leader>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})
map('n', '<leader>hl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('n', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
map('n', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
map('o', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
map('o', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

-- Telescope
map('n', '<leader>?', require('telescope.builtin').oldfiles, {desc = '[?] Find recently opened files'})
map('n', '<leader><space>', require('telescope.builtin').buffers, {desc = 'Find existing buffers'})
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
})
end, { desc = '[/] Fuzzily search in current buffer]' })
map('n', '<leader>ff', require('telescope.builtin').find_files, {desc = 'Search Files'})
map('n', '<leader>fh', require('telescope.builtin').help_tags, {desc = 'Search Help'})
map('n', '<leader>fo', require('telescope.builtin').grep_string, {desc = 'Search current Word'})
map('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, {desc = 'Documet Symbols'})
map('n', '<leader>fy', require('telescope.builtin').lsp_dynamic_workspace_symbols, {desc = 'Workspace Symbols'})
map('n', '<leader>fg', require('telescope.builtin').live_grep, {desc = 'Search by Grep'})
map('n', '<leader>fd', require('telescope.builtin').diagnostics, {desc = 'Search Diagnostics'})
map("n", "<leader>fb", require('telescope.builtin').git_branches, {desc = 'Search Braches'})
map("n", "<leader>fk", require('telescope.builtin').keymaps, {desc = 'Search Keymaps'})
map("n", "<leader>fr", ":Telescope repo list<CR>", {desc = 'Search Repos'})
map("n", "<leader>fp", ":Telescope projects<CR>", {desc = 'Search Repos'})
map("n", "<leader>ft", ":Telescope tmux sessions<CR>", {desc = 'Search tmux sessions'})
map("n", "<leader>fw", ":Telescope tmux windows<CR>", {desc = 'Search tmux windows'})
map("n", "<leader>fa", ":Telescope tmux pane_contents<CR>", {desc = 'Search in tmux pane\'s history'})
map("n", "<leader>fm", ":Telescope harpoon marks<CR>", {desc= 'Search for harpoon marks'})
