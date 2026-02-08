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
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = "%s%=%l  "
vim.opt.laststatus = 0
vim.opt.ignorecase = true
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
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
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ai", function()
  vim.lsp.buf.code_action({
    apply = true,
    context = { only = { "source.addMissingImports.ts" } },
  })
end)

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
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    { 'nvim-mini/mini.pairs', version = '*' },
    -- {
    --    "shaunsingh/nord.nvim"
    -- }
    {
      "hrsh7th/nvim-cmp",
       dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    }
})

-- Intellisense snippets
local cmp = require("cmp")
cmp.setup({
  completion = {
    autocomplete = false,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  -- mapping = cmp.mapping.preset.insert({
  --   ["<C-Space>"] = cmp.mapping.complete(),
  --   ["<CR>"] = cmp.mapping.confirm({ select = true }),
  -- }),
  sources = {
    { name = "nvim_lsp" },
  },
})
vim.keymap.set("i", "<C-l>", function()
  require("cmp").complete()
end)

-- mini pairs
require('mini.pairs').setup()

-- telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
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

-- typescript
-- vim.lsp.config("tsserver", {
--     cmd = {"typescript-language-server", "--stdio"},
--     on_attach = on_attach,
-- })

vim.lsp.config("vtsls", {
  cmd = { "vtsls", "--stdio" },
  on_attach = on_attach,
})

vim.lsp.enable({
    -- "tsserver"
    "vtsls"
})

vim.diagnostic.enable(true)

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--   callback = function()
--     vim.diagnostic.enable(true, { bufnr = 0 })
--   end,
-- })

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

--colorschemes
require("rose-pine").setup({
   variant = "moon",
   styles = {
        bold = true,
        italic = false,
        transparency = true,
    },
})
 vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme nord")

-- vim.opt.termguicolors = true
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })


