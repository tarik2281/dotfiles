return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		local theme = require("lualine.themes.auto")

		-- make background transparent
		theme.inactive.c.bg = nil
		theme.normal.c.bg = nil

		lualine.setup({
			options = {
				globalstatus = true,
				theme = theme,
			},
		})
	end,
}
