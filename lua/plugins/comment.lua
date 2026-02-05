return {
	{
		"numToStr/Comment.nvim",
		dependencies = {
			-- Optional: for JSX, Vue, etc.
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = function(ctx)
					-- Optional: For treesitter-commentstring integration
					local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
					return ts_context_commentstring.create_pre_hook()(ctx)
				end,
			})
		end,
		lazy = false,
	},
}
