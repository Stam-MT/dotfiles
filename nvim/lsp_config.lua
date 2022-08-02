
local custom_attach = function(client, bufnr)

    -- Keybinds
    local function
        buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap=true, silent=true }

    -- LSP Client
    buf_set_keymap('n', '<leader>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set("n", "<leader>ek", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>ej", vim.diagnostic.goto_next, {buffer=0})


    -- Telescope
    buf_set_keymap('n', 'td', '<Cmd>Telescope lsp_definitions<CR>', opts)
    buf_set_keymap('n', 'ti', '<Cmd>Telescope lsp_implementations<CR>', opts)
    buf_set_keymap('n', 'tt', '<Cmd>Telescope lsp_type_definitions<CR>', opts)
    buf_set_keymap('n', 'tr', '<Cmd>Telescope lsp_references<CR>', opts)
    buf_set_keymap('n', 'tj', '<Cmd>Telescope lsp_document_symbols<CR>', opts)
    buf_set_keymap('n', 'te', '<Cmd>Telescope diagnostics<CR>', opts)


    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_formatting then
        vim.cmd([[
            augroup formatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
                autocmd BufWritePre <buffer> lua OrganizeImports(1000)
            augroup END
        ]])
    end

    if client.server_capabilities.document_highlight then
        vim.cmd([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
    end
end



local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp = require('lspconfig')



-- LANGUAGE SERVERS

-- Python
lsp.pylsp.setup{
  on_attach=custom_attach,
  capabilities=capabilities
}
-- C#
lsp.csharp_ls.setup{
  on_attach=custom_attach,
  capabilities=capabilities
}
