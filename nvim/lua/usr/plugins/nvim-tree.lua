return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-web-devicons",
    },
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            disable_netrw = true,
            view = {
                relativenumber = true,
                width = function()
                    return math.floor(vim.opt.columns:get() * 0.2)
                end,
            },
        })
    end,
}
