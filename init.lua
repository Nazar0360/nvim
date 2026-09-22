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
vim.opt.tabstop = 8 -- default
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.spelllang = { 'en_us', 'uk', 'sk' }
vim.opt.spell = true

vim.opt.langmap = "йцукенгшщзхїфівапролджєячсмитьбю;qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.,ЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>,ʼ~№#"

require("config.lazy")
require("config.keymaps")

