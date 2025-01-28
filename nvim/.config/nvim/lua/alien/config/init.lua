require("alien.config.keymaps")

local opt = vim.opt

-- mouse and cursor
opt.guicursor = "" -- fat cursor
opt.mouse = ""     -- disable mouse

-- line number
opt.nu = true
opt.relativenumber = true

-- indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- search
opt.hlsearch = false
opt.incsearch = true

-- backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- window
opt.splitright = true
opt.splitbelow = true
-- misc
opt.wrap = false
opt.termguicolors = true
opt.scrolloff = 8
opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
--opt.cmdheight = 2
