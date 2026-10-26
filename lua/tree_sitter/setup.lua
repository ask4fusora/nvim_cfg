local success, arborist = pcall(require, "arborist")
if not success then
    vim.notify(
        "`arborist` is either not installed or not available.",
        vim.log.levels.ERROR
    )
    return
end

if vim.fn.executable("tree-sitter") == 0 then
    vim.notify("`tree-sitter` is not an executable!", vim.log.levels.ERROR)
    return
end

vim.treesitter.language.register("lua", "xmake")

arborist.setup({
    update_cadence = "weekly",
    automatic_install = false,
    install_popular = true,
    ensure_installed = {
        "comment",
        "moonbit",
        "moonbit_mbtp",
        "moonbit_quotation",
        "markdown",
        "markdown_inline",
        "typst",
        "mermaid",
        "astro",
        "zig",
        "rust",
        "c",
        "cpp",
        "php",
        "ruby",
        "odin",
        "sql",
        "lua",
        "luap",
        "luadoc",
        "luau",
        "typescript",
        "tsx",
        "toml",
        "json",
        "nu",
        "powershell",
        "bash",
    },
    overrides = {
        nuon = {
            url = "https://github.com/melMass/tree-sitter-nuon",
        },
    },
})
