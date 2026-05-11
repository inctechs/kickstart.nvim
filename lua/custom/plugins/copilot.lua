-- copilot.vim is a Vimscript plugin; no Lua setup() needed.
-- Keymaps and globals are set here; CopilotChat (copilot_chat.lua) depends
-- on this plugin being added first, which the alphabetical load order in
-- init.lua guarantees (copilot.lua < copilot_chat.lua).
vim.pack.add { 'https://github.com/github/copilot.vim' }

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
