local palette_colors = require("CypherTj.core.colors").colors;
local M = {}


local mode_map = {
  ['n'] = { 'NORMAL', 'Normal' },
  ['no'] = { 'O-PENDING', 'Visual' },
  ['nov'] = { 'O-PENDING', 'Visual' },
  ['noV'] = { 'O-PENDING', 'Visual' },
  ['no'] = { 'O-PENDING', 'Visual' },
  ['nt'] = { 'T-NORMAL', 'Normal' },
  ['niI'] = { 'NORMAL', 'Normal' },
  ['niR'] = { 'NORMAL', 'Normal' },
  ['niV'] = { 'NORMAL', 'Normal' },
  ['v'] = { 'VISUAL', 'Visual' },
  ['V'] = { 'V-LINE', 'Visual' },
  [''] = { 'V-BLOCK', 'Visual' },
  ['s'] = { 'SELECT', 'Visual' },
  ['S'] = { 'S-LINE', 'Visual' },
  [''] = { 'S-BLOCK', 'Visual' },
  ['i'] = { 'INSERT', 'Insert' },
  ['ic'] = { 'INSERT', 'Insert' },
  ['ix'] = { 'INSERT', 'Insert' },
  ['R'] = { 'REPLACE', 'Replace' },
  ['Rc'] = { 'REPLACE', 'Replace' },
  ['Rv'] = { 'V-REPLACE', 'Normal' },
  ['Rx'] = { 'REPLACE', 'Normal' },
  ['Rvc'] = { 'V-REPLACE', 'Replace' },
  ['Rvx'] = { 'V-REPLACE', 'Replace' },
  ['c'] = { 'COMMAND', 'Command' },
  ['cv'] = { 'EX', 'Command' },
  ['ce'] = { 'EX', 'Command' },
  ['r'] = { 'REPLACE', 'Replace' },
  ['rm'] = { 'MORE', 'Normal' },
  ['r?'] = { 'CONFIRM', 'Normal' },
  ['!'] = { 'SHELL', 'Normal' },
  ['t'] = { 'TERMINAL', 'Command' },
}

local mode_colors = {
  Normal = { fg = palette_colors.blue, bg = palette_colors.black_light },
  Insert = { fg = palette_colors.green, bg = palette_colors.black_light },
  Visual = { fg = palette_colors.yellow, bg = palette_colors.black_light },
  Replace = { fg = palette_colors.blue_light, bg = palette_colors.black_light },
  Command = { fg = palette_colors.magenta, bg = palette_colors.black_light },
  NormalBefore = { fg = palette_colors.black_light, bg = palette_colors.none },
  InsertBefore = { fg = palette_colors.black_light, bg = palette_colors.none },
  VisualBefore = { fg = palette_colors.black_light, bg = palette_colors.none },
  ReplaceBefore = { fg = palette_colors.black_light, bg = palette_colors.none },
  CommandBefore = { fg = palette_colors.black_light, bg = palette_colors.none },
  -- NormalAfter = { fg = palette_colors.white, bg = palette_colors.red },
  -- InsertAfter = { fg = palette_colors.white, bg = palette_colors.green },
  -- VisualAfter = { fg = palette_colors.white, bg = palette_colors.yellow },
  -- ReplaceAfter = { fg = palette_colors.white, bg = palette_colors.blue_light },
  -- CommandAfter = { fg = palette_colors.white, bg = palette_colors.magenta },
}

-- Function to get current mode
function M.current_mode()
  local mode = vim.fn.mode()
  return mode_map[mode] or mode
end

-- Define highlight groups dynamically based on colors from the current colorscheme
for mode, colorstyle in pairs(mode_colors) do
  local highlightstr = 'highlight Mode' .. mode .. ' guifg=' .. colorstyle.fg .. ' guibg=' .. colorstyle.bg
  if colorstyle.style == 'bold' then
    highlightstr = highlightstr .. ' gui=' .. colorstyle.style
  end
  vim.cmd(highlightstr)
end

function M.get_vim_mode()
  local parts = {}
  local mode_sep_b_highlight_group = '%#' .. 'Mode' .. M.current_mode()[2] .. 'Before' .. '#'
  table.insert(parts, mode_sep_b_highlight_group)

  -- Insert character(s) before mode name
  table.insert(parts, "%{''}")

  local mode_highlight_group = '%#' .. 'Mode' .. M.current_mode()[2] .. '#'
  table.insert(parts, mode_highlight_group)

  table.insert(parts, "%{' '}")

  -- Insert the current mode component into parts table
  table.insert(parts, '%{luaeval("require\'CypherTj.core.statusline-vim-mode\'.current_mode()[1]")}')

  local mode_sep_a_highlight_group = '%#' .. 'Mode' .. M.current_mode()[2] .. 'Before' .. '#'
  table.insert(parts, mode_sep_a_highlight_group)
  -- Insert character(s) after mode name
  table.insert(parts, "%{''}")
  return table.concat(parts, '');
end

return M
