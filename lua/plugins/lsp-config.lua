vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR },
    warn = true,
    spacing = 2,
    source = "always",
  },
  signs = { severity = { min = vim.diagnostic.severity.WARN } },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  update_in_insert = false,
})

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "cssmodules_ls", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      servers = {
      "lua_ls",
      "ts_ls",
      "html",
      "cssls",
      "pyright",
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities, })
        vim.lsp.enable(server)
      end

      vim.lsp.config("cssmodules_ls", {
        on_attach = function(client, bufnr)
          client.server_capabilities.definitionProvider = false
          -- your on_attach logic here
        end,
        init_options = { camelCase = "dashes" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "css",
          "scss",
          "sass",
        },
      })
    end,
  },
}
