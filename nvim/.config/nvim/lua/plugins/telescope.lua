return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = (build_cmd ~= "cmake") and "make"
          or
          "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      enabled = build_cmd ~= "make",
      config = function()
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        local ok, _ = pcall(require("telescope").load_extension, "fzf")
        if not ok then
          vim.notify("Failed to load telescope-fzf-native.nvim extension", vim.log.levels.ERROR)
        end
      end
    }
  },
  name = "telescope",
  lazy = true,
  cmd = "Telescope",
  config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        prompt_prefix = "󰭎 ",
        selection_caret = " ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-w>"] = actions.delete_buffer + actions.move_to_top
          },
        }
      }
    })
  end
}
