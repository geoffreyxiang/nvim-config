return {
    "mfussenegger/nvim-lint",
    dependencies = {
      { url = "git@git.corp.stripe.com:stevearc/nvim-stripe-configs" },
    },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        ruby = { "pay-server-rubocop" },
      }

      -- Run lint (with debounce) when file is saved or changed
      require("stripe_configs.lint").create_lint_autocmds()
    end,
  }
