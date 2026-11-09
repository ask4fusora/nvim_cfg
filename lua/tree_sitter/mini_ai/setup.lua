local success, mini_ai = pcall(require, "mini.ai")
if not success then
    vim.notify(
        "`mini.ai` is either not installed or not available.",
        vim.log.levels.ERROR
    )
    return
end

mini_ai.setup({
    mappings = {
        around_next = "aN",
        inside_next = "iN",
        around_last = "aL",
        inside_last = "iL",
    },
})
