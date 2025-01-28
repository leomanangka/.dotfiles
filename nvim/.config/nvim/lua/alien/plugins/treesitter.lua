return {
  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  priority = 1000,
  name = "treesitter",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "lua",
        "c",
        "cpp",
        "vim",
        "vimdoc",
      },
      sync_install = false,
      auto_install = true,
      --ignore_install = {},
      highlight = {
        enable = true,
        --disable = {},
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      indent = {
        enable = true,
      },
    })
  end
}
