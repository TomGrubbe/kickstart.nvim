-- Misc keymaps
--
local opts = { noremap = true, silent = true }

-- Convenient alias
--local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

-- Splitter navigation
keymap('n', '<C-Left>', '<C-w>h', opts)
keymap('n', '<C-Right>', '<C-w>l', opts)
keymap('n', '<C-Up>', '<C-w>k', opts)
keymap('n', '<C-Down>', '<C-w>j', opts)

-- Netrw
-- See https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
keymap('n', '<leader>x', ':Explore<CR>', opts)
keymap('n', '<leader>hx', ':Hexplore!<CR>', opts)
keymap('n', '<leader>vx', ':Vexplore!<CR>', opts)

--keymap("n", "<C-j>", ":resize -2<CR>", opts)
--keymap("n", "<C-k>", ":resize +2<CR>", opts)
--keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
--keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

vim.g['whitespace_showing'] = true

local function Toggle_whitespace()
  if vim.g.whitespace_showing then
    vim.cmd 'set nonumber norelativenumber'
    vim.cmd 'set nolist'
    vim.cmd 'set signcolumn=no'
    vim.g.whitespace_showing = false
  else
    vim.cmd 'set number relativenumber'
    vim.cmd 'set list'
    vim.cmd 'set signcolumn'
    vim.g.whitespace_showing = true
  end
end

vim.keymap.set('n', '<leader>ws', Toggle_whitespace, { noremap = true, silent = true, desc = 'Toggle whitespace chars' })
