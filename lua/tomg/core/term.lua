-- From: https://www.youtube.com/watch?v=ooTcnx066Do&t=410s
  --[[
  vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    end,
  })
  ]]

  -- Open terminal in insert mode.  Pre Ctrl+\ Ctrl+N to go to normal mode
  vim.cmd 'autocmd TermOpen * startinsert'

  -- Open new horizontal splitter with a terminal. Adjust the vertical height
  vim.keymap.set('n', 'tth', function()
    vim.cmd.new()
    vim.cmd.term()
    vim.api.nvim_win_set_height(0, 15)
  end, { desc = 'Open a terminal in a new horizontal splitter' })

  -- Open new bertical splitter with a terminal. Adjust the horizontal width
  vim.keymap.set('n', 'ttv', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.api.nvim_win_set_width(0, 70)
  end, { desc = 'Open a terminal in a new horizontal splitter' })

