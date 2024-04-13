local colors = require('CypherTj.core.colors').colors
local get_sep = require('CypherTj.core.separators').get_separator
local utils = require 'CypherTj.core.utils'
local M = {}

function M.get_git_info()
  local parts = {}
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == '' then
    return ''
  end

  table.insert(parts, get_sep('GitInfoSepBefore', { fg = colors.black_light, bg = colors.none }, 'left'))
  table.insert(parts, utils.create_component(' ' .. (git_info.added or '0'), 'GitDiffAdded', { fg = colors.green, bg = colors.black_light }))
  table.insert(parts, utils.create_component('  ' .. (git_info.removed or '0'), 'GitDiffRemoved', { fg = colors.red, bg = colors.black_light }))
  table.insert(parts, utils.create_component('  ' .. (git_info.changed or '0'), 'GitDiffChanged', { fg = colors.blue, bg = colors.black_light }))
  table.insert(parts, '  ' .. git_info.head)
  table.insert(parts, get_sep('GitInfoSepAfter', { fg = colors.black_light, bg = colors.none }, 'right'))

  return table.concat(parts, '')
end

return M
