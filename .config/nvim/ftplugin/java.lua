local jdtls = require("jdtls")
local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local lombok_jar = jdtls_dir .. "/lombok.jar"

local on_attach = require("usr.core.lspkeymaps").on_attach

local config = {
	cmd = { jdtls_dir .. "/jdtls", "--jvm-arg=-javaagent:" .. lombok_jar },
	root_dir = vim.fs.dirname(
		vim.fs.find({ "gradlew", ".git", "mvnw", "settings.gradle", "pom.xml" }, { upward = true })[1]
	),
	on_attach = on_attach,
	init_options = {
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			signatureHelp = {
				enabled = true,
			},
			contentProvider = {
				preferred = "fernflower",
			},
		},
	},
}

jdtls.start_or_attach(config)
