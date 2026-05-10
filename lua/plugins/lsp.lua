local servers = {
  "lua_ls",
  "gopls",
  "basedpyright",
  "ruff",
  "vtsls",
  "astro",
  "eslint",
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = true,
      virtual_text = { source = "if_many", spacing = 2 },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      } or {},
    }

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          completion = { callSnippet = "Replace" },
        },
      },
    })

    vim.lsp.config("ruff", {
      on_attach = function(client)
        client.server_capabilities.hoverProvider = false
      end,
    })

    require("mason-tool-installer").setup {
      ensure_installed = {
        "stylua",
        "goimports",
        "gofumpt",
        "ruff",
        "prettier",
      },
    }

    require("mason-lspconfig").setup {
      ensure_installed = servers,
      automatic_enable = servers,
    }

    vim.lsp.enable(servers)
  end,
}
