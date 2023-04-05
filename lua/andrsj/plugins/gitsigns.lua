require('gitsigns').setup({
    signcolumn = true,         -- Toggle with `:Gitsigns toggle_signs`
    numhl = true,              -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,            -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false,         -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    show_deleted = true,
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
})
