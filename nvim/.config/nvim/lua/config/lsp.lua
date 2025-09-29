-- enable lsp client
vim.lsp.enable({
  "lua_ls",
  "clangd",
  "gopls",
  "hyprls",
  "pylsp",
  "bashls"
})

-- lsp diagnostic
vim.diagnostic.config({
  virtual_lines = {
    current_line = true
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    }
  }
})

-- format on save
local fmt_group = vim.api.nvim_create_augroup("autoformat_cmds", { clear = true })
local function setup_autoformat(event)
  local id = vim.tbl_get(event, "data", "client_id")
  local client = id and vim.lsp.get_client_by_id(id)
  if client == nil then
    return
  end

  vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = event.buff })

  local buf_format = function(e)
    vim.lsp.buf.format({
      bufnr = e.buf,
      timeout_ms = 10000,
    })
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = event.buf,
    group = fmt_group,
    desc = "Format current buffer",
    callback = buf_format,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Setup format on save",
  callback = setup_autoformat,
})

-- disable semantic highlights
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Disable LSP semantic highlights",
  callback = function(event)
    local id = vim.tbl_get(event, "data", "client_id")
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil then
      return
    end
    client.server_capabilities.semanticTokenProvider = nil
  end
})

-- extend auto-completion behavior
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Enable vim.lsp.completion",
  callback = function(event)
    local client_id = vim.tbl_get(event, "data", "client_id")
    if client_id == nil then
      return
    end
    vim.lsp.completion.enable(true, client_id, event.buf, { autotrigger = true })
  end
})

-- enable inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "",
  callback = function(event)
    local id = vim.tbl_get(event, "data", "client_id")
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil or not client.supports_method("textDocument/inlayHint") then
      return
    end
    vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
  end
})
