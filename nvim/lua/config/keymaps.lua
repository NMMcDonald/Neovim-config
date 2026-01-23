vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true, silent = true })
vim.keymap.set({ 'x', 'n' }, 'y', '"+y', { silent = true } )
