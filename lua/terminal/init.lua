local M = {}

---@return integer
local function default_height()
    return math.max(1, math.floor((1 - 0.618) * vim.o.lines))
end

---@return integer[]
local function term_buffers()
    return vim.iter(vim.api.nvim_list_bufs())
        :filter(function(buf)
            ---@cast buf integer

            return vim.api.nvim_buf_is_valid(buf)
                and vim.bo[buf].buftype == "terminal"
        end)
        :totable()
end

---@return integer[]
local function opened_term_windows()
    return vim.iter(vim.api.nvim_tabpage_list_wins(0))
        :filter(function(win)
            ---@cast win integer

            local buf = vim.api.nvim_win_get_buf(win)
            return vim.bo[buf].buftype == "terminal"
        end)
        :totable()
end

---@param height integer
---@return integer
local function open_term_win(height)
    vim.cmd(("botright %s split"):format(height))
    return vim.api.nvim_get_current_win()
end

---@param buf integer
local function open_term(buf)
    local height = default_height()
    local win = open_term_win(height)
    vim.api.nvim_win_set_buf(win, buf)
end

local function create_term()
    vim.ui.input({ prompt = ":term " }, function(cmd)
        if cmd == nil then
            return
        end

        local height = default_height()
        open_term_win(height)

        if cmd == "" then
            vim.cmd.terminal()
        else
            vim.cmd.terminal(cmd)
        end
    end)
end

---@param bufnrs integer[]
local function select_and_open_term(bufnrs)
    vim.ui.select(bufnrs, {
        prompt = ":b ",
        format_item = function(bufnr)
            local name = vim.api.nvim_buf_get_name(bufnr)
            return name ~= "" and name or "[No Name]"
        end,
    }, function(choice)
        if choice then
            open_term(choice)
        end
    end)
end

---@param winnrs integer[]
local function hide_wins(winnrs)
    vim.iter(winnrs):each(function(winnr)
        ---@cast winnr integer

        if not vim.api.nvim_win_is_valid(winnr) then
            return
        end

        vim.api.nvim_win_hide(winnr)
    end)
end

function M.toggle()
    local winnrs = opened_term_windows()
    if #winnrs > 0 then
        hide_wins(winnrs)
        return
    end

    local term_bufnrs = term_buffers()

    if #term_bufnrs == 0 then
        create_term()
    elseif #term_bufnrs == 1 then
        open_term(term_bufnrs[1])
    else
        select_and_open_term(term_bufnrs)
    end
end

return M
