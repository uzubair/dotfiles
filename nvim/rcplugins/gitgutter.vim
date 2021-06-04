Plug 'airblade/vim-gitgutter'

let g:gitgutter_max_signs = -1   " default value no limit 
let g:gitgutter_show_msg_on_hunk_jumping = 0

nmap <leader>hp preview hunk
nmap <leader>hs stage
nmap <leader>hu undo
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" vim:ft=vim
