return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "goimports" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				java = { "palantir-java-format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters = {
				["palantir-java-format"] = {
					command = vim.fn.stdpath("config") .. "/palantir-java-format/bin/palantir-java-format",
					env = {
						JAVA_OPTS = [[
                            --add-opens=java.base/java.lang=ALL-UNNAMED
                            --add-opens=java.base/java.util=ALL-UNNAMED
                            --add-exports=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED
                            --add-exports=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED
                            --add-exports=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED
                            --add-exports=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED
                            --add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED
                        ]],
					},
					args = {
						"--palantir",
						"-",
					},
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
