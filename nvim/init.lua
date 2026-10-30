-- basic settings
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- remember cursor
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- enable universal clipboard
vim.o.clipboard = 'unnamedplus'

require("lazy").setup({
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
        require("mini.pairs").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "lua",
      "python",
      "vim",
      "vimdoc",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)
      if lang then
        pcall(vim.treesitter.start, args.buf, lang)
      end
      end,
    })
    end,
  },
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    "kylechui/nvim-surround",
    version = "^4.0.0", 
    event = "VeryLazy",
     config = function()
       require("nvim-surround").setup({})
     end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  }
})

-- telescope keybinds
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- colorscheme
vim.cmd.colorscheme("gentoo")

-- show trailing whitespaces
vim.opt.list = true
vim.opt.listchars = {
  trail = '-', 
}
