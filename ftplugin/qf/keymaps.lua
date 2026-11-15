local qf = require("qf")

vim.keymap.set("n", "]l", qf.lnext)
vim.keymap.set("n", "[l", qf.lprevious)
vim.keymap.set("n", "]q", qf.cnext)
vim.keymap.set("n", "[q", qf.cprevious)
