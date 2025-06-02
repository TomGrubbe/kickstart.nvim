
-- Enable/disable linting noise
-- From: https://www.reddit.com/r/neovim/comments/1ae6iwm/disable_lsp_diagnostics/
vim.g["diagnostics_active"] = true
function Toggle_diagnostics()
    if vim.g.diagnostics_active then
        vim.g.diagnostics_active = false
        vim.diagnostic.enable(false)
    else
        vim.g.diagnostics_active = true
        vim.diagnostic.enable(true)
    end
end

vim.keymap.set('n', '<leader>xd', Toggle_diagnostics, { noremap = true, silent = true, desc = "Toggle vim diagnostics" })

-- vim.g.diagnostics_active = false
-- vim.diagnostic.enable(false)
