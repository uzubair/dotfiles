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
