-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 700 })
    end,
    group = highlight_group,
    pattern = '*',
})

-- Function that convert table to string
function _G.table_to_string(tbl)
    local result = {}
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            v = table_to_string(v)
        end
        table.insert(result, k .. ": " .. tostring(v))
    end
    return "{" .. table.concat(result, ", ") .. "}"
end

-- Function which print Lua table
function _G.print_table(tbl)
    local tbl_str = table_to_string(tbl)
    vim.api.nvim_echo({ { tbl_str, "Normal" } }, true, {})
end

-- print_table(require('telescope').extensions.command_palette)
