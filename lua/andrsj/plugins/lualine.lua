require('lualine').setup {
    options = {
        theme = 'onedark',
        icons_enabled = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        path = 2,
        path_max_length = 60, -- set the maximum length of the path
    },
    sections = {
        lualine_y = {
            'progress',
        }
    }
}
