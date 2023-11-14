return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 0,
			},
		})
	end,
}
