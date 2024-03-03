-- [ Setting options ]

-- Set history
vim.opt.history = 1000

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Appearance
vim.opt.signcolumn = 'yes'
-- vim.opt.pumheight = 10
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.scrolloff = 10
-- vim.opt.sidescrolloff = 5

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Treat words with dash as single word
-- vim.opt.iskeyword:append '-'

-- Set backspace
vim.opt.backspace = 'indent,eol,start'

-- Tabs and indentation
-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.expandtab = true
-- vim.opt.smartindent = true

-- Spell language
vim.opt.spelllang = 'en'
