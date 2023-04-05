-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('andrsj.plugins')

require('andrsj.plugins.blankline')
require('andrsj.plugins.cmp')
require('andrsj.plugins.gitsigns')
require('andrsj.plugins.lualine')
require('andrsj.plugins.neo-tree')
require('andrsj.plugins.onedark')
require('andrsj.plugins.tabline')
require('andrsj.plugins.telescope')
require('andrsj.plugins.toggle-term')
require('andrsj.plugins.tree-sitter')
require('andrsj.plugins.whichkey')
require('andrsj.plugins.window-picker')

require('Comment').setup()

require('andrsj.settings')
require('andrsj.keymaps')
require('andrsj.lsp')
require('andrsj.utils')





-- Exapmples of TODO comments:
-- PERF:    text
-- TODO:    text
-- HACK:    text
-- FIX:     text
-- WARNING: text
-- NOTE:    text
-- INFO:    text
-- XXX:     text
-- TEST:    text
-- BUG:     text



-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
