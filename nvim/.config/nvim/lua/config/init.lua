require("config.keymaps")
require("config.lsp")
require("config.lazy")

local opt = vim.opt
local global = vim.g

opt.fileencoding = "utf-8"

-- disable netrw
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

-- mouse and cursor
opt.guicursor = "" -- fat cursor
opt.mouse = ""     -- disable mouse

-- search
opt.incsearch = true
opt.hlsearch = true

-- line number
opt.nu = true
opt.relativenumber = true

-- window
opt.splitright = true
opt.splitbelow = true

-- indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- misc
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 8
opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
opt.cmdheight = 1

-- lsp
opt.winborder = "single"
opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
opt.shortmess:append("c")
