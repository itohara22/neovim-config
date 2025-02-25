-- vim.opt.guicursor = "n-v-i-c:block-Cursor"

vim.opt.clipboard = "unnamedplus"

vim.opt.listchars = {
  tab = ". ",
  trail = " ",
  nbsp = "+",
}

vim.opt.shiftwidth = 8
vim.opt.tabstop = 8

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[
    hi Normal guibg=NONE ctermbg=NONE
    hi NormalNC guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi DiagnosticUnderlineError gui=NONE cterm=NONE guifg=#333333
    hi DiagnosticUnderlineWarn gui=NONE cterm=NONE guifg=#333333
    hi DiagnosticUnderlineInfo gui=NONE cterm=NONE guifg=#333333
    hi DiagnosticUnderlineHint gui=NONE cterm=NONE guifg=#333333
    hi LspReferenceText guibg=#222222 gui=NONE
    hi LspReferenceRead guibg=#222222 gui=NONE
    hi LspReferenceWrite guibg=#222222 gui=NONE
]])
