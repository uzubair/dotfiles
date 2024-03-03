-- [ Keymaps ]
vim.keymap.set({ 'n', 'i' }, ';', ':')
vim.keymap.set({ 'n', 'i' }, ':', ';')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Stay in indent mode
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Windows
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', { desc = 'Go To Left Window' })
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', { desc = 'Go To Bottom Window' })
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', { desc = 'Go To Top Window' })
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', { desc = 'Go To Right Window' })

-- Delete single character without copying to register
vim.keymap.set('n', 'x', '"_x"')

-- Clear search highlight on pressing Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>b', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
