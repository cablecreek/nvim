return {
  "cablecreek/tf-docs.nvim",
  dependencies = {
    "folke/snacks.nvim", -- snacks is the default picker
    "MeanderingProgrammer/render-markdown.nvim",
  },
  opts = {
    providers = {
      -- official
      "aap",
      "ad",
      "archive",
      "aws",
      "awscc",
      "azuread",
      "azurerm",
      "azurestack",
      "boundary",
      "cloudinit",
      "consul",
      "dns",
      "external",
      "google",
      "google-beta",
      "helm",
      "hcs",
      "hcp",
      "http",
      "ibm",
      "instana",
      "kubernetes",
      "local",
      "nomad",
      "null",
      "ode",
      "random",
      "template",
      "tfe",
      "tfmigrate",
      "time",
      "tls",
      "turbonomic",
      "vault",

      -- partner
      "oci",
      "alicloud",
      "scalr",

      -- custom
      {
        name = "tf-docs",
        repo_url = "https://github.com/cablecreek/tf-doc-mock-provider.git",
        search_title = "Mock (current) docs for tf-docs.nvim",
        file_extension = ".md",
      },
      {
        name = "tf-docs-legacy",
        repo_url = "https://github.com/cablecreek/tf-doc-mock-provider.git",
        is_legacy_docs = true,
        search_title = "Mock (legacy) docs for tf-docs.nvim",
        file_extension = ".html.markdown",
      },
    },
  },

  vim.keymap.set("n", "<leader>tf", "<cmd>TFDocsUnderCursor<CR>"),
}
