local M = {}

---@param fn fun():nil
---@return fun():nil
function M.exec_once(fn)
    local is_called = false
    return function()
        if is_called then
            return
        end
        fn()
        is_called = true
    end
end

return M
