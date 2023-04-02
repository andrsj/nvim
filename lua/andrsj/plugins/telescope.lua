-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local telescope = require('telescope')
local actions = require('telescope.actions')
local action_layout = require("telescope.actions.layout")

local previewers = require("telescope.previewers")

-- filter files which bigger than 10000b
local filter_files = function(filepath, bufnr, opts)
    opts = opts or {}
    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then return end
        if stat.size > 10000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end



telescope.setup {
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
                ["<M-p>"] = action_layout.toggle_preview,
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
            },
            n = {
                ["<M-p>"] = action_layout.toggle_preview,
            }
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'http')
