return  { -- Fuzzy finder for files
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        previewer = false,
      },
      -- This is required to support older version of fzf on remote devboxes
      fzf_opts = { ["--border"] = false },
      -- These settings reduce lag from slow git operations
      defaults = {
        git_icons = false,
      },
      git = {
        files = {
          previewer = false,
        },
      },
    },
    keys = {
      { "<leader>ff", "<CMD>lua require('fzf-lua').files()<CR>", desc = "[F]ind [F]iles" },
    },
  }
