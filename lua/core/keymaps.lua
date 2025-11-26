vim.g.mapleader = " " -- leader key
vim.g.maplocalleader = " " -- leader (idk diff from above but this looks standard)

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true }) -- ensure leader key will not have side effects when in NORMAL and VISUAL mode

local opts = { noremap = true, silent = true } -- helpful default setting

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear highlights on search when pressing <Esc> in normal mode

vim.keymap.set("n", "<leader>S", "<cmd> w <CR>", opts) -- save file (should remap to lowercase s when I change folke which-key plugin)

-- vim.keymap.set('n', '<leader>Sn', '<cmd>noautocmd w <CR>', opts) -- save file without autoreformatting

vim.keymap.set("n", "<leader>q", "<cmd> q <CR>", opts) -- quit file (maybe remap to <C-q> if accidentally quitting too often)

vim.keymap.set("n", "x", '"_x', opts) -- delete single character without copying into register

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts) -- next buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts) -- previous buffer
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

vim.keymap.set("n", "<leader>+", "<C-a>", opts) -- increment number
vim.keymap.set("n", "<leader>-", "<C-x>", opts) -- decrement number

vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts) -- toggle line wrapping

-- toggle diagnostics (i.e. error messages)
local diagnostics_active = true

vim.keymap.set("n", "<leader>Do", function()
	diagnostics_active = not diagnostics_active

	if diagnostics_active then
		vim.diagnostic.enable(true)
	else
		vim.diagnostic.enable(false)
	end
end, { desc = "Toggle diagnostics" })

-- diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>Dq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
