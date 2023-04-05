local null_ls = require('null-ls')

local f = null_ls.builtins.formatting
local ca = null_ls.builtins.code_actions
local c = null_ls.builtins.completion
local d = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        -- Lua
        f.stylua,
        -- f.lua_format,

        -- JS
        f.eslint,
        -- f.prettier,

        -- Python
        -- f.autopep8,
        -- f.autoflake,
        f.black,
        -- f.isort,

        -- Golang
        f.gofmt,
        -- f.gofumpt,
        f.goimports,
        -- f.goimports_reviser,
        -- f.golines,

        -- Markdown
        f.markdownlint,
        f.markdown_toc,

        -- SQL
        -- f.sqlfluff.with({
        --     extra_args = { "--dialect", "postgres" }, -- change to your dialect
        -- }),

        -- Golang
        ca.gomodifytags,
        ca.impl,
        ca.refactoring,
        -- Spellcheck
        ca.shellcheck,

        c.spell,

        -- d.dotenv_linter,
        -- d.golangci_lint,
        d.golangci_lint.with({
            extra_args = {
                '--fast',
            },
        }),
        -- d.gospel,
        -- d.mypy,

        null_ls.builtins.hover.dictionary,
    },
})
