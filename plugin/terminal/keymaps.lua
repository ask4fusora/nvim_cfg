local terminal = require("terminal")

vim.keymap.set({ "i", "n", "v", "t" }, "<M-NL>" --[[<C-M-j>]], terminal.toggle)
