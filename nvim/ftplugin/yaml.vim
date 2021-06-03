" YAML
augroup ymlfiledetect
  au BufRead,BufNewFile *.{yaml,yml,tf,template} set filetype=yaml
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" vim:ft=vim

