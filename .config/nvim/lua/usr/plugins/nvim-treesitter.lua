return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"css",
				"csv",
				"dockerfile",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"graphql",
				"groovy",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"proto",
				"python",
				"scss",
				"sql",
				"toml",
				"typescript",
				"vim",
				"xml",
				"yaml",
				"zig",
			},
			modules = {},
			ignore_install = {},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
