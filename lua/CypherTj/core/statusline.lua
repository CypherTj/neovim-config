log = require 'CypherTj.log'

local vim_mode = require 'CypherTj.core.statusline-vim-mode'
local file_info = require 'CypherTj.core.statusline-file'
local buf_comps = require( "CypherTj.core.statusline-buffer-info")

local api = vim.api

local M = {}

--  disable components for neo-tree
local function is_neotree()
  local filename = vim.fn.expand '%:.'
  return filename:match 'neo%-tree'
end

-- Function to generate the complete statusline
function M.statusline()
  local parts = {}

  table.insert(parts, vim_mode.get_vim_mode())

  -- load only if not in neo-tree
  if not is_neotree() then
    table.insert(parts, file_info.get_file_comp())
  end

  -- add divider
  table.insert(parts, '%=')
  
  -- left side components
  table.insert(parts, buf_comps.buffer_info())

  return table.concat(parts, '')
end

return M
