vim.diagnostic.enable(true)

require("rose-pine").setup({
   variant = "dawn",
   styles = {
        bold = true,
        italic = false,
        transparency = true,
    },
})

require("koda").setup({
    transparent = true
})

vim.cmd("colorscheme koda")

-- Hover window
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#c4a7e7", bg = "#1a1a1a" })

-- Completion menu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "Pmenu",     { bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "PmenuSel",  { bg = "#2e2e2e" })
vim.api.nvim_set_hl(0, "PmenuThumb",{ bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1a1a1a" })





