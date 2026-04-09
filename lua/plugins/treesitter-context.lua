return {
  'nvim-treesitter/nvim-treesitter-context',
  build = ':TSContextEnable',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    multiline_threshold = 5,
  },
}
