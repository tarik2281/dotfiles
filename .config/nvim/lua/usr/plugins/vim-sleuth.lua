return {
	"tpope/vim-sleuth",
	enabled = false,
	config = function()
		vim.cmd("let g:sleuth_java_heuristics = 0")
	end,
}
