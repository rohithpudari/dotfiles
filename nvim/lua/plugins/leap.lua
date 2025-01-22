-- Leap is a motion plugin that allows you to jump to any position in the visible editor area by entering a 2-character search pattern
return 	{
    "ggandor/leap.nvim",
    config = function()
    local leap = require('leap')
    -- Also, just set each option here directly:
    leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
    -- bi-directional search in current window - "s" in normal mode
    vim.keymap.set('n',        's', '<Plug>(leap)')
    vim.keymap.set('n',        'S', '<Plug>(leap-from-window)')
    vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward)')
    vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward)')
    end
}
