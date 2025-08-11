vim.g.mapleader = " " -- leader key
vim.g.maplocalleader = " " -- leader (idk diff from above but this looks standard)

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true }) -- ensure leader key will not have side effects when in NORMAL and VISUAL mode

local opts = { noremap = true, silent = true } -- helpful default setting

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear highlights on search
