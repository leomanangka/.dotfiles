local function keymap(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {
    noremap = true, silent = true, nowait = true, desc = desc
  })
end

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- navigate window
keymap("n", "<C-l>", "<C-w>l", "Move to right window")
keymap("n", "<C-k>", "<C-w>k", "Move to above window")
keymap("n", "<C-j>", "<C-w>j", "Move to below window")
keymap("n", "<C-h>", "<C-w>h", "Move to left window")

-- navigate buffer
keymap("n", "L", ":bnext<cr>", "Go to next buffer")
keymap("n", "H", ":bprevious<cr>", "Go to previous buffer")
keymap("n", "W", ":bwipeout<cr>", "Exit buffer")

-- stay in indent mode
keymap("v", "<", "<gv", "Indent left and keep selection")
keymap("v", ">", ">gv", "Indent right and keep selection")

-- move text or block
keymap("v", "J", ":m '>+1<cr>gv=gv", "Move selected block down")
keymap("v", "K", ":m '<-2<cr>gv=gv", "Move selected block up")
keymap("n", "<A-j>", ":m .+1<cr>==", "Moce line down")
keymap("n", "<A-k>", ":m .-2<cr>==", "Moce line up")

-- misc
keymap("v", "p", '"_dP', "Paste without losing register")
keymap("n", "<leader>q", "<cmd>wqall!<cr>", "Save all & quit")
keymap("n", "<leader>w", "<cmd>w!<cr>", "Save file")

-- lsp auto-completion
-- lsp tab-completion
local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    -- navigate to the next item in completion menu
    return "<Down>"
  end

  local c = vim.fn.col(".") - 1
  local is_whitespace = c == 0 or vim.fn.getline("."):sub(c, c):match("%s")
  if is_whitespace then
    -- insert tan
    return "<Tab>"
  end

  local lsp_completion = vim.bo.omnifunc == "v:lua.vim.lsp.omnifunc"
  if lsp_completion then
    -- trigger lsp code completion
    return "<C-x><C-o>"
  end

  -- suggest word in current buffer
  return "<C-x><C-n>"
end

local function tab_prev()
  if vim.fn.pumvisible() == 1 then
    -- navigate to previous item in completion menu
    return "<Up>"
  end
  -- insert tab
  return "<Tab>"
end

vim.keymap.set("i", "<Tab>", tab_complete,
  { expr = true, desc = "Open auto-completion and select next item in completion menu" })
vim.keymap.set("i", "<S-Tab>", tab_prev, { expr = true, desc = "Select previous item in completion menu" })

-- trigger lsp completion manually using ctrl + space
keymap("i", "<C-space>", "<cmd>lua vim.lsp.completion.get()<cr>", "Trigger LSP completion ")

-- lsp diagnostic
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>",
  "Go to next diagnostic")
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
  "Go to previous diagnostic")
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>",
  "Open floating window show diagnostics in the line under the cursor")
keymap("n", "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<cr>",
  "Fill location list with diagnostics")

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local bufmap = function(mode, rhs, lhs, desc)
      vim.keymap.set(mode, rhs, lhs, { noremap = true, silent = true, nowait = true, buffer = event.buf, desc = desc })
    end
    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>",
      "Display the available documentation for the symbol under the cursor")
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "LSP go to definition")
    bufmap("n", "gtd", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "LSP type definition")
    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "LSP go to declaration")
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",
      "Lists all the implementations for the symbol under the cursor")
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", "Lists all the references of the symbol under the cursor")
    bufmap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "Lists all symbols in the current buffer")
    bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>",
      "Renames all references of the symbol under the cursor")
    bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>",
      "Shows a list of code actions available in the line under the cursor")
    bufmap("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP signature help")
  end
})

-- lazy
keymap("n", "<leader>p", "<cmd>Lazy<cr>", "Open Lazy plugin manager")
keymap("n", "<leader>pu", "<cmd>Lazy update<cr>", "Update plugins")
keymap("n", "<leader>ps", "<cmd>Lazy sync<cr>", "Sync plugins")

-- undotree
keymap("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", "Open undotree")

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "Telescope find files in current directory")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", "Telescope open live grep")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "Telescope open list of active buffers")
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", "Telescope open list of old files")
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "Telescope open list of LSP document symbols")
keymap("n", "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Telescope open list of LSP dynamic workspace symbols")

keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", "Telescope open list of help tags")
keymap("n", "<leader>fm", "<cmd>Telescope man_pages<cr>", "Telescope open list of manual pages")

keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", "Telescope open list of available commands")
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", "Telescope open list of keymaps")

keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", "Telescope open git status")
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", "Telescope open git branches")
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", "Telescope open git commits")

keymap("n", "<leader><leader>", function()
  require("config.telescope-config").project_files()
end, "Telescope open git files otherwise find files")
