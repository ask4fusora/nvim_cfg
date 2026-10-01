---@type vim.lsp.Config
return {
    cmd = require("lsp.adapter.node_modules").cmd(
        "vscode-json-language-server"
    ),
    filetypes = { "json", "jsonc" },
    init_options = {
        provideFormatter = true,
    },
    root_markers = { ".git" },
}
