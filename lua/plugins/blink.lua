return { -- Autocompletion
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = {
        auto_show = true,
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "rust" },

    signature = {
      enabled = true,
    },
  },
}
