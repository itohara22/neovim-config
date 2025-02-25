local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("i", "kj", "<Esc>", opts)
keymap.set("i", "jk", "<Esc>", opts)
