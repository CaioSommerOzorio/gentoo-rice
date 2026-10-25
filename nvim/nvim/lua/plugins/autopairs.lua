return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    npairs.setup({
      -- Your basic configuration options here
    })

    -- Add your custom LaTeX dollar sign rule
    npairs.add_rule(Rule("$", "$", "tex"))
  end,
}
