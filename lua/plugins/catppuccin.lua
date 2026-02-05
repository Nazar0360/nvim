return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		prioity = 1000,
		lazy = false,
		config = function()
			--require("catppuccin").setup()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
