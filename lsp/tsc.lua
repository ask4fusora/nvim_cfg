---@type vim.lsp.Config
return {
    cmd = require("lsp.adapter.node_modules").cmd(
        "tsc",
        { "--lsp", "--stdio" }
    ),
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    settings = {
        ["js/ts"] = {
            inlayHints = {
                parameterNames = {
                    enabled = "literals",
                    suppressWhenArgumentMatchesName = true,
                },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
            },
            referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
            },
            implementationsCodeLens = {
                enabled = true,
                showOnInterfaceMethods = true,
                showOnAllClassMethods = true,
            },
        },
    },
    root_dir = function(bufnr, on_dir)
        local deno_lock_root = vim.fs.root(bufnr, { "deno.lock" })
        local deno_root = vim.fs.root(bufnr, { { "deno.json", "deno.jsonc" } })
        local node_compat_root = vim.fs.root(bufnr, {
            {
                "package-lock.json",
                "yarn.lock",
                "pnpm-lock.yaml",
                "bun.lockb",
                "bun.lock",
            },
            { ".git" },
        })

        if
            deno_lock_root
            and (not node_compat_root or #deno_lock_root > #node_compat_root)
        then
            return
        end

        if
            deno_root
            and (not node_compat_root or #deno_root >= #node_compat_root)
        then
            return
        end

        return on_dir(node_compat_root or vim.fn.getcwd())
    end,
    before_init = function()
        require("lsp.adapter.typescript").setup_better_error()
    end
}
