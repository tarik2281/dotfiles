return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")
		local colors = require("catppuccin.palettes").get_palette("mocha")

		toggleterm.setup({
			direction = "float",
			highlights = {
				NormalFloat = {
					guibg = colors.mantle,
				},
				FloatBorder = {
					guibg = colors.mantle,
					guifg = colors.mantle,
				},
			},
			float_opts = {
				border = "single",
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal

		local shell = Terminal:new({
			hidden = true,
			on_open = function(term)
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<A-i>",
					"<cmd>close<CR>",
					{ noremap = true, silent = true }
				)
			end,
		})

		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,

			-- function to run on opening the terminal
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
			-- function to run on closing the terminal
			on_close = function(term)
				vim.cmd("startinsert!")
			end,
		})

		function _shell_toggle()
			shell:toggle()
		end

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.keymap.set(
			"n",
			"<A-i>",
			"<cmd>lua _shell_toggle()<CR>",
			{ desc = "Open shell", noremap = true, silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>g",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ desc = "Open lazygit", noremap = true, silent = true }
		)

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
		end

		vim.cmd("autocmd! TermOpen term:// lua set_terminal_keymaps()")
	end,
}
