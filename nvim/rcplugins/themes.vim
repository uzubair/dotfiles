Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'flazz/vim-colorschemes'

if (has("termguicolors"))
    set termguicolors
endif

autocmd VimEnter * colorscheme monokai_pro
set background=dark

let g:airline_theme='monokai_tasty'
