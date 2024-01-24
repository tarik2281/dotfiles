return {
	"sindrets/diffview.nvim",
	config = function()
		local diffview = require("diffview")

		diffview.setup({
			hooks = {
				diff_buf_win_enter = function(bufnr)
					vim.opt_local.foldlevel = 1
				end,
			},
		})
	end,
}
