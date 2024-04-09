return {
	"tpope/vim-sleuth",
	config = function()
		vim.cmd("let g:sleuth_java_heuristics = 0")
		vim.cmd("let g:sleuth_go_heuristics = 0")
		vim.cmd("let g:sleuth_lua_heuristics = 0")
	end,
}
