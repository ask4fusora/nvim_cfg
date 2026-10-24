---@type vim.lsp.Config
return {
    cmd = require("lsp.adapters.node_modules").cmd("biome", { "lsp-proxy" }),
    filetypes = {
        "astro",
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "svelte",
        "typescript",
        "typescriptreact",
        "vue",
    },
    workspace_required = true,
    root_markers = { { "biome.json", "biome.jsonc" } },
}
