return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  opts = {
    columns = {
      'icon',
      -- 'permissions',
      -- 'size',
      -- 'mtime',
    },
    -- Buffer-local options to use for oil buffers
    buf_options = {
      buflisted = false,
      bufhidden = 'hide',
    },

    view_options = {
      show_hidden = true,
    },
    watch_for_changes = true,
    preview_split = 'auto',
    confirmation = {
      border = 'rounded',
      win_options = {
        winblend = 0,
        winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
      },
    },
    float = {
      border = 'rounded', -- or "single", "double", etc.
      win_options = {
        winblend = 0,
        winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
      },
    },
  },
}
