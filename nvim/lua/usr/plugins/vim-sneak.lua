return {
	"justinmk/vim-sneak",
	version = "*",
	init = function()
		vim.cmd("let g:sneak#label = 1")
		vim.cmd("let g:sneak#use_uc_scs = 1")
	end,
}
