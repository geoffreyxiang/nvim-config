return { -- useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>C", group = "[C]ode" },
			{ "<leader>D", group = "[D]ocument" },
			{ "<leader>R", group = "[R]ename" },
			{ "<leader>S", group = "[S]earch" },
			{ "<leader>W", group = "[W]orkspace" },
			{ "<leader>T", group = "[T]oggle" },
			{ "<leader>H", group = "Git [H]unk", mode = { "n", "v" } },
		})
	end,
}
