return  { -- {{{ Formatting
    "stevearc/conform.nvim",
    dependencies = {
      { url = "git@git.corp.stripe.com:stevearc/nvim-stripe-configs" },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          jsonc = { "prettierd" },
          graphql = { "prettierd" },
          go = { "goimports", "gofmt" },
          lua = { "stylua" },
          sql = { "zoolander_format_sql" },
          bzl = { "buildifier" },
          scala = { "zoolander_format_scala" },
          terraform = { "sc_terraform" },
        },
        formatters = {
          goimports = {
            cmd = vim.env.HOME .. "/stripe/gocode/bin/goimports",
          },
        },
        format_after_save = { lsp_format = "fallback" },
      })
    end,
  }
