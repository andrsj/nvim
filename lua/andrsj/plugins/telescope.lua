-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local telescope = require('telescope')
local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')

local previewers = require('telescope.previewers')

-- filter files which bigger than 10000b
local filter_files = function(filepath, bufnr, opts)
    opts = opts or {}
    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
            return
        end
        if stat.size > 10000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end

telescope.setup({
    pickers = {
        colorscheme = {
            enable_preview = true,
        },
    },
    defaults = {
        prompt_prefix = ' ',
        buffer_previewer_maker = filter_files,
        layout_config = {
            vertical = { width = 0.6 },
            horizontal = { width = 0.9 },
        },
        mappings = {
            i = {
                ['<C-h>'] = actions.which_key,
                ['<Esc>'] = actions.close,
                ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
                ['<M-p>'] = action_layout.toggle_preview,
                ['<C-s>'] = actions.cycle_previewers_next,
                ['<C-a>'] = actions.cycle_previewers_prev,
            },
            n = {
                ['<M-p>'] = action_layout.toggle_preview,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        command_palette = {
            {
                'File',
                { 'entire selection (C-a)',  ':call feedkeys("GVgg")' },
                { 'save current file (C-s)', ':w' },
                { 'save all files (C-A-s)',  ':wa' },
                { 'quit (C-q)',              ':qa' },
                { 'file browser (C-i)',      ':lua require\'telescope\'.extensions.file_browser.file_browser()', 1 },
                { 'search word (A-w)',       ':lua require(\'telescope.builtin\').live_grep()',                  1 },
                { 'git files (A-f)',         ':lua require(\'telescope.builtin\').git_files()',                  1 },
                { 'files (C-f)',             ':lua require(\'telescope.builtin\').find_files()',                 1 },
            },
            {
                'Help',
                { 'tips',            ':help tips' },
                { 'cheatsheet',      ':help index' },
                { 'tutorial',        ':help tutor' },
                { 'summary',         ':help summary' },
                { 'quick reference', ':help quickref' },
                { 'search help(F1)', ':lua require(\'telescope.builtin\').help_tags()', 1 },
            },
            {
                'Vim',
                { 'reload vimrc',              ':source $MYVIMRC' },
                { 'check health',              ':checkhealth' },
                { 'jumps (Alt-j)',             ':lua require(\'telescope.builtin\').jumplist()' },
                { 'commands',                  ':lua require(\'telescope.builtin\').commands()' },
                { 'command history',           ':lua require(\'telescope.builtin\').command_history()' },
                { 'registers (A-e)',           ':lua require(\'telescope.builtin\').registers()' },
                { 'colorshceme',               ':lua require(\'telescope.builtin\').colorscheme()',    1 },
                { 'vim options',               ':lua require(\'telescope.builtin\').vim_options()' },
                { 'keymaps',                   ':lua require(\'telescope.builtin\').keymaps()' },
                { 'buffers',                   ':Telescope buffers' },
                { 'search history (C-h)',      ':lua require(\'telescope.builtin\').search_history()' },
                { 'paste mode',                ':set paste!' },
                { 'cursor line',               ':set cursorline!' },
                { 'cursor column',             ':set cursorcolumn!' },
                { 'spell checker',             ':set spell!' },
                { 'relative number',           ':set relativenumber!' },
                { 'search highlighting (F12)', ':set hlsearch!' },
            },
        },
    },
})

pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'http')
pcall(telescope.load_extension, 'command_palette')
