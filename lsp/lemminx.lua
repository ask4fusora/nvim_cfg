---@type vim.lsp.Config
return {
    cmd = { "lemminx" },
    filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
    root_markers = { ".git" },
    settings = {
        xml = {
            server = {
                workDir = vim.fn.expand("~/.cache/lemminx"),
            },
            logs = {
                file = vim.fn.expand("~/.cache/lemminx/logs/lemminx.log"),
            },
            fileAssociations = {
                {
                    pattern = "**/*.wsb",
                    systemId = "https://raw.githubusercontent.com/fflaten/vscode-windowssandbox-configuration/refs/heads/main/schemas/wsb.xsd",
                },
            },
        },
    },
}
