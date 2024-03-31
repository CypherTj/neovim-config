local M = {}

local function line_info()
  if vim.bo.filetype == 'alpha' then
    return ''
  end
  return ' %P %l:%c '
end

local function file_format()
  return vim.bo.fileformat
end

local function spaces()
  return ' Sp:' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
end

function M.buffer_info()
  local parts = {}

  -- line info
  table.insert(parts, line_info())
  table.insert(parts, spaces())
  table.insert(parts, file_format())

  return table.concat(parts, '');
end

return M
