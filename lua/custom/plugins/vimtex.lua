-- VimTeX is a Vimscript plugin; configuration goes through vim.g globals,
-- which must be set BEFORE the plugin loads. vim.pack.add loads synchronously,
-- so set globals first, then add.
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-shell-escape',
    '-synctex=1',
    '-interaction=nonstopmode',
    '-file-line-error',
  },
  env = { TEXINPUTS = './/:' },
}

vim.pack.add { 'https://github.com/lervag/vimtex' }
