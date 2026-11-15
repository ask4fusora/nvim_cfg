local M = {}

function M.lnext()
    local ok = pcall(vim.cmd.cnext)
    if not ok then
        vim.cmd.lfirst()
    end
end

function M.lprevious()
    local ok = pcall(vim.cmd.cprevious)
    if not ok then
        vim.cmd.llast()
    end
end

function M.cnext()
    local ok = pcall(vim.cmd.cnext)
    if not ok then
        vim.cmd.cfirst()
    end
end

function M.cprevious()
    local ok = pcall(vim.cmd.cprevious)
    if not ok then
        vim.cmd.clast()
    end
end

return M
