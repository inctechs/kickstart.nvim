-- CopilotChat requires a build step (make tiktoken).
-- Add the following block to the PackChanged autocmd in Section 2 of your
-- root init.lua:
--
--   if name == 'CopilotChat.nvim' and vim.fn.executable 'make' == 1 then
--     run_build(name, { 'make', 'tiktoken' }, ev.data.path)
--     return
--   end
--
-- plenary.nvim, telescope.nvim, and telescope-ui-select.nvim are already
-- installed by kickstart (Section 4), so no need to re-add them here.
-- copilot.vim is installed by copilot.lua (loaded first alphabetically).
vim.pack.add { 'https://github.com/CopilotC-Nvim/CopilotChat.nvim' }

local chat = require 'CopilotChat'

require('telescope').load_extension 'ui-select'

chat.setup {
  model = 'gpt-4o',
  auto_insert_mode = false,
  mappings = {
    close = {
      normal = 'q',
      insert = '', -- Disable <C-c> closing the window
    },
  },
}

vim.keymap.set('n', '<leader>cc', function() chat.toggle() end,         { desc = 'CopilotChat - Toggle' })
vim.keymap.set('n', '<leader>ca', function() chat.select_prompt() end,  { desc = 'CopilotChat - Prompt Actions' })
