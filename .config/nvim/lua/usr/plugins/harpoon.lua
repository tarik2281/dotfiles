return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })

		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle harpoon quick menu" })

		vim.keymap.set("n", "<A-1>", function()
			ui.nav_file(1)
		end, { desc = "Navigate to harpoon file 1" })

		vim.keymap.set("n", "<A-2>", function()
			ui.nav_file(2)
		end, { desc = "Navigate to harpoon file 2" })

		vim.keymap.set("n", "<A-3>", function()
			ui.nav_file(3)
		end, { desc = "Navigate to harpoon file 3" })

		vim.keymap.set("n", "<A-4>", function()
			ui.nav_file(4)
		end, { desc = "Navigate to harpoon file 4" })

		-- vim.keymap.set("n", "<A-5>", function()
		-- 	ui.nav_file(5)
		-- end, { desc = "Navigate to harpoon file 5" })
		--
		-- vim.keymap.set("n", "<A-6>", function()
		-- 	ui.nav_file(6)
		-- end, { desc = "Navigate to harpoon file 6" })
		--
		-- vim.keymap.set("n", "<A-7>", function()
		-- 	ui.nav_file(7)
		-- end, { desc = "Navigate to harpoon file 7" })
		--
		-- vim.keymap.set("n", "<A-8>", function()
		-- 	ui.nav_file(8)
		-- end, { desc = "Navigate to harpoon file 8" })
		--
		-- vim.keymap.set("n", "<A-9>", function()
		-- 	ui.nav_file(9)
		-- end, { desc = "Navigate to harpoon file 9" })
		--
		-- vim.keymap.set("n", "<A-0>", function()
		-- 	ui.nav_file(10)
		-- end, { desc = "Navigate to harpoon file 10" })
	end,
}
