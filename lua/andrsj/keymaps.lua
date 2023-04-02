-- Variables
local neo_tree = require('neo-tree.command')
local telescope = require('telescope')
local tb = require('telescope.builtin')


-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')



vim.api.nvim_set_keymap('n', '<leader><Tab>', '<C-w><C-w>', { noremap = true, silent = true, desc = '[Tab] (switch)' })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, desc = '[s]ave file' })



-- Formatting
vim.keymap.set('n', '<C-f>', function()
    -- vim.lsp.buf.format() -- The same for down below!
    vim.cmd('Format') -- NOTE: User defined command from lsp.lua:53
end, { noremap = true, silent = true, desc = '[F]ormat file' })



-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })



-- Diagnostic keymaps
vim.keymap.set('n', '<leader>j[d', vim.diagnostic.goto_prev, { desc = "[j]ump to previous [d]iagnostic message" })
vim.keymap.set('n', '<leader>j]d', vim.diagnostic.goto_next, { desc = "[j]ump to next [d]iagnostic message" })
vim.keymap.set('n', '<leader>f', vim.diagnostic.open_float, { desc = "Open [f]loating diagnostic message" })



--[[NeoTree]]
vim.keymap.set('n', '<leader>e', function()
    neo_tree.execute({
        toggle = true,
        position = 'left',
        source = 'filesystem'
    })
end, { noremap = true, silent = true, desc = '[e]xplorer leftside [neo-tree]' }) --`:Neotree toggle left<CR>',

vim.keymap.set('n', '<leader>E', function()
    neo_tree.execute({
        toggle = true,
        position = 'float',
        source = 'filesystem'
    })
end, { noremap = true, silent = true, desc = '[E]xplorer float window [neo-tree]' }) --':Neotree float toggle<CR>',

vim.keymap.set('n', '<leader>b', function()
    neo_tree.execute({
        toggle = true,
        position = 'float',
        source = 'buffers'
    })
end, { noremap = true, silent = true, desc = '[b]uffers (neo-tree)' }) --':Neotree float toggle<CR>',


-- [[ToggleTerm]]
vim.keymap.set('n', '<leader>th', function()
    vim.cmd('ToggleTerm direction=horizontal')
end, { desc = 'ToggleTerm horizontal' })
vim.keymap.set('n', '<leader>tv', function()
    vim.cmd('ToggleTerm size=70 direction=vertical')
end, { desc = 'ToggleTerm vertical' })
vim.keymap.set('n', '<leader>tT', function() vim.cmd('ToggleTerm direction=tab') end, { desc = 'ToggleTerm tab' })
vim.keymap.set('n', '<leader>tf', function() vim.cmd('ToggleTerm direction=float') end, { desc = 'ToggleTerm float' })


-- [[TODO Comments]]
vim.keymap.set('n', '<leader>sC', function() vim.cmd('TodoTelescope') end, { desc = 'TODO: [S]earch [C]omments' })



-- [[Markdown Preview]]
vim.api.nvim_set_keymap('n', '<leader>md', ':MarkdownPreview<CR>',
    { noremap = true, silent = true, desc = '[m]ark[d]ownPreview' })
vim.api.nvim_set_keymap('n', '<leader>ms', ':MarkdownPreviewStop<CR>',
    { noremap = true, silent = true, desc = '[m]arkdownPreview [s]top' })



-- [[Telescope]]
-- vim.keymap.set('n', '<leader>H', telescope.extensions.http.list, { desc = '[H]TTP Status codes' })
vim.keymap.set('n', '<leader>H', function()
    telescope.extensions.http.list({
        prompt_prefix = "Press <Enter> to go to 'https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/<code>': " })
end, { desc = '[H]TTP Status codes' })



-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', tb.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', tb.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>:', tb.command_history, { desc = '[:] Command History' })
vim.keymap.set('n', '<leader>/', tb.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
-- vim.keymap.set('n', '<leader><M-c>', ':Telescope command_palette<CR>', { desc = '[C]ommand palette', silent = false })
vim.keymap.set('n', '<leader><M-c>', function()
    -- vim.cmd('Telescope command_palette')
    local command_palette = require('telescope').extensions.command_palette
    command_palette.command_palette()
end, { desc = '[C]ommand palette', silent = false })

-- Search
vim.keymap.set('n', '<leader>sg', tb.live_grep, { desc = '[s]earch by [g]rep' })
vim.keymap.set('n', '<leader>sf', tb.find_files, { desc = '[s]earch [f]iles' })
vim.keymap.set('n', '<leader>sF', ':Telescope find_files cwd=', { desc = '[s]earch [F]iles in specific directory' })
vim.keymap.set('n', '<leader>sw', tb.grep_string, { desc = '[s]earch current [w]ord' })
vim.keymap.set('n', '<leader>sW', ':Telescope grep_string search=', { desc = '[s]earch specific [W]ord' })
vim.keymap.set('n', '<leader>sD', tb.diagnostics, { desc = '[s]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>ss', tb.spell_suggest, { desc = '[s]pell [s]uggest' })
vim.keymap.set('n', '<leader>sv', tb.treesitter, { desc = 'TREE SITTER: [s]earch [v]ariables' })

vim.keymap.set('n', '<leader>C', tb.colorscheme, { desc = '[C]olor Schema' })

vim.keymap.set('n', '<leader>S', function()
    tb.symbols { sources = { 'emoji', 'kaomoji', 'gitmoji', 'julia', 'latex', 'math', 'nerd' } }
end, { desc = '[S]ymbols' })

vim.keymap.set('n', '<leader>jl', tb.jumplist, { desc = '[j]ump [l]ist' })

vim.keymap.set('n', '<leader>R', tb.reloader, { desc = '[R]eloader' })
vim.keymap.set('n', '<leader>r', tb.registers, { desc = '[r]egister' })

-- Help
vim.keymap.set('n', '<leader>hk', tb.keymaps, { desc = '[h]elp [k]eymaps' })
vim.keymap.set('n', '<leader>hb', tb.builtin, { desc = '[h]elp [b]uilt-in' })
vim.keymap.set('n', '<leader>hc', function()
    tb.commands({
        prompt_title = 'v Search commands v',
        windblend = 70,
    })
end, { desc = '[h]elp [c]ommands' })
vim.keymap.set('n', '<leader>ho', tb.vim_options, { desc = '[h]elp Vim [o]ptions' })
vim.keymap.set('n', '<leader>ha', tb.autocommands, { desc = '[h]elp [a]uto Commands' })
vim.keymap.set('n', '<leader>hs', tb.help_tags, { desc = '[h]elp [s]earch' })

-- Git
vim.keymap.set('n', '<leader>Gf', tb.git_files, { desc = '[G]it [f]iles' })
vim.keymap.set('n', '<leader>Gc', tb.git_commits, { desc = '[G]it [c]ommits' })
vim.keymap.set('n', '<leader>GC', tb.git_bcommits, { desc = '[G]it [C]ommits for file' })
vim.keymap.set('n', '<leader>Gb', tb.git_branches, { desc = '[G]it [b]ranches' })
vim.keymap.set('n', '<leader>GS', tb.git_stash, { desc = '[G]it [S]tash' })

vim.keymap.set('n', '<leader>Gd', function()
    vim.cmd('Gdiffsplit')
end, { desc = '[G]it [d]iff' })

vim.keymap.set('n', '<leader>Gs', function()
    vim.cmd('Neotree float git_status')
end, { desc = '[G]it [s]tatus' })
