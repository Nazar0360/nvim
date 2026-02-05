return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        --null_ls.builtins.diagnostics.eslint_d,
        require("none-ls.diagnostics.eslint_d"),
        --null_ls.builtins.completion.spell,
      },
    })
  end,
}

--[[
return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "prettier",
        "black",
        "isort",
        "eslint_d",
      },
      automatic_installation = true,
      automatic_setup = true,
    })
    require("null-ls").setup({})
  end,
}
]]

