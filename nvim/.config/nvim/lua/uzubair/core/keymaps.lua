local keymap = vim.keymap
local map = vim.api.nvim_set_keymap

-- General

vim.g.mapleader = " "

-- Remap semi-colon to colon
keymap.set({"n", "i"}, ";", ":")
keymap.set({"n", "i"}, ":", ";")

-- Alternate ways to save and quit
-- keymap.set("n", "<leader>w", ":w<CR>")
-- keymap.set("n", "<leader>x", ":x<CR>")
-- keymap.set("n", "<leader>q", ":q<CR>")
-- keymap.set("n", "<leader>Q", ":q!<CR>")
-- keymap.set({"n", "i"}, "C-Q", ":qall<CR>")

-- Unhighlight searched elements
-- keymap.set("n", "<C-m>", ":nohlsearch<cr>", { noremap = true, silent = true })

-- Indenting
-- keymap.set("v", "<", "<gv", { noremap = true, silent = false })
-- keymap.set("v", ">", ">gv", { noremap = true, silent = false })

-- Copy-Pasting
-- keymap.set("n", "<C-s>", '"+P', { noremap = true, silent = false })
-- keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = false })

-- BufferLine
keymap.set("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

-- Select all text
-- keymap.set('n', "C-a", "gg<S-v>G")

-- Enable execute mode
-- keymap.set("n", "<leader>e", "<cmd>!chmod +x %<CR>", { silent = true })

-- Go to the beginning of command in command-line mode
-- keymap.set("c", "<C-h>", "<HOME>")

-- Delete the cursor to the right of the cursor
-- keymap.set("i", "<C-d>", "<DEL>")

-- Delete single char without copying to register
-- keymap.set("n", "x", '"_x')

-- Delete lines without yanking it
-- 'd' still cuts and 'p' still pastes
-- <leader>d delets for real and <leader>p throws away
-- the selected text and pastes the content of the default
-- register
-- keymap.set({"n", "v"}, "d", '"_d')
-- keymap.set({"n", "v"}, "d", '"_d')
-- keymap.set({"n", "x"}, "<leader>d", '"_d')
-- keymap.set("x", "<leader>p", '"_dP')

-- Move selected text up/ down
-- keymap.set('v', "J", ":m '>+1<CR>gv=gv")
-- keymap.set('v', "K", ":m '<-2<CR>gv=gv")

-- Window Management
-- keymap.set("n", "<leader>wv", "<C-w>v")       -- Split window vertically
-- keymap.set("n", "<leader>wh", "<C-w>s")       -- split window horizontally
-- keymap.set("n", "<leader>we", "<C-w>=")       -- Make split windows equal in width and height
-- keymap.set("n", "<leader>wx", ":close<CR>")   -- Close window
-- keymap.set("n", "<leader>h", ":wincmd h<CR>")
-- keymap.set("n", "<leader>j", ":wincmd j<CR>")
-- keymap.set("n", "<leader>k", ":wincmd k<CR>")
-- keymap.set("n", "<leader>l", ":wincmd l<CR>")
-- keymap.set("n", "<leader>+", ":vertical resize +20<CR>")
-- keymap.set("n", "<leader>-", ":vertical resize -20<CR>")

-- Tab management
-- keymap.set("n", "<leader>to", ":tabnew<CR>")    -- Open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- Close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>")      -- Go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>")      -- Go to previous tab

-- Plugins

-- vim-fugitive
-- keymap.set("n", "<leader>g", ":G<CR>")

-- vim-mazimizer
-- Maximize split window
-- keymap.set("n", "<leader>vm", ":MaximizerToggle<CR>")

-- nvim-tree
-- Toggle file explorer
-- keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")

-- vim-markdown
-- keymap.set("n", "<leader>mp", ":<C-U>MarkdownPreview<CR>")
-- keymap.set("n", "<leader>mps", ":<C-U>MarkdownPreviewStop<CR>")

-- Undo-tree
-- keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Hop
-- map('n', '<leader>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})
-- map('n', '<leader>hl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
-- map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- map('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- map('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- map('n', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- map('n', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- map('o', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- map('o', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

