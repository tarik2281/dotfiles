return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			delay = 0,
			under_cursor = true,
			modes_allowlist = { "n" },
			min_count_to_highlight = 2,
			filetypes_denylist = {
				"NvimTree",
			},
		})
	end,
}
