vim.opt.number = true -- line numbers
-- vim.opt.relativenumber = true -- relative line numbers

-- more efficient way to sync clipboard with os clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
