-- ensure globals run at start
require 'config.globals'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ load configurations ]]
require 'config.keymaps'
require 'config.options'
require 'config.autocmds'
require 'config.lazy'
