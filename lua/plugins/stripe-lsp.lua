return   { -- LSP
    "neovim/nvim-lspconfig",
    dependencies = {
      { url = "git@git.corp.stripe.com:stevearc/nvim-stripe-configs" },
    },
    config = function()
      local lsp_group = vim.api.nvim_create_augroup("KickstartLSP", {})
      --  This gets run when a LSP client connects to a particular buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Set custom keymaps and create autocmds",
        pattern = "*",
        group = lsp_group,
        callback = function(args)
          -- helper function for setting up buffer-local keymaps
          local nmap = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
          end

          nmap("gd", Snacks.picker.lsp_definitions, "[G]oto [D]efinition")
          nmap("gi", Snacks.picker.lsp_implementations, "[G]oto [I]mplementation")
          nmap("grr", Snacks.picker.lsp_references, "[G]oto [R]eferences")
          nmap("gD", Snacks.picker.lsp_declarations, "[G]oto [D]eclaration")
          nmap("gy", Snacks.picker.lsp_type_definitions, "T[y]pe definition")
        end,
      })

      -- Enable the following language servers
      vim.lsp.enable({
        "eslint",
        "ruff",
        "stripe_autogen",
        "stripe_checkmate",
        "stripe_gopls",
        "stripe_scip",
        "stripe_sorbet",
        "stripe_starpls",
        "stripe_typescript_native",
      })

      require("stripe_configs.javascript").auto_build_js_cli()
      require("stripe_configs.snacks").use_notifier_for_lsp_progress()
    end,
  }
