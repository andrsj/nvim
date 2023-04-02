-- [[ Setting options ]]
local opt_global = {
    hlsearch = false,
    mouse = 'a',
    clipboard = 'unnamedplus',
    undofile = true,
    smartcase = true,
    smarttab = true,
    updatetime = 250,
    timeout = true,
    timeoutlen = 300,
    completeopt = 'menuone,noselect',
    termguicolors = true,
    syntax = "on",
    autoindent = true,
    encoding = 'utf-8',
    ruler = true,
    title = true,
    wildmenu = true,
    showcmd = true,
    showmatch = true,
    inccommand = "split",
    cursorcolumn = true,
    cursorline = true,
    -- Tabs,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    --
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
