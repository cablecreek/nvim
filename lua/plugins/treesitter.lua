return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs", -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
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
      "latex",
      "nix",
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    fold = { enable = true },
  },
}
