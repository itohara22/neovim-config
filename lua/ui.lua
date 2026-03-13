vim.diagnostic.enable(true)

require("gruvbox").setup({
    italic = {
    strings = false,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
})
--
-- require('kanagawa').setup({
--     -- transparent = true,
--      functionStyle = { bold = true },
-- })

require("black-metal").setup({
    alt_bg = true,
    code_style = {
        comments = "italic",
        conditionals = "bold",
        functions = "bold",
        keywords = "bold",
        headings = "bold", -- Markdown headings
        operators = "none",
        keyword_return = "none",
        strings = "none",
        variables = "none",
  },
})

-- vim.o.background = "light"
-- vim.cmd("colorscheme gorgoroth")
vim.cmd("colorscheme zenburn")

-- Background and text of hover window
vim.api.nvim_set_hl(0, "NormalFloat", {
  bg = "#1e222a",
  fg = "#abb2bf",
})

-- Border color
vim.api.nvim_set_hl(0, "FloatBorder", {
  bg = "#1e222a",
  fg = "#61afef",
})
