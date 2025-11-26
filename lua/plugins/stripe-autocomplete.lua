return  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      cmdline = {
        -- This seems to mess up completeopt=noselect
        enabled = false,
      },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      -- Avoid downloading a binary for fuzzy matching
      fuzzy = { implementation = "lua" },
    },
    opts_extend = { "sources.default" },
  }
