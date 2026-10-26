local success, onedarkpro = pcall(require, "onedarkpro")
if not success then
    vim.notify(
        "`onedarkpro` is either not installed or not available.",
        vim.log.levels.ERROR
    )
    return
end

local allows_transparency = (
    type(vim.env.MY_TRANSPARENCY_ALPHA) == "string"
    and tonumber(vim.env.MY_TRANSPARENCY_ALPHA) ~= 1
)

onedarkpro.setup({
    highlights = {
        StatusLine = {},
        StatusLineNC = {},
        -- The left part of the cursor line. I don't want any background color there.
        CursorLineNr = { bg = "NONE", extend = true },
        CursorLineSign = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
    },

    options = {
        cursorline = not allows_transparency,
        transparency = allows_transparency,
    },
})

local color_scheme = {
    dark = "onedark",
    light = "onelight",
}

---@type "dark"|"light"
local color_mode = vim.env.MY_COLOR_MODE or "dark"

if color_mode == "light" then
    vim.o.background = "light"
    vim.cmd.colorscheme(color_scheme.light)
else
    vim.o.background = "dark"
    vim.cmd.colorscheme(color_scheme.dark)
end
