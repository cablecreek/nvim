-- Force tab settings for javascript files
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

-- Ensure settings persist even if other plugins try to override
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  buffer = 0,
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})
