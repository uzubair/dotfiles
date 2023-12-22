local o = vim.opt

-- Set up cursor color and shape in various modes, ref:
-- https:// github.com/neovim/neovim/wiiki/FAQ#how-to-change-cursor-color-in-the-terminal
o.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20"

-- Setting history
o.history = 999

-- Line numbers
o.nu = true
o.relativenumber = true
-- o.numberwidth = 2

-- Turn on termguicolors
o.termguicolors = true
o.signcolumn = "yes"
o.scrolloff = 15

-- Tabs and indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- Line wrapping
o.wrap = false

-- Backspace
o.backspace = "indent,eol,start"

-- Clipboard
o.clipboard:append("unnamedplus")

-- Search settings
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

-- Windows
o.splitright = true
o.splitbelow = true

-- Treat words with dash as single word
o.iskeyword:append("-")

o.updatetime = 50

-- Swap files
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Give more space for displaying msgs
o.cmdheight = 2

-- Search down into subfolders when finding files
o.path:append("**")

-- Ignore certain files/ folders when globing
o.wildignore = {
  "*.o","*.obj","*.dylib","*.bin","*.dll","*.exe",
  "*/.git/*","*/.svn/*","*/__pycache__/*","*/build/**",
  "*.jpg","*.png","*.jpeg","*.bmp","*.gif","*.tiff","*.svg","*.ico",
  "*.pyc","*.pkl","*.DS_Store",
  "*.aux","*.bbl","*.blg","*.brf","*.fls","*.fdb_latexmk","*.synctex.gz","*.xdv",
  "*/node_modules/*"
}
o.wildignorecase = true

-- Spell language
o.spelllang = "en"

-- To View tick in the markdown files
o.conceallevel = 0

-- PLUGINS
-- markdown settings
vim.g.vim_markdown_folding_disabled = 1 -- Disable header folder
vim.g.vim_markdown_conceal = 1 -- Whether to use conceal feature in markdown
vim.g.tex_conceal = '' -- Disable both math text conceal and syntax highlighting
vim.g.vim_markdown_math = 0
vim.g.vim_markdown_toc_autofit = 1 -- TOC window autofit so that it doesn't take too much space
vim.g.mkdp_auto_close = 0 -- Preview settings

