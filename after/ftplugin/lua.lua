-- add if err != nil statement
-- vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = '[E]rror =! nil' })
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

-------------------------------------------------------------------------------
--- nvim plugin dev
-------------------------------------------------------------------------------

-- source current file
vim.keymap.set("n", "<leader>x", function()
  vim.cmd "source %"
end, { desc = "Source current file" })

vim.keymap.set("n", "<leader>z", function()
  vim.cmd "PlenaryBustedFile %"
end, { desc = "test current file with Plenary" })
