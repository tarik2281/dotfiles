return {
    "xiyaowong/transparent.nvim",
    config = function()
        local transparent = require("transparent")

        transparent.setup({
            extra_groups = {
                "NvimTreeNormal",
            },
        })
    end,
}
