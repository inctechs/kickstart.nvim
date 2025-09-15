return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'alfaix/neotest-gtest',
      'nvim-neotest/neotest-python',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require('neotest-gtest').setup {},
          require 'neotest-python' {
            dap = { justMyCode = false },
          },
        },
      }
      local nt = require 'neotest'
      vim.keymap.set('n', '<leader>tl', nt.run.run, { desc = 'Run [T]est ([L]ocal)' })
      vim.keymap.set('n', '<leader>ta', function()
        nt.run.run(vim.fn.expand '%')
      end, { desc = 'Run [T]ests ([a]ll in current file)' })
      vim.keymap.set('n', '<leader>tdl', function()
        nt.run.run { strategy = 'dap' }
      end, { desc = '[T]est [D]ebug [L]ocal' })
      vim.keymap.set('n', '<leader>tda', function()
        nt.run.run { vim.fn.expand '%', strategy = 'dap' }
      end, { desc = '[T]est [D]ebug [A]ll' })
      vim.keymap.set('n', '<leader>ts', nt.summary.open, { desc = 'Open [T]est [S]ummary' })
      vim.keymap.set('n', '<leader>to', nt.output.open, { desc = 'Open [T]est [O]output' })
    end,
  },
}
