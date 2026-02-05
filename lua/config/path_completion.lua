local cmp = require("cmp")

cmp.setup.filetype({ "lua", "python", "markdown", "sh", "zsh", "bash", "gitcommit" }, {
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lsp" },
	}),
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "git" },
	}),
})
