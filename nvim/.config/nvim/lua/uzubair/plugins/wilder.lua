return {
  'gelguy/wilder.nvim',

  config = function()
    local wilder = require 'wilder'

    wilder.setup {
      modes = { ':', '/', '?' },
      next_key = '<Tab>',
      previous_key = '<S-Tab>',
      accept_key = '<C-y>',
      reject_key = '<C-e>',
    }

    wilder.set_option(
      'renderer',
      wilder.popupmenu_renderer {
        highlighter = wilder.basic_highlighter(),
        max_height = 15,
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
        apply_incsearch_fix = 0,
        highlights = {
          accent = wilder.make_hl('WilderAccent', 'Pmenu', { {}, {}, { foreground = '#f4468f' } }),
        },
        border = 'rounded',
      }
    )
  end,
}
