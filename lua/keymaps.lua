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
