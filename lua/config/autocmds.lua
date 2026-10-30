vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function()
    vim.opt_local.spell = false
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.spell = false
    end,
})
