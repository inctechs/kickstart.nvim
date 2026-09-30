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

-- Completion engine + VimTeX source (pure Lua, no build step).
-- nvim-cmp only runs in tex buffers; blink.cmp (init.lua) handles everything else
-- and is switched off in tex buffers via `vim.b.completion`, so only one menu shows.
vim.pack.add { 'https://github.com/hrsh7th/nvim-cmp' }
vim.pack.add { 'https://github.com/micangl/cmp-vimtex' }
vim.pack.add { 'https://github.com/hrsh7th/cmp-buffer' } -- optional: words from open buffers

local cmp = require 'cmp'
cmp.setup {
  enabled = function() return vim.bo.filetype == 'tex' end,
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body) -- native snippets, no LuaSnip needed
    end,
  },
  sources = cmp.config.sources(
    { { name = 'vimtex' } }, -- citations, \ref/\Cref labels, \begin{ environments
    { { name = 'buffer' } } -- fallback only if vimtex returns nothing
  ),
  mapping = cmp.mapping.preset.insert {
    ['<C-Space>'] = cmp.mapping.complete(), -- force the menu open
    ['<CR>'] = cmp.mapping.confirm { select = true }, -- accept
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
  },
}

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Disable blink.cmp in tex buffers (nvim-cmp handles them)',
  group = vim.api.nvim_create_augroup('custom-vimtex-cmp', { clear = true }),
  pattern = 'tex',
  callback = function() vim.b.completion = false end,
})
