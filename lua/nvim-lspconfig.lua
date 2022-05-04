function ensure_server(name)
    local lsp_installer = require'nvim-lsp-installer.servers'
    local ok, server = lsp_installer.get_server(name)
    if  ok then
        server:install()
    end
    return server
end

ensure_server('clangd')
ensure_server('tsserver')
ensure_server('vimls')
ensure_server('html')
ensure_server('sumneko_lua')

