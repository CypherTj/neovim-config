require 'CypherTj.core.options'
require 'CypherTj.core.keymaps'
require 'CypherTj.core.custom-statusline'

-- setup lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ { import = 'CypherTj.plugins' }, { import = 'CypherTj.plugins.lsp' } }, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})



-- load statusline
require 'CypherTj.core.statusline'

-- Function to set the statusline
local function set_statusline()
  vim.o.statusline = '%!luaeval("require\'CypherTj.core.statusline\'.statusline()")'
end

-- Set the initial statusline
set_statusline()
