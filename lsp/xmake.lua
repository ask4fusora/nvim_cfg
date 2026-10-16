---@type vim.lsp.Config
return {
    cmd = { "xmake_ls", "--editor=neovim" },
    filetypes = { "xmake" },
    root_markers = { "xmake.lua" },
    cmd_env = {
        LOCALAPPDATA = vim.fn.expand(vim.env.XDG_STATE_HOME or "~/.local/state"),
    },
}
