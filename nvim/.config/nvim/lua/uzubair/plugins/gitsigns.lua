return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
    },
    config = function()
        local gitsign = require("gitsigns")
        gitsign.setup({
            current_line_blame = true,
        })
    end
}
