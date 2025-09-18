return {
  "jiaoshijie/undotree",
  dependencies = { "nvim-lua/plenary.nvim" },
  ---@module 'undotree.collector'
  ---@type UndoTreeCollector.Opts
  opts = {
    position = "right"
  },
  name = "undotree",
  event = "VeryLazy",
}
