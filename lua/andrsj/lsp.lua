require('neodev').setup()
require('mason').setup()



local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local mason_lspconfig = require 'mason-lspconfig'



-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader><C-r>', vim.lsp.buf.rename, '[r]ename')


    nmap('<leader>gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
    nmap('<leader>gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
    nmap('<leader>gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')

    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

    nmap('<leader>sc', vim.lsp.buf.code_action, '[s]earch [c]ode Action')
    nmap('<leader>sd', require('telescope.builtin').lsp_document_symbols, '[s]earch [d]ocument Symbols')

    nmap('<leader>i', require('telescope.builtin').lsp_incoming_calls, '[i]ncomming calls')
    nmap('<leader>o', require('telescope.builtin').lsp_outgoing_calls, '[o]utgoing calls')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<M-k>', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove Folder')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[w]orkspace [s]ymbols')

    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[w]orkspace [l]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(
        bufnr,
        'Format',
        function(_)
            vim.lsp.buf.format()
        end,
        { desc = 'Format current buffer with LSP' }
    )
end


-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    gopls = {},
    pyright = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}
