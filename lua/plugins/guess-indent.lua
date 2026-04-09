-- fix for indentation on new line
return {
  "nmac427/guess-indent.nvim",
  config = function()
    require("guess-indent").setup {
      exclude = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    }
  end,
}
