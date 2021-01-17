" General
set encoding=utf-8
set number
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set expandtab
set smartindent
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undofile
set incsearch
set splitright
set splitbelow
set scrolloff=8
set tabstop=4 softtabstop=4
set shiftwidth=4
set guicursor=i:ver25-iCursor
set backspace=indent,eol,start
set cmdheight=2     " Give more space for displaying messages.
set updatetime=50   " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c    " Don't pass messages to |ins-completion-menu|.
set undodir=~/.vim/undodir
set tags=tags
set re=1
set clipboard=unnamed

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'mileszs/ack.vim'

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

Plug 'tpope/vim-commentary'

Plug 'unblevable/quick-scope'

Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'

Plug 'alvan/vim-closetag'

call plug#end()

" Other settings
let mapleader = " "

" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']   " Trigger a highlight in the appropriate direction when pressing these keys:
" augroup qs_colors
"   autocmd!
"   autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
"   autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" augroup END

let g:qs_max_chars=150
let g:rainbow_active = 1
let g:AutoPairsFlyMode = 1

" Theme
if (has("termguicolors"))
    set termguicolors
endif
colorscheme monokai_pro
set background=dark
" let g:gruvbox_contrast_dark = 'hard'
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
" let g:gruvbox_invert_selection='0'

" NERDtree
let loaded_matchparen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '_accounts']
let g:NERDTreeStatusline = ''
" let NERDTreeMapOpenInTab='<ENTER>'

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
nnoremap <silent> <leader>b :NERDTreeToggle<CR>

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Fuzzy finder
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 1
let g:netrw_winsize = 25
let g:fzf_preview_window = []

nnoremap <leader>p :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_OPTS='--height 10% --layout=reverse --border'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
if executable('rg')
    let g:rg_derive_root='true'
endif

" Key mappings
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>[ :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>] :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +20<CR>
nnoremap <Leader>- :vertical resize -20<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Go to tab by number
noremap <leader>h gt
noremap <leader>l gT
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" Go to last active tab

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

nnoremap ; :
nnoremap : ;
inoremap ; :
inoremap : ;

vnoremap X "_d
inoremap <C-c> <esc>

" COC
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Fugitive
nmap <leader>gj ;diffget //3<CR>
nmap <leader>gf ;diffget //2<CR>
nmap <leader>gs ;G<CR>
nmap <leader>ga ;Git add %:p<CR><CR>
nmap <leader>gs ;Gstatus<CR>
nmap <leader>gc ;Gcommit -v -q<CR>
nmap <leader>gt ;Gcommit -v -q %:p<CR>
nmap <leader>gdi ;Gdiff<CR>
nmap <leader>ge ;Gedit<CR>
nmap <leader>gre ;Gread<CR>
nmap <leader>gw ;Gwrite<CR><CR>
nmap <leader>gl ;silent! Glog<CR>:bot copen<CR>
nmap <leader>gp ;Ggrep<Space>
nmap <leader>gm ;Gmove<Space>
nmap <leader>gb ;Git branch<Space>
nmap <leader>go ;Git checkout<Space>
nmap <leader>gps ;Dispatch! git push<CR>
nmap <leader>gpl ;Dispatch! git pull<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()

" GITgutter
" <leader>hp preview hunk
" <leader>hs stage
" <leader>hu undo
" Documentation can be found at: https://github.com/airblade/vim-gitgutter
let g:gitgutter_show_msg_on_hunk_jumping = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Ack
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

" cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>

" Terminal
:tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

nnoremap <C-n> :call ChooseTerm("term-slider", 1)<CR>
inoremap <C-n> <C-\><C-n>:call ChooseTerm("term-slider", 1)<CR>

" Start terminal in current pane
"nnoremap <C-k> :call ChooseTerm("term-pane", 0)<CR>

function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #"
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "split"
            :exe "resize 10"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "split"
            :exe "resize 10"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction

" Commentary
noremap <leader>/ :Commentary<cr>

" HTML auto closing
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_emptyTags_caseSensitive = 0
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" YAML template syntax
augroup ymlfiledetect
  au BufRead,BufNewFile *.{yaml,yml,tf,template} set filetype=yaml
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

