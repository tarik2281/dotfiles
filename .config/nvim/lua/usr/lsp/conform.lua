return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				-- svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },

				json = { "prettierd" },
				yaml = { "yamlfmt" },

				lua = { "stylua" },
				go = { "goimports" },
				bash = { "shfmt" },
				sh = { "shfmt" },
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
