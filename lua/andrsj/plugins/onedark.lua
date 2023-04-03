require('onedark').setup {
    -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    style = 'darker',
    -- toggle theme style
    -- keybind to toggle theme style
    toggle_style_key = '<leader>T',
    -- List of styles to toggle between
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
    code_style = {
        -- keywords = 'italic, bold'
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    }
}
vim.cmd.colorscheme 'onedark'
