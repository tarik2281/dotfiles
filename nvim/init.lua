vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.ruler = false
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.wo.signcolumn = 'yes'

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
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
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
                ensure_installed = { 
                    "bash",
                    "css",
                    "csv",
                    "dockerfile",
                    "go",
                    "gomod",
                    "gosum",
                    "gowork",
                    "graphql",
                    "groovy",
                    "html",
                    "java",
                    "javascript",
                    "json",
                    "lua",
                    "proto",
                    "python",
                    "scss",
                    "sql",
                    "toml",
                    "typescript",
                    "vim",
                    "xml",
                    "yaml",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    { 
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
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
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                opts = {},
            },
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
        "akinsho/bufferline.nvim",
        enabled = true,
        version = "*",
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
    disable_netrw = true,
    view = {
        width = function()
            return math.floor(vim.opt.columns:get() * 0.5)
        end,
        relativenumber = true,
        float = {
            enable = true,
            open_win_config = function()
                local WIDTH_RATIO = 0.5
                local HEIGHT_RATIO = 0.8

                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
                return {
                    border = "none",
                    relative = "editor",
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
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

-- require("bufferline").setup({})

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


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- indent-blankline
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- require("ibl").setup { indent = { highlight = highlight } }

-- Keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find recently opened files" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})

vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})

-- vim.keymap.set("i", "<C-h>", "<Esc><C-w>h", {})
-- vim.keymap.set("i", "<C-l>", "<Esc><C-w>l", {})
-- vim.keymap.set("i", "<C-j>", "<Esc><C-w>j", {})
-- vim.keymap.set("i", "<C-k>", "<Esc><C-w>k", {})

vim.keymap.set("i", "<C-b>", "<Esc>^i", { desc = "Beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle NvimTree" })
