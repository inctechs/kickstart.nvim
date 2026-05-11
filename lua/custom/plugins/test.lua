-- plenary.nvim and nvim-treesitter are already installed by kickstart.
-- nvim-dap is installed by kickstart's debug plugin.
vim.pack.add {
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/antoinemadec/FixCursorHold.nvim',
  'https://github.com/alfaix/neotest-gtest',
  'https://github.com/nvim-neotest/neotest-python',
  'https://github.com/nvim-neotest/neotest',
}

vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    require('neotest').setup {
      adapters = {
        require('neotest-gtest').setup {},
        require 'neotest-python' { dap = { justMyCode = false } },
      },
    }

    local nt = require 'neotest'
    vim.keymap.set('n', '<leader>tl',  nt.run.run, { desc = 'Run [T]est ([L]ocal)' })
    vim.keymap.set('n', '<leader>ta',  function() nt.run.run(vim.fn.expand '%') end, { desc = 'Run [T]ests ([A]ll in file)' })
    vim.keymap.set('n', '<leader>tdl', function() nt.run.run { strategy = 'dap' } end, { desc = '[T]est [D]ebug [L]ocal' })
    vim.keymap.set('n', '<leader>tda', function() nt.run.run { vim.fn.expand '%', strategy = 'dap' } end, { desc = '[T]est [D]ebug [A]ll' })
    vim.keymap.set('n', '<leader>ts',  nt.summary.open, { desc = 'Open [T]est [S]ummary' })
    vim.keymap.set('n', '<leader>to',  nt.output.open,  { desc = 'Open [T]est [O]utput' })
  end,
})
