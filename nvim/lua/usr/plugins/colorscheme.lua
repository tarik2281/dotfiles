return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			flavour = "mocha",
			no_italic = true,
			integrations = {
				-- for transparent background, looks better without integration
				nvimtree = false,
			},
		})

		vim.cmd.colorscheme("catppuccin")

		local colors = require("catppuccin.palettes").get_palette("mocha")

		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = colors.mantle })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = colors.mantle, fg = colors.mantle })
	end,
}
