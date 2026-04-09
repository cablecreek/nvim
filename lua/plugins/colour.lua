return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }

    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight-night'

    -- Customize window separator colors
    -- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#7aa2f7', bg = 'NONE' }) -- Blue separator
    -- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#FF5555' }) -- Red divider color
    vim.opt.fillchars = { vert = '┃', horiz = '━' }
    -- Optional: Set custom fill characters for window separators
    -- vim.opt.fillchars = {
    --   horiz = '━', -- horizontal separator character
    --   horizup = '┻', -- horizontal separator going up
    --   horizdown = '┳', -- horizontal separator going down
    --   vert = '┃', -- vertical separator character
    --   vertleft = '┫', -- vertical separator going left
    --   vertright = '┣', -- vertical separator going right
    --   verthoriz = '╋', -- vertical and horizontal separator intersection
    -- }
  end,
}
