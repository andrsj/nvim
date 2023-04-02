-- Install package manager
-- https://github.com/folke/lazy.nvim
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- First, some plugins that don't require any configuration

    -- Git
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth
    'tpope/vim-sleuth',

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "s1n7ax/nvim-window-picker",
        }
    },

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind.nvim',
        },
    },

    {
        'folke/which-key.nvim',
        opts = {}
    },

    {
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
    },

    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
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
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    { 'lukas-reineke/indent-blankline.nvim' },

    -- "gc" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        opts = {}
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-symbols.nvim',
            'barrett-ruth/telescope-http.nvim',
        },
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    },

    {
        'iamcco/markdown-preview.nvim',
        post_install = function()
            vim.fn['mkdp#util#install']()
        end,
    },

    {
        'folke/todo-comments.nvim',
        config = function()
            require("todo-comments").setup()
        end
    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },

    {
        'kdheepak/tabline.nvim',
        config = function()
            require 'tabline'.setup {
                -- Defaults configuration options
                enable = true,
                options = {
                    -- If lualine is installed tabline will use separators configured in lualine by default.
                    -- These options can be used to override those settings.
                    section_separators = { '', '' },
                    component_separators = { '', '' },
                    max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
                    show_tabs_always = true,     -- this shows tabs only when there are more than one tab or if the first tab is named
                    show_devicons = true,        -- this shows devicons in buffer section
                    show_bufnr = true,           -- this appends [bufnr] to buffer section,
                    show_filename_only = false,  -- shows base filename only instead of relative path in filename
                    modified_icon = "+ ",        -- change the default modified icon
                    modified_italic = true,      -- set to true by default; this determines whether the filename turns italic if modified
                    show_tabs_only = false,      -- this shows only tabs instead of tabs + buffers
                }
            }
            vim.cmd [[
              set guioptions-=e " Use showtabline in gui vim
              set sessionoptions+=tabpages,globals " store tabpages and globals in session
            ]]
        end,
    }

}, {})
