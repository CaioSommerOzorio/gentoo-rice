return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "@lsp.type.class", { link = "@type" })
          vim.api.nvim_set_hl(0, "@lsp.type.struct", { link = "@type" })
          vim.api.nvim_set_hl(0, "@lsp.type.enum", { link = "@type" })
          vim.api.nvim_set_hl(0, "@lsp.type.type", { link = "@type" })
        end,
      })
    end,
  },
}
