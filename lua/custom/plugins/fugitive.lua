-- vim-fugitive is a Vimscript plugin; it has no Lua setup() function.
-- Just add it and set your keymaps directly.
vim.pack.add { 'https://github.com/tpope/vim-fugitive' }
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', 'cvn', '<cmd>Git commit --no-verify<CR>')
