vim.opt.number = true -- line numbers
-- vim.opt.relativenumber = true -- relative line numbers

-- more efficient way to sync clipboard with os clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true -- when lines wrap around, it'll be more obvious
vim.opt.undofile = true -- saves undo history to a file
vim.opt.ignorecase = true -- ignores case if all lowercase search
vim.opt.smartcase = true -- if a capital letter is used, search case-sensitive
vim.opt.signcolumn = "yes" -- shows an extra column on left side with useful info (like git diff)
vim.opt.updatetime = 250 -- "decrease update time" (idk what this does)
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in ms)
vim.opt.backup = false -- no backup file
vim.opt.writebackup = false -- no backup
vim.opt.completeopt = "menuone,noselect" -- flags for autocompletion settings
vim.opt.termguicolors = true -- "enables highlight groups" (idk what that means)
-- vim.opt.whichwrap -- lets you configure which keys that should go horizontally can wrap up/down (don't want this for now)
vim.opt.wrap = false -- no wrap for overflow
vim.opt.linebreak = true -- wrap doesn't split words
vim.opt.list = true -- how neovim will display whitespace characters (:help 'list' or :help 'listchars')
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- above
vim.opt.inccommand = "split" -- "preview substitutions live" (idk what that means)
vim.opt.cursorline = true -- highlight cursor line
vim.opt.scrolloff = 4 -- min number of screen lines to keep above/below cursor
vim.opt.sidescrolloff = 8 -- min number of columns to keep on either side of cursor when wrap == false
vim.opt.numberwidth = 4 --number column width (default == 4)
vim.opt.shiftwidth = 4 -- number of spaces per `tab`
vim.opt.tabstop = 4 -- number of spaces shown per \t
vim.opt.softtabstop = 4 -- "number of spaces a tab counts for when performing editing operations" (idk wtf)
vim.opt.expandtab = false -- do not convert tabs to spaces
vim.opt.splitbelow = true -- new hoizontal splits go below
vim.opt.splitright = true -- new vertical splits go right
vim.opt.swapfile = false -- do not create a swapfile (ts is annoying)
vim.opt.smartindent = true -- "make indenting smarter again" (idk these aren't my words)
vim.opt.showmode = true -- show mode (i.e. INSERT)
vim.opt.showtabline = 2 -- always show all tabs on top
vim.opt.backspace = "indent,eol,start" -- lets backspace delete these things in INSERT mode (i thought it alr did this but idk)
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.conceallevel = 0 -- 'so that `` is visible in markdown files (idk but sounds useful)
vim.opt.fileencoding = "utf-8" -- encoding written to a file
vim.opt.cmdheight = 1 -- height for command messages within nvim
vim.opt.autoindent = true -- copy indent from previous line
vim.opt.shortmess:append("c") -- something to do with autocompletion (idk)
vim.opt.iskeyword:append("-") -- allows for '-' to be searched for
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- cleaner experience writing comments (idk but no auto-comment on next line and more)
