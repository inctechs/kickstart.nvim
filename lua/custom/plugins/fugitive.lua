return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    vim.keymap.set('n', 'cvn', ':Git commit --no-verify<CR>')
  end,
}
