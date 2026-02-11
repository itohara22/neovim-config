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
    },
    {
      "oskarnurm/koda.nvim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000,
  }
})

require('mini.pairs').setup()

require("oil").setup()
vim.keymap.set("n", "<Space>e", "<cmd>Oil<CR>", {
    desc = "Open Oil file explorer",
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

