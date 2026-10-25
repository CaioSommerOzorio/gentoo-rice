return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "build/", -- Trailing slash ensures it targets the build directory
        },
      },
    })

    -- Load the fzf native extension for faster fuzzy finding
    telescope.load_extension("fzf")
  end,
}
