" init.vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
let &packpath = &runtimepath
set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor=i:ver25-iCursor
source ~/dotfiles/nvim/vimrc
