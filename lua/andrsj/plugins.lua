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
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    -- Detect tabstop and shiftwidth
    { 'tpope/vim-sleuth' },
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
            'j-hui/fidget.nvim',
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
    { 'folke/which-key.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    {
        'navarasu/onedark.nvim',
        priority = 1000,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    { 'lukas-reineke/indent-blankline.nvim' },
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim' },
    {
        -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-symbols.nvim',
            'barrett-ruth/telescope-http.nvim',
            'LinArcX/telescope-command-palette.nvim',
        },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        config = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end,
    },
    {
        'iamcco/markdown-preview.nvim',
        post_install = function() vim.fn['mkdp#util#install']() end,
    },
    {
        'folke/todo-comments.nvim',
        config = function() require("todo-comments").setup() end
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    { 'kdheepak/tabline.nvim' },
    { 'fatih/vim-go' },
    { 'ap/vim-css-color' },
    { 'preservim/tagbar' },

}, {})
