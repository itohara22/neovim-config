local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ai", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = { only = { "source.addMissingImports.ts" } },
      })
    end)
end

vim.lsp.config("vtsls", {
  cmd = { "vtsls", "--stdio" },
  on_attach = on_attach,
})

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
    "vtsls",
    "clangd",
    "gopls"
})
