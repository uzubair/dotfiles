local keymap = vim.keymap
local map = vim.api.nvim_set_keymap

-- General
vim.g.mapleader = ' '

-- Remap semi-colon to colon
keymap.set({ 'n', 'i' }, ';', ':')
keymap.set({ 'n', 'i' }, ':', ';')
keymap.set('n', '*', '*zz')
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- BufferLine
keymap.set('n', '<Tab>', ':BufferLineCycleNext<cr>', { noremap = true, silent = true })
keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<cr>', { noremap = true, silent = true })

-- Delete single char without copying to register
keymap.set('n', 'x', '"_x')

-- Delete lines without yanking it
-- 'd' still cuts and 'p' still pastes
-- <leader>d delets for real and <leader>p throws away
-- the selected text and pastes the content of the default
-- register
-- map({"n", "v"}, "d", '"_d')
-- map({"n", "v"}, "d", '"_d')
keymap.set({ 'n', 'x' }, '<leader>d', '"_d')
keymap.set('x', '<leader>p', '"_dP')

-- Stay in indent mode
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Search for highlighted text in buffer
keymap.set('v', '//', 'y/<C-R>"<CR>', { desc = 'Search for highlighted text' })

-- Move selected text up/ down
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- LSP renaming with immediate visual feedbac
-- keymap.set('n', '<leader>rn', ':IncRename')
-- keymap.set({ 'n', 'x' }, '<leader>rr', function()
--   require('telescope').extensions.refactoring.refactors()
-- end)
