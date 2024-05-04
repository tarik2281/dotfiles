return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        local nvimsurround = require("nvim-surround")

        nvimsurround.setup()
    end,
}
