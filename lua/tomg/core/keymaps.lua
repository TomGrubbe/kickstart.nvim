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

-- Netrw
-- See https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
keymap("n", "<leader>x", ":Explore<CR>", opts)
keymap("n", "<leader>hx", ":Hexplore!<CR>", opts)
keymap("n", "<leader>vx", ":Vexplore!<CR>", opts)

--keymap("n", "<C-j>", ":resize -2<CR>", opts)
--keymap("n", "<C-k>", ":resize +2<CR>", opts)
--keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
--keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)


