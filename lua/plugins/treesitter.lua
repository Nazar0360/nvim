return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- Try the modern module name first
			local ok, configs = pcall(require, "nvim-treesitter.configs")
			if not ok then
				-- Fallback for older versions
				ok, configs = pcall(require, "nvim-treesitter.config")
			end
			if not ok then
				vim.notify("nvim-treesitter not found", vim.log.levels.ERROR)
				return
			end

			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"python",
					"cpp",
				},
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
