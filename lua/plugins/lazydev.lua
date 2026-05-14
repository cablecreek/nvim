return {
  "folke/lazydev.nvim",
  ft = "lua",
  cmd = "LazyDev",
  keys = {
    { "<leader>ll", "<cmd>LazyDev lsp<cr>", desc = "LazyDev LSP info" },
  },
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}
