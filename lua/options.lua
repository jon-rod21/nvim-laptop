vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " "}

vim.opt.number = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.showmode = false

vim.opt.mouse = ""


-- keybinds
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.keymap.set('n', 'er', function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next error"})

--vim.keymap.set('n', 'err', function()
--	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
--end, { desc = "Previous error"})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover docs"})

vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature help" })
