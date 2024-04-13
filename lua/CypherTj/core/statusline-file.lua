local colors = require('CypherTj.core.colors').colors
local get_sep = require('CypherTj.core.separators').get_separator
local utils = require 'CypherTj.core.utils'

local M = {}

local function get_file_info()
  local filepath = vim.fn.expand '%:.'
  local icon_str, icon_color = require('nvim-web-devicons').get_icon_color(vim.fn.expand '%:t', nil, { default = true })
  if vim.fn.empty(filepath) == 1 then
    filepath = '[No Name]'
  end
  return icon_str, icon_color, filepath
end

local function file_size()
  local path = vim.api.nvim_buf_get_name(0)
  local size = vim.fn.getfsize(path)

  if size == -1 then
    return ''
  elseif size < 1024 then
    return '[' .. tostring(size) .. ' bytes]'
  elseif size < 1024 * 1024 then
    return string.format('[%.2f KB]', size / 1024)
  elseif size < 1024 * 1024 * 1024 then
    return string.format('[%.2f MB]', size / (1024 * 1024))
  else
    return string.format('[%.2f GB]', size / (1024 * 1024 * 1024))
  end
end

function M.get_file_comp()
  local parts = {}

  table.insert(parts, get_sep('FileInfoSepBefore', { fg = colors.dark, bg = colors.none }, 'left'))

  local icon_str, icon_color, filepath = get_file_info()
  table.insert(parts, utils.create_component(icon_str .. ' ', 'FileInfoFileIcon', { fg = icon_color, bg = colors.dark }))
  table.insert(parts, utils.create_component(' ' .. filepath, 'FileInfoFilePath', { fg = colors.black_light, bg = colors.white }))
  table.insert(parts, vim.bo.modified and ' [+]' or '')
  table.insert(parts, ' ' .. file_size())
  table.insert(parts, get_sep('FileInfoSepAfter', { fg = colors.white, bg = colors.none }, 'right'))

  return table.concat(parts, '')
end

return M
