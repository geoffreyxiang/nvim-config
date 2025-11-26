return {
	{ "wellle/targets.vim" },
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ -- Git commands in nvim
		"tpope/vim-fugitive",
		dependencies = "tpope/vim-rhubarb",
		init = function()
			vim.g.github_enterprise_urls = { "https://git.corp.stripe.com" }
		end,
	},
	{ -- Make copy/paste work over ssh
		"ojroques/nvim-osc52",
		-- Only change the clipboard if we're in a SSH session
		enabled = os.getenv("SSH_CLIENT") ~= nil,
		config = function()
			local osc52 = require("osc52")
			-- Use the '+' register, so copy to clipboard would be `"+yy`
			local function copy(lines, _)
				osc52.copy(table.concat(lines, "\n"))
			end

			local function paste()
				return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
			end

			vim.g.clipboard = {
				name = "osc52",
				copy = { ["+"] = copy, ["*"] = copy },
				paste = { ["+"] = paste, ["*"] = paste },
			}
		end,
	},
	{ -- Toggleable terminal windows
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = [[<c-\>]],
		},
	},
	{ -- Useful :StripeOwner command
		url = "git@git.corp.stripe.com:dbalatero/stripe-code-owner.nvim.git",
		cmd = "StripeOwner",
		config = function()
			vim.api.nvim_create_user_command("StripeOwner", require("stripe-code-owner").showOverlay, {})
		end,
	},
	{ -- Snippets
		"L3MON4D3/LuaSnip",
		dependencies = {
			{ "rafamadriz/friendly-snippets", lazy = false },
		},
		event = "InsertEnter *",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{ -- Dagger window
		url = "git@git.corp.stripe.com:stevearc/dagger.nvim.git",
		ft = "java",
		config = function()
			local dagger = require("dagger")
			dagger.setup()
			vim.keymap.set("n", "<leader>Gt", dagger.toggle, { desc = "Da[G]ger [T]oggle" })
			vim.keymap.set("n", "<leader>Go", dagger.open, { desc = "Da[G]ger [O]pen" })
			vim.keymap.set("n", "<leader>Gc", dagger.close, { desc = "Da[G]ger [C]lose" })
		end,
	},
	{ -- Bazel tasks and fzf integration
		url = "git@git.corp.stripe.com:stevearc/bazel.nvim.git",
		config = function()
			local bazel = require("bazel")
			bazel.setup()
			vim.api.nvim_create_user_command("BazelFocus", function(params)
				if params.bang then
					bazel.set_project(nil)
				else
					bazel.select_project()
				end
			end, { bang = true, desc = "Focus a bazel project, or use ! to clear the focused project." })
			vim.keymap.set("n", "<leader>fp", bazel.fzf_project_files, { desc = "[F]ind [P]roject files" })
		end,
	},
	{ -- Task runner
		"stevearc/overseer.nvim",
		opts = {
			templates = { "builtin", "bazel" },
			default_neotest = {
				{ "on_complete_notify", on_change = true },
				"default",
			},
		},
		config = function(_, opts)
			require("overseer").setup(opts)
			vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "[O]verseer [T]oggle" })
			vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "[O]verseer [R]un" })
			vim.keymap.set("n", "<leader>oq", "<cmd>OverseerQuickAction<CR>", { desc = "[O]verseer [Q]uick action" })
			vim.keymap.set("n", "<leader>oa", "<cmd>OverseerTaskAction<CR>", { desc = "[O]verseer task [A]ction" })
		end,
	},
}
