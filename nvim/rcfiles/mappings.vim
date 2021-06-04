" Source init.vim
nnoremap <Leader><CR> :so ~/dotfiles/nvim/init.vim<CR>

" Re-map semi-colon to colon
nnoremap ; :
nnoremap : ;
inoremap ; :
inoremap : ;

" vnoremap X "_d

" Move selected text up/ down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" Alternate way to save, quit, and escape
nnoremap <C-s> :w<CR>
nnoremap <C-Q> :wq!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>x :x<CR>
" Alternate way to ESC
nnoremap <C-c> <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
