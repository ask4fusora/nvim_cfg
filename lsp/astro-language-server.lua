---@type vim.lsp.Config
return {
    cmd = require("lsp.adapters.node_modules").cmd("astro-ls"),
    filetypes = { "astro" },
    root_markers = { "tsconfig.json", "package.json", ".git" },
    init_options = {
        typescript = {},
    },
    before_init = function(_, config)
        require("lsp.adapters.node_modules").configure_tsdk(config)
    end,
}
