-- Misc keymaps
--
local opts = { noremap = true, silent = true }

-- Convenient alias
--local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

-- Splitter navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)



