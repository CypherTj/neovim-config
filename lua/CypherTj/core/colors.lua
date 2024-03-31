local M = {}

-- Define highlight groups using colors from the current colorscheme
M.colors = {
  black = vim.g.terminal_color_0,
  red = vim.g.terminal_color_1,
  green = vim.g.terminal_color_2,
  yellow = vim.g.terminal_color_3,
  blue = vim.g.terminal_color_4,
  magenta = vim.g.terminal_color_5,
  cyan = vim.g.terminal_color_6,
  white = vim.g.terminal_color_7,
  black_light = vim.g.terminal_color_8,
  red_light = vim.g.terminal_color_9,
  green_light = vim.g.terminal_color_10,
  yellow_light = vim.g.terminal_color_11,
  blue_light = vim.g.terminal_color_12,
  magenta_light = vim.g.terminal_color_13,
  cyan_light = vim.g.terminal_color_14,
  white_light = vim.g.terminal_color_15,
  none = 'NONE',
  dark = '#545c7e'
}

return M;
