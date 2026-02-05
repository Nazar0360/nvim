vim.o.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
-- vim.opt.linebreak = true
-- vim.opt.breakindent = true
vim.opt.colorcolumn = { 100 }
vim.api.nvim_set_hl(0, "ColorColumn", {
  ctermbg = 235,
  bg   = "#242424",
})

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

require("config.lazy")
require("config.keymaps")

