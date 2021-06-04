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

" vim:ft=vim
