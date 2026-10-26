local is_ssh = vim.env.SSH_TTY or vim.env.SSH_CLIENT or vim.env.SSH_CONNECTION
if not is_ssh then
    return
end

vim.g.clipboard = {
    name = "osc52",
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        -- Nvim uses the configured provider to write to the system clipboard.
        -- Reading from the system clipboard with OSC 52 is not supported, as
        -- this would allow any arbitrary program in the terminal to read the
        -- user's clipboard.
        ["+"] = function()
            vim.notify(
                "Pasting via osc52 is not supported.",
                vim.log.levels.WARN
            )
            return {
                vim.split(vim.fn.getreg("+"), "\n"),
                vim.fn.getregtype("+"),
            }
        end,
        ["*"] = function()
            vim.notify(
                "Pasting via osc52 is not supported.",
                vim.log.levels.WARN
            )
            return {
                vim.split(vim.fn.getreg("*"), "\n"),
                vim.fn.getregtype("*"),
            }
        end,
    },
}
