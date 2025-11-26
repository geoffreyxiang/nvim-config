return  { -- A collection of useful utilities
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {},
      input = {},
      notifier = {
        top_down = false,
        margin = { top = 1, right = 1, bottom = 1 },
      },
      picker = {
        ui_select = true,
        main = {
          file = false,
        },
      },
    },
    keys = {
      { "<leader>:", "<CMD>lua Snacks.picker.command_history()<CR>", desc = "Command History" },
      { "<leader>fb", "<CMD>lua Snacks.picker.buffers()<CR>", desc = "[F]ind [B]uffer" },
      { "<leader>fh", "<CMD>lua Snacks.picker.help()<CR>", desc = "[F]ind in [H]elp" },
      { "<leader>fd", "<CMD>lua Snacks.picker.diagnostics()<CR>", desc = "[F]ind [D]iagnostics" },
      { "<leader>fr", "<CMD>lua Snacks.picker.recent()<CR>", desc = "[F]ind [R]ecent files" },
      { "<leader>fc", "<CMD>lua Snacks.picker.commands()<CR>", desc = "[F]ind [C]ommand" },
      { "<leader>fk", "<CMD>lua Snacks.picker.keymaps()<CR>", desc = "[F]ind [K]eymap" },
      { "<leader>fg", "<CMD>lua Snacks.picker.livegrep()<CR>", desc = "[F]ind by live[G]rep" },
      { "<leader>/", "<CMD>lua Snacks.picker.lines()<CR>", desc = "[/] Fuzzily search in current buffer" },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
      -- Preload this to prevent loops when lazy loading it later
      require("snacks.notifier")
    end,
  }
