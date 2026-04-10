return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter"

    -- 1. Setup highlights and other features
    ts.setup {
      highlight = {
        enable = true,
        -- This ensures Treesitter takes over from standard Vim syntax
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    }

    -- 2. Install your languages
    ts.install {
      "bash",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "python",
      "sql",
      "terraform",
      "hcl",
      "javascript",
      "typescript",
      "yaml",
      "go",
      "dockerfile",
      "templ",
      "nix",
    }
  end,
}
