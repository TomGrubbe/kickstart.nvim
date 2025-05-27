-- Use tree-style file explorer
vim.cmd 'let g:netrw_liststyle = 3'

-- Simulate NerdTree
-- vim.api.nvim_set_keymap('n', '<C-N>', ':Lexplore<CR> :vertical resize 30<CR>', { noremap = true })

-- From .vimrc
vim.cmd 'set fileformat=unix'
vim.cmd 'set ffs=unix,dos'
vim.opt.number = false
-- vim.cmd("set number relativenumber")
vim.cmd 'set tabstop=2'
vim.cmd 'set shiftwidth=2'
vim.cmd 'set expandtab'
vim.cmd 'set autoindent'
vim.cmd 'set foldlevel=1'
vim.cmd 'set nowrap'
vim.cmd 'set noswapfile'
vim.cmd 'set nobackup'
vim.cmd 'set undodir=~/.config/nvim/undodir'
vim.cmd 'set undofile'
vim.cmd 'set incsearch'
vim.cmd 'let loaded_matchparen=1'
vim.cmd 'set scrolloff=6'

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'

vim.cmd 'filetype on'
vim.cmd 'syntax on'

-- Use vim-type of mouse selection behavior
vim.cmd 'set mouse='

-- make vim save and load the folding of the document each time it loads"
-- also places the cursor in the last place that it was left."
--vim.cmd 'au BufWinLeave * mkview'
--vim.cmd 'au BufWinEnter * silent loadview'
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = { '*' },
  callback = function()
    if vim.fn.line '\'"' > 1 and vim.fn.line '\'"' <= vim.fn.line '$' then
      vim.api.nvim_exec('normal! g\'"', false)
    end
  end,
})

-- Templates
vim.cmd 'autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/bash_init.sh'
vim.cmd 'autocmd BufNewFile *.go 0r ~/.config/nvim/templates/go_init.go'

require 'tomg.core.term'
require 'tomg.core.luasnips'
require 'tomg.core.diag'
require 'tomg.core.keymaps'

--------------------------------------------------------------------------
-- END  TomG
--------------------------------------------------------------------------
