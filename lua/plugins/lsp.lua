local servers = {
  "bashls",
  "dockerls",
  "gopls",
  "html",
  "lua_ls",
  "marksman",
  "ruff",
  "sqls",
  "templ",
  "terraformls",
  "ty",
  "ts_ls",
  "vimls",
  "yamlls",
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-tool-installer").setup {
      ensure_installed = {
        "stylua",
        "prettier",
        "goimports",
        "gofumpt",
        "ty",
      },
    }

    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME, vim.fn.stdpath "config" },
          },
          format = {
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
              tab_width = "2",
            },
          },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
          usePlaceholders = true,
        },
      },
    })

    vim.lsp.config("ts_ls", {})

    vim.lsp.config("ruff", {
      on_attach = function(client)
        client.server_capabilities.hoverProvider = false
      end,
    })

    vim.lsp.config("ty", {
      settings = {
        ty = {},
      },
    })

    vim.lsp.config("yamlls", {
      settings = {
        yaml = { keyOrdering = false },
      },
    })

    require("mason-lspconfig").setup {
      ensure_installed = servers,
      automatic_enable = servers,
    }

    vim.diagnostic.config {
      severity_sort = true,
      update_in_insert = false,
      float = { border = "rounded", source = "if_many" },
      underline = true,
      virtual_text = { spacing = 2, source = "if_many" },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      } or {},
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
      callback = function(args)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
        end

        map("n", "K", function()
          vim.lsp.buf.hover {
            border = "rounded",
            max_width = math.floor(vim.o.columns * 0.7),
            max_height = math.floor(vim.o.lines * 0.5),
          }
        end, "LSP Hover")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
      end,
    })
  end,
}
