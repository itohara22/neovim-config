-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
------
vim.opt.statuscolumn = "%=%l   "
vim.opt.laststatus = 0
vim.opt.ignorecase = true
vim.cmd("colorscheme torte")
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
-- vim.g.netrw_browse_split = 3
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", {
    desc = "Save file",
})
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })
vim.keymap.set("n", "<leader>q", "<C-w>q", {
    desc = "Close current pane",
})

vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "stevearc/oil.nvim"
    }
})

-- telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- --------------

-- lsp config
local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

-- C / C++
vim.lsp.config("clangd", {
    cmd = { "clangd" },
    on_attach = on_attach,
})

-- Go
vim.lsp.config("gopls", {
    cmd = { "gopls" },
    on_attach = on_attach,
})

vim.lsp.enable({
    "clangd",
    "gopls",
})
vim.diagnostic.enable(false)

---oil.nvim config
require("oil").setup()
vim.keymap.set("n", "<Space>e", "<cmd>Oil<CR>", {
    desc = "Open Oil file explorer",
})

-- kill other buffers
vim.keymap.set("n", "<Space>bo", function()
    local current = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
            if not vim.api.nvim_buf_get_option(buf, "modified") then
                vim.api.nvim_buf_delete(buf, {})
            end
        end
    end
end, { desc = "Close other buffers" })
