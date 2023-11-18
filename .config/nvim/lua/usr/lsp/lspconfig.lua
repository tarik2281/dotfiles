return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/neodev.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local neodev = require("neodev")

		neodev.setup({})

		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = require("usr.core.lspkeymaps").on_attach

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["gradle_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- lspconfig["groovyls"].setup({
		-- 	cmd = { "groovy-language-server" },
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		-- lspconfig["helm_ls"].setup({
		-- 	filetypes = { "helm" },
		-- 	cmd = { "helm_ls", "serve" },
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				yaml = {
					schemas = {
						kubernetes = "*.yaml",
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
						["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
						["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
						["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
						["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
						["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
						["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
						["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
					},
				},
			},
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		-- lspconfig["tailwindcss"].setup({
		--   capabilities = capabilities,
		--   on_attach = on_attach,
		-- })

		-- configure svelte server
		-- lspconfig["svelte"].setup({
		--   capabilities = capabilities,
		--   on_attach = function(client, bufnr)
		--     on_attach(client, bufnr)
		--
		--     vim.api.nvim_create_autocmd("BufWritePost", {
		--       pattern = { "*.js", "*.ts" },
		--       callback = function(ctx)
		--         if client.name == "svelte" then
		--           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
		--         end
		--       end,
		--     })
		--   end,
		-- })

		-- configure graphql language server
		-- lspconfig["graphql"].setup({
		--     capabilities = capabilities,
		--     on_attach = on_attach,
		--     filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		-- })

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
