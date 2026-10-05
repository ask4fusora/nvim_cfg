---@type vim.lsp.Config
return {
    cmd = { "lemminx" },
    filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
    root_markers = { ".git" },
    settings = {
        xml = {
            fileAssociations = {
                {
                    pattern = "**/*.wsb",
                    systemId = "https://raw.githubusercontent.com/fflaten/vscode-windowssandbox-configuration/refs/heads/main/schemas/wsb.xsd",
                },
            },
        },
    },
}
