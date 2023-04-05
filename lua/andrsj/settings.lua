-- [[ Setting options ]]
local opt_global = {
    hlsearch = false,
    mouse = 'a',
    clipboard = 'unnamedplus',
    undofile = true,
    smartcase = true,
    completeopt = 'menuone,noselect',
    termguicolors = true,
    syntax = 'on',
    autoindent = true,
    encoding = 'utf-8',
    ruler = true,
    title = true,
    wildmenu = true,
    showcmd = true,
    showmatch = true,
    inccommand = 'split',
    cursorcolumn = true,
    cursorline = true,
    -- Tabs,
    smarttab = true,
    expandtab = true,
    softtabstop = 4,
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true,
    --
    scrolloff = 8,
    signcolumn = 'yes',
    colorcolumn = '80',
    -- Timeouts
    timeoutlen = 300,
    updatetime = 250,
    timeout = true,
}

local window = {
    breakindent = true,
    signcolumn = 'yes',
    relativenumber = true,
    number = true,
}

for key, value in pairs(opt_global) do
    vim.opt_global[key] = value
end

for key, value in pairs(window) do
    vim.wo[key] = value
end
