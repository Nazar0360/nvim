return {
	"lambdalisue/vim-suda",
	lazy = false,
	event = { "BufReadPre", "BufWritePre" },
	init = function()
		vim.g.suda_smart_edit = 1
	end,
}
