vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.fillchars = { eob = " " }

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.showmode = false

vim.opt.termguicolors = true

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins Setup
require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "lua", "vim" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-web-devicons",
        },
    },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 30
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.5
                end
            end,
            open_mapping = [[<c-t>]],
            hide_numbers = true,
            direction = "horizontal",
            persist_size = false,
            shade_terminals = false,
        },
    },
    "folke/neodev.nvim",
})

require("neodev").setup({})

-- LSP Setup
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end
    },
})


---
-- Autocompletion config
---
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

require("nvim-tree").setup({
    view = {
        width = 40,
    },
})

-- Comment.nvim

require("Comment").setup()

require("lualine").setup({
    options = {
        globalstatus = true,
    },
})

require("toggleterm").setup({
    -- size = function(term)
    --     if term.direction == "horizontal" then
    --         return 30
    --     elseif term.direction == "vertical" then
    --         return vim.o.columns * 0.5
    --     end
    -- end,
    -- open_mapping = [[<c-0>]],
    -- shade_terminals = false,
})

require("transparent").setup({
    extra_groups = {
        "NvimTreeNormal",
    },
})

-- Catppuccin Theme
require("catppuccin").setup({
    flavour = "mocha",
    no_italic = true,
})

vim.cmd.colorscheme "catppuccin"
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

local builtin = require("telescope.builtin")
local toggleterm = require("toggleterm")

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- vim.keymap.set("n", "<A-i>", function() toggleterm.toggle(1, nil, nil, "float", nil) end, {})
-- vim.keymap.set("t", "<A-i>", function() toggleterm.toggle(1, nil, nil, "float", nil) end, {})
--
-- vim.keymap.set("n", "<A-v>", function() toggleterm.toggle(2, nil, nil, "vertical", nil) end, {})
-- vim.keymap.set("t", "<A-v>", function() toggleterm.toggle(2, nil, nil, "vertical", nil) end, {})
--
-- vim.keymap.set("n", "<A-h>", function() toggleterm.toggle(3, nil, nil, "horizontal", nil) end, {})
-- vim.keymap.set("t", "<A-h>", function() toggleterm.toggle(3, nil, nil, "horizontal", nil) end, {})
--
-- vim.keymap.set("t", "<C-w>h", "<C-\\><C-n>", {})

-- Keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})

vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})

vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", {})
