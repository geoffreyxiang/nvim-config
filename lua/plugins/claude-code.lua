return {
	"coder/claudecode.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/snacks.nvim",
	},
	config = function()
		require("claudecode").setup()
	end,
	keys = {
		{ "<leader>c", nil, desc = "AI/Claude Code" },
		{ "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "[C]laude toggle" },
		{ "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "[C]laude [F]ocus" },
		{ "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "[C]laude [R]esume" },
		{ "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "[C]laude [C]ontinue" },
		{ "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "[C]laude select [M]odel" },
		{ "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "[C]laude add [B]uffer" },
		{ "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "[C]laude [S]end" },
		{
			"<leader>cs",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "[C]laude add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
		},
		-- Diff management
		{ "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "[C]laude diff [A]ccept" },
		{ "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "[C]laude diff [D]eny" },
	},
	config = function()
		require("claudecode").setup()

		-- Set up global keymaps
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cc",
			"<cmd>ClaudeCode<cr>",
			{ noremap = true, silent = true, desc = "[C]laude toggle" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cf",
			"<cmd>ClaudeCodeFocus<cr>",
			{ noremap = true, silent = true, desc = "[C]laude [F]ocus" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cr",
			"<cmd>ClaudeCode --resume<cr>",
			{ noremap = true, silent = true, desc = "[C]laude [R]esume" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cC",
			"<cmd>ClaudeCode --continue<cr>",
			{ noremap = true, silent = true, desc = "[C]laude [C]ontinue" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cm",
			"<cmd>ClaudeCodeSelectModel<cr>",
			{ noremap = true, silent = true, desc = "[C]laude select [M]odel" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cb",
			"<cmd>ClaudeCodeAdd %<cr>",
			{ noremap = true, silent = true, desc = "[C]laude add [B]uffer" }
		)
		vim.api.nvim_set_keymap(
			"v",
			"<leader>cs",
			"<cmd>ClaudeCodeSend<cr>",
			{ noremap = true, silent = true, desc = "[C]laude [S]end" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ca",
			"<cmd>ClaudeCodeDiffAccept<cr>",
			{ noremap = true, silent = true, desc = "[C]laude diff [A]ccept" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cd",
			"<cmd>ClaudeCodeDiffDeny<cr>",
			{ noremap = true, silent = true, desc = "[C]laude diff [D]eny" }
		)
	end,
}
