vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope git_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find recently opened files" })
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope filetypes<CR>", { desc = "Set filetype" })

vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", { desc = "Open diffview" })
vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { desc = "Open diffview for history" })
vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory %<CR>", { desc = "History for current file" })
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" })

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bp <bar>bd #<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle <CR>", { desc = "Toggle NvimTree" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })

vim.keymap.set("n", "H", "zH", { desc = "Half page left" })
vim.keymap.set("n", "L", "zL", { desc = "Half page right" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next occurrence" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous occurrence" })

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<C-p>", '"+p', { desc = "Paste from system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<C-P>", '"+P')

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank into system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank into system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank into system clipboard" })

-- vim.keymap.set("n", "<leader>d", '"_d')
-- vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>fx", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable" })
