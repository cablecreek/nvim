return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    bigfile = { enabled = true },
    image = { enabled = true },

    picker = {
      enabled = true,
      sources = {
        files = {
          hidden = true,
        },
        explorer = {
          hidden = true,
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- Explorer
    { "<leader>E", function() Snacks.picker.explorer() end, desc = "File Explorer" },

    -- Pickers
    { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
    { '<leader>sf', function() Snacks.picker.files() end, desc = 'Find Files' },
    { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep' },
    { '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
    { '<leader>sw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume" },
    -- nvim related
    { '<leader>sn', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = '[S]earch [N]eovim files' },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    -- git
    { '<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git Log' },
    { '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status' },
    { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff (Hunks)' },
    -- lsp
    { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
    { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
  },
}
