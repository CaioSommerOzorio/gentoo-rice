-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd.colorscheme("monochrome")

-- Recognize assembly files
vim.filetype.add({ extension = { asm = "nasm" } })

-- VimTeX config
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_compiler_method = "latexmk"

-- Telescope configs
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Surround
vim.keymap.set("v", "[", "c[]<Esc>hp", { noremap = true, silent = true })
vim.keymap.set("v", "{", "c{}<Esc>hp", { noremap = true, silent = true })
vim.keymap.set("v", "(", "c()<Esc>hp", { noremap = true, silent = true })

-- New file
vim.keymap.set("n", "<leader>nf", ":e %h/", { desc = "New file in current directory" })

-- Buffer manipulation
-- Move buffers around
vim.keymap.set("n", "<C-S-h>", "[B", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-l>", "]B", { noremap = true, silent = true })
