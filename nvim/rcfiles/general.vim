" General VIM settings

filetype plugin indent on

set encoding=utf-8
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler		" Show the cursor position all the time
set showcmd		" Display incomplete commands
set incsearch		" Do incremental search
set autowrite		" Automatially :write before running commands
set formatoptions-=t 	" Don't auto-break long lines
set noerrorbells	" Stop annoying bell on errors
set nohlsearch		" Stop the highlighting for the 'hlsearch' option
set noshowmatch		" Don't jump to matching bracket
set hidden		" Don't require saving before closing a buffer
set nowrap
set ignorecase
set smartcase
set undofile
set cmdheight=2		" Give more space for displaying msgs
set updatetime=50	" Having longer updatetime leades to noticeable delays
set shortmess+=c	" Don't pass msg to |ins-completion-menu|
set undodir=~/.vim/undodir
set tags=tags
set clipboard=unnamedplus " or unnamed
set splitright
set splitbelow
set scrolloff=8
set re=1
set spell spelllang=en_us
" set background=dark
set iskeyword+=-    " Treat dash separated words as a word text object
" Mouse
set mouse=a

" To view `` in the markdown files
set conceallevel=0

" Softtabs, 2 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Use one space after punctuation instead of 2
set nojoinspaces

" Display relative line numbers along with absolute line numbers for the current
" line
set number
set numberwidth=2
set relativenumber

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()

" vim:ft=vim
