return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		local catppuccin = require("catppuccin.groups.integrations.bufferline")

		bufferline.setup({
			options = {
				-- separator_style = "slant",
				numbers = function(opts)
					return string.format("%s", opts.ordinal)
				end,
				offsets = {
					{
						filetype = "NvimTree",
						highlight = "Directory",
						separator = true,
						text_align = "left",
						text = function()
							return vim.fn.getcwd()
						end,
					},
				},
			},
			highlights = catppuccin.get(),
		})

		vim.keymap.set("n", "<A-1>", function()
			bufferline.go_to(1, true)
		end, { desc = "Go to buffer 1" })

		vim.keymap.set("n", "<A-2>", function()
			bufferline.go_to(2, true)
		end, { desc = "Go to buffer 2" })

		vim.keymap.set("n", "<A-3>", function()
			bufferline.go_to(3, true)
		end, { desc = "Go to buffer 3" })

		vim.keymap.set("n", "<A-4>", function()
			bufferline.go_to(4, true)
		end, { desc = "Go to buffer 4" })

		vim.keymap.set("n", "<A-5>", function()
			bufferline.go_to(5, true)
		end, { desc = "Go to buffer 5" })

		vim.keymap.set("n", "<A-6>", function()
			bufferline.go_to(6, true)
		end, { desc = "Go to buffer 6" })

		vim.keymap.set("n", "<A-7>", function()
			bufferline.go_to(7, true)
		end, { desc = "Go to buffer 7" })

		vim.keymap.set("n", "<A-8>", function()
			bufferline.go_to(8, true)
		end, { desc = "Go to buffer 8" })

		vim.keymap.set("n", "<A-9>", function()
			bufferline.go_to(9, true)
		end, { desc = "Go to buffer 9" })

		vim.keymap.set("n", "<leader>bt", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin for current buffer" })
	end,
}