-- [ Set <space> as the leader key ]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [ Keymaps ]
require 'uzubair.core.keymaps'

-- [ Options ]
require 'uzubair.core.options'

-- [ Install `lazy.nvim` plugin manager ]
require 'uzubair.core.lazy'

-- [ Autocmds]
require 'uzubair.core.autocmds'

-- Terraform setup
vim.cmd [[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]]
vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]
vim.cmd [[let g:terraform_fmt_on_save=1]]
vim.cmd [[let g:terraform_align=1]]
