-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = {
    'windwp/nvim-ts-autotag', -- Automatically close HTML tags
  },
  opts = {},
  config = function(plugin, opts)
    require('nvim-autopairs').setup(opts)

    -- Setup autotag for HTML/JSX tag closing
    require('nvim-ts-autotag').setup({
      filetypes = {
        'html',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'svelte',
        'vue',
        'tsx',
        'jsx',
        'rescript',
        'xml',
        'php',
        'markdown',
        'astro',
        'glimmer',
        'handlebars',
        'hbs',
      },
    })
  end,
}
