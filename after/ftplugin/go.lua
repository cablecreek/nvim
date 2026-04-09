-- add if err != nil statement
-- vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = '[E]rror =! nil' })
vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>log.Fatal().Err(err).Msg("")<CR>}<Esc>F"a', { desc = '[E]rror: log.Fatal().Err(err).Msg("")' })
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
