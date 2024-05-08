-- fix bug where <C-l> was used by Netrw to refresh the page when nvim
-- is in file directory mode.
-- see this issue for the solution and reference:
-- https://github.com/christoomey/vim-tmux-navigator/issues/189
vim.keymap.set('n', '<c-l>', ':TmuxNavigateRight<CR>', {
  silent = true,
  buffer = true,
})
