require('uzubair.packer')
require('uzubair.settings')
require('uzubair.mappings')

-- Configuration for better-escape plugin
vim.g.better_escape_shortcut = "jk"

-- Autocmds
local augroup = vim.api.nvim_create_augroup
local TheUzubairGroup = augroup('TheUzubair', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TheUzubairGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
