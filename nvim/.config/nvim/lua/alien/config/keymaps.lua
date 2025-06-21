local keymap = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
	nowait = true,
	buffer = nil,
}

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- navigate buffers
keymap("n", "L", ":bnext<CR>", opts)
keymap("n", "H", ":bprevious<CR>", opts)
keymap("n", "W", ":bwipeout<CR>", opts)

-- navigate window
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)

-- navigate terminal
--keymap("t", "<c-l>", "<cmd>wincmd l<cr>", opts)
--keymap("t", "<c-h>", "<cmd>wincmd h<cr>", opts)
--keymap("t", "<c-k>", "<cmd>wincmd k<cr>", opts)
--keymap("t", "<c-j>", "<cmd>wincmd j<cr>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text or block
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- explore
-- keymap("n", "<leader>e", vim.cmd.Ex)

keymap("v", "p", '"_dP', opts)
keymap("n", "<leader>q", "<cmd>wqall!<cr>", opts)
keymap("n", "<leader>w", "<cmd>w!<cr>", opts)

-- Lazy
keymap("n", "<leader>p", "<cmd>Lazy<cr>", opts)
keymap("n", "<leader>pu", "<cmd>Lazy update<cr>", opts)

-- Mason
keymap("n", "<leader>m", "<cmd>Mason<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)

keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fm", "<cmd>Telescope man_pages<cr>", opts)

keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)

keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)

-- LSP
keymap("n", "K", vim.lsp.buf.hover, {})
keymap("n", "gd", vim.lsp.buf.definition, {})
keymap("n", "gD", vim.lsp.buf.declaration, {})
keymap("n", "gi", vim.lsp.buf.implementation, {})
keymap("n", "gr", vim.lsp.buf.references, {})
keymap("n", "<C-i>", vim.lsp.buf.signature_help, {})

-- LSP diagnostic
keymap("n", "gl", vim.diagnostic.open_float)
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<leader>dq", vim.diagnostic.setloclist)

-- LSP code action
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- LSP formatter
keymap("n", "<leader>r", function()
	vim.lsp.buf.format({ async = true })
end, {})

-- Undotree
keymap("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", opts)

-- Neo-tree
keymap("n", "<leader>e", "<cmd>Neotree reveal float<cr>", opts)

-- Cellular automaton
keymap("n", "<leader>1", "<cmd>CellularAutomaton make_it_rain<cr>", {})
keymap("n", "<leader>2", "<cmd>CellularAutomaton scramble<cr>", {})
keymap("n", "<leader>3", "<cmd>CellularAutomaton game_of_life<cr>", {})

-- Gitsigns
keymap("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", opts)
keymap("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", opts)
keymap("n", "<leader>gl", "<cmd>Gitsigns blame_line<cr>", opts)
keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", opts)
keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", opts)
keymap("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", opts)
keymap("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", opts)
keymap("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", opts)
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", opts)

-- Replace Space more than 1 to TAB
keymap("n", "<leader>t", ":%s/^[ ]\\+/\t/g<CR>", opts)

-- Vivify
keymap("n", "<C-s>", "<cmd>Vivify<cr>", opts)
