local color_theme = "onedark"
vim.o.background = "dark"

---@type string|nil
local system_theme = vim.env.SYSTEM_THEME
if system_theme and system_theme:find("Light") then
    color_theme = "onelight"
    vim.o.background = "light"
end

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

vim.cmd.colorscheme(color_theme)
