local M = {}

M.setup_better_error = require("util.functional").exec_once(function()
    local success, bte = pcall(require, "ts-error-translator")
    if not success then
        vim.notify(
            "`ts-error-translator` is either not installed or not available.",
            vim.log.levels.ERROR
        )
        return
    end

    bte.setup({
        auto_attach = true,
        servers = {
            "astro-language-server",
            "vtsls",
        },
    })
end)

return M
