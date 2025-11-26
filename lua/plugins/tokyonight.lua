return  { -- Theme ported from VS Code
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme({ args = { "tokyonight" } })
	end,
}
