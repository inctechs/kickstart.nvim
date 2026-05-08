return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- The official plugin (provides the Auth token)
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- Networking
      { 'nvim-telescope/telescope.nvim' }, -- For the picker
      { 'nvim-telescope/telescope-ui-select.nvim' }, -- For the picker UI
    },
    build = 'make tiktoken', -- Only if you have make/cargo installed
    opts = {
      model = 'gpt-4o',
      auto_insert_mode = false,

      -- KEYMAP CHANGE HERE
      mappings = {
        close = {
          normal = 'q',
          insert = '', -- Set to empty string to disable <C-c> closing the window
        },
      },
    },

    init = function()
      -- 1. Disable default <Tab> for copilot.vim
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      -- 2. Remap <S-Tab> to accept suggestions
      vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
    end,

    config = function(_, opts)
      local chat = require 'CopilotChat'

      -- Load Telescope UI integration
      require('telescope').load_extension 'ui-select'

      chat.setup(opts)

      -- Chat Keybinds
      vim.keymap.set('n', '<leader>cc', function()
        chat.toggle()
      end, { desc = 'CopilotChat - Toggle' })
      -- vim.keymap.set('n', '<leader>cr', function()
      --   chat.reset()
      -- end, { desc = 'CopilotChat - Reset' })
      vim.keymap.set('n', '<leader>ca', function()
        chat.select_prompt()
      end, { desc = 'CopilotChat - Prompt Actions' })
    end,
  },
}
