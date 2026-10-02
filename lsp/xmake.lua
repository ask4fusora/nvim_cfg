---@type vim.lsp.Config
return {
    cmd = { "xmake_ls", "--editor=neovim" },
    filetypes = { "xmake" },
    root_markers = { "xmake.lua" },
}
