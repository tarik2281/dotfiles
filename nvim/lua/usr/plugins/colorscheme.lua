return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")

        catppuccin.setup({
            flavour = "mocha",
            no_italic = true,
            integrations = {
                -- for transparent background, looks better without integration
                nvimtree = false,
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
