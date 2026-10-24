_G.fsr = {}

local initializer = require("initializer")

initializer.register({
    {
        event = "PackChanged",
        once = false,
        module_names = {
            "plugin.fff.setup",
        },
    },
})

initializer.require_modules(nil, {
    "tweak.setup",
    "plugin.setup",
    "keymap.setup",
    "appearance.setup",
    "notification.setup",
    "filetype.setup",
})

initializer.register({
    {
        event = "UIEnter",
        module_names = {
            "opt.setup",
            "ssh.setup",
            "appearance.icon.setup",
            "statusline.setup",
            "file_explorer.setup",
            "pickers.fff.setup",
            "autocmds.open_quick_fix_list_post_grep.setup",
            "user_commands.neovim_open_settings.setup",
            "user_commands.vim_pack_remove_inactive.setup",
            "user_commands.pick_buffer.setup",
            "which_key.setup",
        },
    },
    {
        event = "LspAttach",
        module_names = {
            "lsp.completion.setup",
            "lsp.diagnostic.setup",
            "lsp.document_highlight.setup",
            "lsp.keymap.setup",
        },
    },
    {
        event = "FileType",
        module_names = {
            "tree_sitter.setup",
            "tree_sitter.mini_ai.setup",
            "lsp.setup",
        },
    },
    {
        event = "FileType",
        pattern = "typst",
        module_names = {
            "ftplugins.typst.setup",
        },
    },
    {
        event = "FileType",
        pattern = { "nu", "nuon" },
        once = false,
        module_names = {
            "ftplugins.nu.editorconfig.setup",
        },
    },
    {
        event = "BufEnter",
        module_names = {
            "formatter.setup",
            "autocmds.highlight_on_yank.setup",
        },
    },
})

initializer.require_modules(nil, {
    "project_settings.setup",
})
