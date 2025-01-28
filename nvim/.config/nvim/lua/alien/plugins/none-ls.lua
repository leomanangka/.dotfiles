return {
  "nvimtools/none-ls.nvim",
  name = "none-ls",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- SETUP FORMATTER HERE(IMPORTANT)
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier,
      },
    })
  end,
}
