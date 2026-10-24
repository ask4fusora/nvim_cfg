---@type vim.lsp.Config
return {
    cmd = require("lsp.adapters.node_modules").cmd("dprint", { "lsp" }),
    filetypes = { "markdown" },
    root_markers = {
        { "dprint.json", "dprint.jsonc" },
    },
}
