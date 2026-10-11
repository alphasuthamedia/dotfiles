vim.opt.number = true

-- " → default register
-- "+ → clipboard OS
-- "* → primary selection (Linux)
-- "_ → black hole (buang)
-- "0 → hasil yank terakhir
-- vim.opt.clipboard = "unnamedplus"
--- set -> mode / key / command
-- vim.keymap.set("v", "p", '"_dP')

-- biar langsung pindah sesuai yang pas + highligh possible
vim.opt.incsearch = true
vim.opt.hlsearch = true
require("config.lazy")
-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
