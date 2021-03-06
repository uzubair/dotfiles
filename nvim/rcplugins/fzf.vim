Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 1
let g:netrw_winsize = 25
let g:fzf_preview_window = []

let $FZF_DEFAULT_OPTS='--height 10% --layout=reverse --border'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <leader>p :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" vim:ft=vim

