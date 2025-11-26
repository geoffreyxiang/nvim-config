return { -- Fancier statusline
    "nvim-lualine/lualine.nvim",
    dependencies = {
      { url = "git@git.corp.stripe.com:stevearc/pay-status.nvim.git" }, -- Statusline integration for pay up:status
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        section_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { {
          "filename",
          file_status = true,
          path = 1,
        } },
        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
          },
        },
        lualine_x = {
          "pay_status",
          "filetype",
        },
      },
      extensions = { "aerial", "nvim-tree", "fugitive", "fzf", "toggleterm", "quickfix", "overseer" },
    },
  }
