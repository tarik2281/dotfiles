return {
	"someone-stole-my-name/yaml-companion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("yaml_schema")

		local cfg = require("yaml-companion").setup({})

		require("lspconfig")["yamlls"].setup(cfg)
	end,
}
