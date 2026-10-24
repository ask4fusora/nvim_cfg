vim.api.nvim_create_user_command("PickBuffer", function()
    require("pickers.buffer").open()
end, {})
