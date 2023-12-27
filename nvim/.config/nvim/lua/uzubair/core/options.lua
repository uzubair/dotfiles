local o = vim.opt

-- Setup cursor color and shape in various modes, ref:
-- https:// github.com/neovim/neovim/wiiki/FAQ#how-to-change-cursor-color-in-the-terminal
o.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20"

-- Setting history
o.history = 999

-- Appearance
o.termguicolors = true
o.signcolumn = "yes"
o.pumheight = 10
o.cmdheight = 2
o.conceallevel = 0
o.scrolloff = 15

-- Line numbers
o.nu = true
o.relativenumber = true
-- o.numberwidth = 2

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

-- Files and others
vim.o.fileencoding = "utf-8" -- File Encoding
vim.g.loaded_netrw = 1 -- Helps opening links in the internet (probabilly -_-)
vim.g.loaded_netrwPlugin = 1
vim.opt.autochdir = true
vim.cmd("filetype plugin indent on")
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.opt.iskeyword:append("-,_")
vim.opt.virtualedit = "block"

-- Ignore certain files/ folders when globing
o.wildignore = {
    "*.o","*.obj","*.dylib","*.bin","*.dll","*.exe",
    "*/.git/*","*/.svn/*","*/__pycache__/*","*/build/**",
    "*.jpg","*.png","*.jpeg","*.bmp","*.gif","*.tiff","*.svg","*.ico",
    "*.pyc","*.pkl","*.DS_Store",
    "*.aux","*.bbl","*.blg","*.brf","*.fls","*.fdb_latexmk","*.synctex.gz","*.xdv",
    "*/node_modules/*",".terraform/*"
}
o.wildignorecase = true

-- Spell language
o.spelllang = "en"

-- Mouse and Scrolling
o.scrolloff = 5
o.sidescrolloff = 5
o.mouse = "a"

-- Auto Formatting
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- keep cursor unchanged after quiting
vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim.",
})

-- PLUGINS
-- markdown settings
vim.g.vim_markdown_folding_disabled = 1 -- Disable header folder
vim.g.vim_markdown_conceal = 1 -- Whether to use conceal feature in markdown
vim.g.tex_conceal = '' -- Disable both math text conceal and syntax highlighting
vim.g.vim_markdown_math = 0
vim.g.vim_markdown_toc_autofit = 1 -- TOC window autofit so that it doesn't take too much space
vim.g.mkdp_auto_close = 0 -- Preview settings
