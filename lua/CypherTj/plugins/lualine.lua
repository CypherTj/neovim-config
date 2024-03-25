-- icons
local icons = {
    git = {
        unstaged = " ",
        staged = " ",
        unmerged = " ",
        renamed = " ",
        untracked = " ",
        deleted = " ",
        ignored = " ",
        conflict = "裂"
    },
    dashboard = {
        lazy = "󰒲 ",
        update = " ",
        sync = " ",
        mason = "  ",
        telescope = "  ",
        exit = " "
    },
    lualine = {
        left_bar = "▊ ",
        right_bar = " ▊",
        neovim_icon = " ",
        branch = "",
        add = " ",
        change = " ",
        delete = " ",
        lsp_icon = "lsp  ",
        error = " ",
        warn = " ",
        hint = " ",
        info = " ",
        select = " ",
        terminal = " ",
        replace = " ",
        copilot_enabled = " ",
        copilot_sleep = "󰒲 ",
        copilot_disabled = " ",
        copilot_warning = " ",
        copilot_unknown = " ",
        status_right_pop = " ",
        status_right_mac = " "
    },
    neotree = {
        default = " ",
        symlink = " ",
        bookmark = " ",
        folder = {
            arrow_closed = " ",
            arrow_open = " ",
            default = " ",
            open = " ",
            empty = " ",
            closed = " ",
            empty_open = " ",
            symlink = " ",
            symlink_open = " ",
            symlink_arrow = "  "
        },
        file = {
            modified = "󱇨 "
        },
        git = {
            unstaged = " ",
            staged = " ",
            unmerged = " ",
            renamed = " ",
            untracked = " ",
            deleted = " ",
            ignored = " ",
            conflict = "裂"
        }
    }
}

-- return {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     dependencies = {"AndreM222/copilot-lualine"},
--     opts = function()
--         local colors = require("catppuccin.palettes").get_palette("mocha")
--         local mode_color = {
--             -- normal
--             n = colors.blue,
--             no = colors.blue,
--             -- insert
--             i = colors.green,
--             -- visual
--             v = colors.magenta,
--             [""] = colors.magenta,
--             V = colors.magenta,
--             -- select
--             s = colors.orange,
--             S = colors.orange,
--             [""] = colors.orange,
--             -- replace
--             R = colors.red,
--             Rv = colors.red,
--             -- command
--             c = colors.yellow,
--             cv = colors.yellow,
--             ce = colors.yellow,
--             ["!"] = colors.yellow,
--             -- other
--             ic = colors.teal,
--             r = colors.teal,
--             rm = colors.teal,
--             ["r?"] = colors.teal,
--             t = colors.teal
--         }
--         local mode_icon = {
--             -- normal
--             n = icons.lualine.neovim_icon,
--             no = icons.lualine.neovim_icon,
--             -- insert
--             i = icons.lualine.change,
--             -- visual
--             v = icons.lualine.select,
--             [""] = icons.lualine.select,
--             V = icons.lualine.select,
--             -- select
--             s = icons.lualine.select,
--             S = icons.lualine.select,
--             [""] = icons.lualine.select,
--             -- replace
--             R = icons.lualine.replace,
--             Rv = icons.lualine.replace,
--             -- command
--             c = icons.lualine.terminal,
--             cv = icons.lualine.terminal,
--             ce = icons.lualine.terminal,
--             ["!"] = icons.lualine.terminal,
--             -- other
--             ic = icons.lualine.neovim_icon,
--             r = icons.lualine.neovim_icon,
--             rm = icons.lualine.neovim_icon,
--             ["r?"] = icons.lualine.neovim_icon,
--             t = icons.lualine.neovim_icon
--         }
--         local conditions = {
--             buffer_not_empty = function()
--                 return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
--             end,
--             hide_in_width = function()
--                 return vim.fn.winwidth(0) > 80
--             end,
--             check_git_workspace = function()
--                 local filepath = vim.fn.expand("%:p:h")
--                 local gitdir = vim.fn.finddir(".git", filepath .. ";")
--                 return gitdir and #gitdir > 0 and #gitdir < #filepath
--             end
--         }

--         local config = {
--             options = {
--                 -- Disable sections and component separators
--                 component_separators = "",
--                 theme = "auto",
--                 globalstatus = true,
--                 disabled_filetypes = {
--                     statusline = {"dashboard", "alpha", "neo-tree", "lazy", "mason"}
--                 }
--             },
--             sections = {
--                 -- these are to remove the defaults
--                 lualine_a = {},
--                 lualine_b = {},
--                 lualine_y = {},
--                 lualine_z = {},
--                 lualine_c = {},
--                 lualine_x = {}
--             },
--             inactive_sections = {
--                 -- these are to remove the defaults
--                 lualine_a = {},
--                 lualine_b = {},
--                 lualine_y = {},
--                 lualine_z = {},
--                 lualine_c = {},
--                 lualine_x = {}
--             }
--         }

--         -- Inserts a component in lualine_c at left section
--         local function ins_left(component)
--             table.insert(config.sections.lualine_c, component)
--         end

--         -- Inserts a component in lualine_x at right section
--         local function ins_right(component)
--             table.insert(config.sections.lualine_x, component)
--         end

--         ins_left({
--             function()
--                 return icons.lualine.left_bar
--             end,
--             color = function()
--                 return {
--                     fg = mode_color[vim.fn.mode()]
--                 }
--             end,
--             padding = {
--                 left = 0,
--                 right = 1
--             }
--         })

--         ins_left({
--             -- mode component
--             function()
--                 return mode_icon[vim.fn.mode()]
--             end,
--             color = function()
--                 return {
--                     fg = mode_color[vim.fn.mode()]
--                 }
--             end,
--             padding = {
--                 left = 0,
--                 right = 1
--             }
--         })

--         ins_left({
--             "branch",
--             icon = icons.lualine.branch,
--             color = {
--                 fg = colors.magenta,
--                 gui = "bold"
--             },
--             padding = {
--                 left = 1,
--                 right = 1
--             }
--         })

--         -- icon for file
--         ins_left({
--             "filetype",
--             icon_only = true,
--             padding = {
--                 left = 2,
--                 right = 1
--             }
--         })

--         -- name of file being edited
--         ins_left({
--             "filename",
--             path = 0,
--             symbols = {
--                 modified = "",
--                 readonly = "",
--                 unnamed = ""
--             },
--             color = {
--                 fg = colors.fg,
--                 gui = "italic"
--             },
--             padding = {
--                 left = 0,
--                 right = 2
--             }
--         })

--         ins_left({
--             "diff",
--             symbols = {
--                 added = icons.lualine.add,
--                 modified = icons.lualine.change,
--                 removed = icons.lualine.delete
--             },
--             diff_color = {
--                 added = {
--                     fg = colors.green
--                 },
--                 modified = {
--                     fg = colors.blue
--                 },
--                 removed = {
--                     fg = colors.red
--                 }
--             },
--             cond = conditions.hide_in_width,
--             padding = {
--                 left = 2,
--                 right = 2
--             }
--         })

--         ins_left({
--             function()
--                 return require("nvim-navic").get_location()
--             end,
--             cond = function()
--                 return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
--             end,
--             padding = {
--                 left = 2,
--                 right = 2
--             }
--         })

--         -- right side
--         ins_right({
--             function()
--                 return require("noice").api.status.mode.get()
--             end,
--             cond = function()
--                 return package.loaded["noice"] and require("noice").api.status.mode.has()
--             end,
--             color = colors.info,
--             padding = {
--                 left = 2,
--                 right = 2
--             }
--         })

--         ins_right({
--             function()
--                 return icons.lualine.error .. require("dap").status()
--             end,
--             cond = function()
--                 return package.loaded["dap"] and require("dap").status() ~= ""
--             end,
--             color = colors.info,
--             padding = {
--                 left = 2,
--                 right = 2
--             }
--         })

--         -- diagnostics
--         ins_right({
--             "diagnostics",
--             sources = {"nvim_diagnostic"},
--             symbols = {
--                 error = icons.lualine.error,
--                 warn = icons.lualine.warn,
--                 info = icons.lualine.info,
--                 hint = icons.lualine.hint
--             },
--             diagnostics_color = {
--                 error = {
--                     fg = colors.error
--                 },
--                 warn = {
--                     fg = colors.warning
--                 },
--                 info = {
--                     fg = colors.info
--                 },
--                 hint = {
--                     fg = colors.hint
--                 }
--             },
--             padding = {
--                 left = 2,
--                 right = 2
--             }
--         })

--         ins_right({
--             -- Lsp server name .
--             function()
--                 local msg = "no active lsp"
--                 local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
--                 local clients = vim.lsp.get_active_clients()
--                 if next(clients) == nil then
--                     return msg
--                 end
--                 for _, client in ipairs(clients) do
--                     local filetypes = client.config.filetypes
--                     if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--                         return client.name
--                     end
--                 end
--                 return msg
--             end,
--             icon = icons.lualine.lsp_icon,
--             color = {
--                 fg = colors.magenta,
--                 gui = "bold"
--             },
--             padding = {
--                 left = 1,
--                 right = 2
--             }
--         })

--         ins_right({
--             "copilot",
--             symbols = {
--                 status = {
--                     icons = {
--                         enabled = icons.copilot_enabled,
--                         sleep = icons.copilot_sleep,
--                         disabled = icons.copilot_disabled,
--                         warning = icons.copiolt_warning,
--                         unknown = icons.copilot_unknown
--                     },
--                     hl = {
--                         enabled = colors.green,
--                         sleep = colors.green,
--                         disabled = colors.error,
--                         warning = colors.warning,
--                         unknown = colors.warning
--                     }
--                 },
--                 spinners = require("copilot-lualine.spinners").dots,
--                 spinner_color = colors.green
--             },
--             show_colors = true,
--             show_loading = true,
--             padding = {
--                 left = 1,
--                 right = 1
--             }
--         })

--         -- os logo
--         ins_right({
--             function()
--                 return icons.lualine.status_right_pop
--             end,
--             color = function()
--                 return {
--                     fg = mode_color[vim.fn.mode()]
--                 }
--             end,
--             padding = {
--                 left = 1,
--                 right = 0
--             }
--         })

--         -- right bar; color change with vim mode
--         ins_right({
--             function()
--                 return icons.lualine.right_bar
--             end,
--             color = function()
--                 return {
--                     fg = mode_color[vim.fn.mode()]
--                 }
--             end,
--             padding = {
--                 left = 1,
--                 right = 0
--             }
--         })
--         return config
--     end
-- }
-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = {
--       "nvim-tree/nvim-web-devicons",
--       "meuter/lualine-so-fancy.nvim",
--   },
--   opts = {
--       options = {
--           theme = "seoul256",
--           component_separators = { left = "│", right = "│" },
--           section_separators = { left = "", right = "" },
--           globalstatus = true,
--           refresh = {
--               statusline = 100,
--           },
--       },
--       sections = {
--           lualine_a = {
--               { "fancy_mode", width = 3 }
--           },
--           lualine_b = {
--               { "fancy_branch" },
--               { "fancy_diff" },
--           },
--           lualine_c = {
--               { "fancy_cwd", substitute_home = true }
--           },
--           lualine_x = {
--               { "fancy_macro" },
--               { "fancy_diagnostics" },
--               { "fancy_searchcount" },
--               { "fancy_location" },
--           },
--           lualine_y = {
--               { "fancy_filetype", ts_icon = "" }
--           },
--           lualine_z = {
--               { "fancy_lsp_servers" }
--           },
--       }
--   },
-- }

-- Custom Style
-- return {
--     'nvim-lualine/lualine.nvim',
--     requires = {
--         'nvim-tree/nvim-web-devicons',
--         opt = true
--     },
--     config = function()
--         -- Eviline config for lualine
--         -- Author: shadmansaleh
--         -- Credit: glepnir
--         local lualine = require('lualine')

--         -- Color table for highlights
--         -- stylua: ignore
--         local colors = {
--             bg = '#202328',
--             fg = '#bbc2cf',
--             yellow = '#ECBE7B',
--             cyan = '#008080',
--             darkblue = '#081633',
--             green = '#98be65',
--             orange = '#FF8800',
--             violet = '#a9a1e1',
--             magenta = '#c678dd',
--             blue = '#51afef',
--             red = '#ec5f67'
--         }

--         local conditions = {
--             buffer_not_empty = function()
--                 return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
--             end,
--             hide_in_width = function()
--                 return vim.fn.winwidth(0) > 80
--             end,
--             check_git_workspace = function()
--                 local filepath = vim.fn.expand('%:p:h')
--                 local gitdir = vim.fn.finddir('.git', filepath .. ';')
--                 return gitdir and #gitdir > 0 and #gitdir < #filepath
--             end
--         }

--         -- Config
--         local config = {
--             options = {
--                 -- Disable sections and component separators
--                 component_separators = '',
--                 section_separators = '',
--                 theme = {
--                     -- We are going to use lualine_c an lualine_x as left and
--                     -- right section. Both are highlighted by c theme .  So we
--                     -- are just setting default looks o statusline
--                     normal = {
--                         c = {
--                             fg = colors.fg,
--                             bg = colors.bg
--                         }
--                     },
--                     inactive = {
--                         c = {
--                             fg = colors.fg,
--                             bg = colors.bg
--                         }
--                     }
--                 }
--             },
--             sections = {
--                 -- these are to remove the defaults
--                 lualine_a = {},
--                 lualine_b = {},
--                 lualine_y = {},
--                 lualine_z = {},
--                 -- These will be filled later
--                 lualine_c = {},
--                 lualine_x = {}
--             },
--             inactive_sections = {
--                 -- these are to remove the defaults
--                 lualine_a = {},
--                 lualine_b = {},
--                 lualine_y = {},
--                 lualine_z = {},
--                 lualine_c = {},
--                 lualine_x = {}
--             }
--         }

--         -- Inserts a component in lualine_c at left section
--         local function ins_left(component)
--             table.insert(config.sections.lualine_c, component)
--         end

--         -- Inserts a component in lualine_x at right section
--         local function ins_right(component)
--             table.insert(config.sections.lualine_x, component)
--         end

--         ins_left {
--             function()
--                 return '▊'
--             end,
--             color = {
--                 fg = colors.blue
--             }, -- Sets highlighting of component
--             padding = {
--                 left = 0,
--                 right = 1
--             } -- We don't need space before this
--         }

--         ins_left {
--             -- mode component
--             function()
--                 return ' '
--             end,
--             color = function()
--                 -- auto change color according to neovims mode
--                 local mode_color = {
--                     n = colors.red,
--                     i = colors.green,
--                     v = colors.blue,
--                     [''] = colors.blue,
--                     V = colors.blue,
--                     c = colors.magenta,
--                     no = colors.red,
--                     s = colors.orange,
--                     S = colors.orange,
--                     [''] = colors.orange,
--                     ic = colors.yellow,
--                     R = colors.violet,
--                     Rv = colors.violet,
--                     cv = colors.red,
--                     ce = colors.red,
--                     r = colors.cyan,
--                     rm = colors.cyan,
--                     ['r?'] = colors.cyan,
--                     ['!'] = colors.red,
--                     t = colors.red
--                 }
--                 return {
--                     fg = mode_color[vim.fn.mode()]
--                 }
--             end,
--             padding = {
--                 right = 1
--             }
--         }

--         ins_left {
--             -- filesize component
--             'filesize',
--             cond = conditions.buffer_not_empty
--         }

--         ins_left {
--             'filename',
--             cond = conditions.buffer_not_empty,
--             color = {
--                 fg = colors.magenta,
--                 gui = 'bold'
--             }
--         }

--         ins_left {'location'}

--         ins_left {
--             'progress',
--             color = {
--                 fg = colors.fg,
--                 gui = 'bold'
--             }
--         }

--         ins_left {
--             'diagnostics',
--             sources = {'nvim_diagnostic'},
--             symbols = {
--                 error = ' ',
--                 warn = ' ',
--                 info = ' '
--             },
--             diagnostics_color = {
--                 color_error = {
--                     fg = colors.red
--                 },
--                 color_warn = {
--                     fg = colors.yellow
--                 },
--                 color_info = {
--                     fg = colors.cyan
--                 }
--             }
--         }

--         -- Insert mid section. You can make any number of sections in neovim :)
--         -- for lualine it's any number greater then 2
--         ins_left {function()
--             return '%='
--         end}

--         ins_left {
--             -- Lsp server name .
--             function()
--                 local msg = 'No Active Lsp'
--                 local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--                 local clients = vim.lsp.get_active_clients()
--                 if next(clients) == nil then
--                     return msg
--                 end
--                 for _, client in ipairs(clients) do
--                     local filetypes = client.config.filetypes
--                     if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--                         return client.name
--                     end
--                 end
--                 return msg
--             end,
--             icon = ' LSP:',
--             color = {
--                 fg = '#ffffff',
--                 gui = 'bold'
--             }
--         }

--         -- Add components to right sections
--         ins_right {
--             'o:encoding', -- option component same as &encoding in viml
--             fmt = string.upper, -- I'm not sure why it's upper case either ;)
--             cond = conditions.hide_in_width,
--             color = {
--                 fg = colors.green,
--                 gui = 'bold'
--             }
--         }

--         ins_right {
--             'fileformat',
--             fmt = string.upper,
--             icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--             color = {
--                 fg = colors.green,
--                 gui = 'bold'
--             }
--         }

--         ins_right {
--             'branch',
--             icon = '',
--             color = {
--                 fg = colors.violet,
--                 gui = 'bold'
--             }
--         }

--         ins_right {
--             'diff',
--             -- Is it me or the symbol for modified us really weird
--             symbols = {
--                 added = ' ',
--                 modified = '󰝤 ',
--                 removed = ' '
--             },
--             diff_color = {
--                 added = {
--                     fg = colors.green
--                 },
--                 modified = {
--                     fg = colors.orange
--                 },
--                 removed = {
--                     fg = colors.red
--                 }
--             },
--             cond = conditions.hide_in_width
--         }

--         ins_right {
--             function()
--                 return '▊'
--             end,
--             color = {
--                 fg = colors.blue
--             },
--             padding = {
--                 left = 1
--             }
--         }
--         lualine.setup(config)
--     end
-- }


-- return {
--     'nvim-lualine/lualine.nvim',
--     dependencies = {'nvim-tree/nvim-web-devicons'},
--     config = function()
--         -- Bubbles config for lualine
--         -- Author: lokesh-krishna
--         -- MIT license, see LICENSE for more details.

--         -- stylua: ignore
--         local colors = {
--             blue   = '#80a0ff',
--             cyan   = '#79dac8',
--             black  = '#080808',
--             white  = '#c6c6c6',
--             red    = '#ff5189',
--             violet = '#d183e8',
--             grey   = '#303030',
--         }
        
--         local bubbles_theme = {
--             normal = {
--                 a = { fg = colors.black, bg = colors.violet },
--                 b = { fg = colors.white, bg = colors.grey },
--                 c = { fg = colors.white },
--             },

--             insert = { a = { fg = colors.black, bg = colors.blue } },
--             visual = { a = { fg = colors.black, bg = colors.cyan } },
--             replace = { a = { fg = colors.black, bg = colors.red } },

--             inactive = {
--                 a = { fg = colors.white, bg = colors.black },
--                 b = { fg = colors.white, bg = colors.black },
--                 c = { fg = colors.white },
--             },
--         }
--         require('lualine').setup {
--             options = {
--               theme = bubbles_theme,
--               globalstatus = true,
--               component_separators = '',
--               section_separators = { left = '', right = '' },
--             },
--             sections = {
--               lualine_a = { { 'mode', separator = { left = '',  right = '' }, right_padding = 2 } },
--               lualine_b = { 'filename', 'branch' },
--               lualine_c = {
--                 '%=', --[[ add your center compoentnts here in place of this comment ]]
--               },
--               lualine_x = {},
--               lualine_y = { 'filetype', 'progress' },
--               lualine_z = {
--                 { 'location', separator = { right = '' }, left_padding = 2 },
--               },
--             },
--             inactive_sections = {
--               lualine_a = { 'filename' },
--               lualine_b = {},
--               lualine_c = {},
--               lualine_x = {},
--               lualine_y = {},
--               lualine_z = { 'location' },
--             },
--             tabline = {},
--             extensions = {},
--           }
--     end
-- }

-- return {
--     'nvim-lualine/lualine.nvim',
--     dependencies = {'nvim-tree/nvim-web-devicons'},
--     config = function()
--         -- Eviline config for lualine
--         -- Author: shadmansaleh
--         -- Credit: glepnir
--         local lualine = require('lualine')

--         -- Color table for highlights
--         -- stylua: ignore
--         local colors = {
--             bg       = '#202328',
--             fg       = '#bbc2cf',
--             yellow   = '#ECBE7B',
--             cyan     = '#008080',
--             darkblue = '#081633',
--             green    = '#98be65',
--             orange   = '#FF8800',
--             violet   = '#a9a1e1',
--             magenta  = '#c678dd',
--             blue     = '#51afef',
--             red      = '#ec5f67',
--         }

--         local conditions = {
--             buffer_not_empty = function()
--                 return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
--             end,
--             hide_in_width = function()
--                 return vim.fn.winwidth(0) > 80
--             end,
--             check_git_workspace = function()
--                 local filepath = vim.fn.expand('%:p:h')
--                 local gitdir = vim.fn.finddir('.git', filepath .. ';')
--                 return gitdir and #gitdir > 0 and #gitdir < #filepath
--             end,
--         }

--         -- Config
--         local config = {
--         options = {
--             -- Disable sections and component separators
--             component_separators = '',
--             section_separators = '',
--             globalstatus = true,
--             theme = {
--             -- We are going to use lualine_c an lualine_x as left and
--             -- right section. Both are highlighted by c theme .  So we
--             -- are just setting default looks o statusline
--             normal = { c = { fg = colors.fg, bg = colors.bg } },
--             inactive = { c = { fg = colors.fg, bg = colors.bg } },
--             },
--         },
--         sections = {
--             -- these are to remove the defaults
--             lualine_a = {},
--             lualine_b = {},
--             lualine_y = {},
--             lualine_z = {},
--             -- These will be filled later
--             lualine_c = {},
--             lualine_x = {},
--         },
--         inactive_sections = {
--             -- these are to remove the defaults
--             lualine_a = {},
--             lualine_b = {},
--             lualine_y = {},
--             lualine_z = {},
--             lualine_c = {},
--             lualine_x = {},
--         },
--         }

--         -- Inserts a component in lualine_c at left section
--         local function ins_left(component)
--         table.insert(config.sections.lualine_c, component)
--         end

--         -- Inserts a component in lualine_x at right section
--         local function ins_right(component)
--         table.insert(config.sections.lualine_x, component)
--         end

--         ins_left {
--             function()
--                 return '▊'
--             end,
--             color = { fg = colors.blue }, -- Sets highlighting of component
--             padding = { left = 0, right = 1 }, -- We don't need space before this
--         }

--         ins_left {
--         -- mode component
--         function()
--             return ''
--         end,
--         color = function()
--             -- auto change color according to neovims mode
--             local mode_color = {
--                 n = colors.red,
--                 i = colors.green,
--                 v = colors.blue,
--                 [''] = colors.blue,
--                 V = colors.blue,
--                 c = colors.magenta,
--                 no = colors.red,
--                 s = colors.orange,
--                 S = colors.orange,
--                 [''] = colors.orange,
--                 ic = colors.yellow,
--                 R = colors.violet,
--                 Rv = colors.violet,
--                 cv = colors.red,
--                 ce = colors.red,
--                 r = colors.cyan,
--                 rm = colors.cyan,
--                 ['r?'] = colors.cyan,
--                 ['!'] = colors.red,
--                 t = colors.red,
--             }
--             return { fg = mode_color[vim.fn.mode()] }
--         end,
--         padding = { right = 1 },
--         }

--         ins_left {
--         -- filesize component
--         'filesize',
--         cond = conditions.buffer_not_empty,
--         }

--         ins_left {
--         'filename',
--         cond = conditions.buffer_not_empty,
--         color = { fg = colors.magenta, gui = 'bold' },
--         }

--         ins_left { 'location' }

--         ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

--         ins_left {
--         'diagnostics',
--         sources = { 'nvim_diagnostic' },
--         symbols = { error = ' ', warn = ' ', info = ' ' },
--         diagnostics_color = {
--             color_error = { fg = colors.red },
--             color_warn = { fg = colors.yellow },
--             color_info = { fg = colors.cyan },
--         },
--         }

--         -- Insert mid section. You can make any number of sections in neovim :)
--         -- for lualine it's any number greater then 2
--         ins_left {
--         function()
--             return '%='
--         end,
--         }

--         ins_left {
--         -- Lsp server name .
--         function()
--             local msg = 'No Active Lsp'
--             local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--             local clients = vim.lsp.get_active_clients()
--             if next(clients) == nil then
--             return msg
--             end
--             for _, client in ipairs(clients) do
--             local filetypes = client.config.filetypes
--             if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--                 return client.name
--             end
--             end
--             return msg
--         end,
--         icon = ' LSP:',
--         color = { fg = '#ffffff', gui = 'bold' },
--         }

--         ins_right {
--         'branch',
--         icon = '',
--         color = { fg = colors.violet, gui = 'bold' },
--         }

--         ins_right {
--         'diff',
--         -- Is it me or the symbol for modified us really weird
--         symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
--         diff_color = {
--             added = { fg = colors.green },
--             modified = { fg = colors.orange },
--             removed = { fg = colors.red },
--         },
--         cond = conditions.hide_in_width,
--         }

--         ins_right {
--         function()
--             return '▊'
--         end,
--         color = { fg = colors.blue },
--         padding = { left = 1 },
--         }

--         -- Now don't forget to initialize lualine
--         lualine.setup(config)
--     end
-- }

return {}

-- return {
--     'nvim-lualine/lualine.nvim',
--     dependencies = {'nvim-tree/nvim-web-devicons'},
--     config = function()
--         require('lualine').setup {
--             options = {
--                 icons_enabled = true,
--                 theme = 'auto',
--                 globalstatus = true,
--                 component_separators = {
--                     left = '',
--                     right = ''
--                 },
--                 section_separators = {
--                     left = '',
--                     right = ''
--                 },
--                 --   section_separators = { left = '', right = ''},
--                 disabled_filetypes = {
--                     statusline = {},
--                     winbar = {}
--                 },
--                 ignore_focus = {},
--                 always_divide_middle = true,
--                 refresh = {
--                     statusline = 1000,
--                     tabline = 1000,
--                     winbar = 1000
--                 }
--             },
--             sections = {
--                 lualine_a = {{
--                     'mode',
--                     icons_enabled = true,
--                     icon = '',
--                     separator = {
--                         left = '',
--                         right = ''
--                     }
--                 }},
--                 --   lualine_b = {{ 'branch', separator = { left = '', right = '' } }, {'diff'}, {'diagnostics'}},
--                 lualine_b = {},
--                 lualine_c = {{
--                     'branch',
--                     color = {
--                         fg = '#ffaa88',
--                         bg = 'grey',
--                         gui = 'italic,bold'
--                     },
--                     separator = '',
--                     type = 'var',
--                 }, 'filename'},
--                 lualine_x = {{
--                     "diff",
--                     symbols = {
--                         added = icons.git.added,
--                         modified = icons.git.modified,
--                         removed = icons.git.removed
--                     },
--                     source = function()
--                         local gitsigns = vim.b.gitsigns_status_dict
--                         if gitsigns then
--                             return {
--                                 added = gitsigns.added,
--                                 modified = gitsigns.changed,
--                                 removed = gitsigns.removed
--                             }
--                         end
--                     end
--                 }},
--                 lualine_y = {{
--                     "progress",
--                     separator = " ",
--                     padding = {
--                         left = 1,
--                         right = 0
--                     }
--                 }, {
--                     "location",
--                     padding = {
--                         left = 0,
--                         right = 1
--                     }
--                 }},
--                 lualine_z = {function()
--                     return " " .. os.date("%R")
--                 end}
--             },
--             inactive_sections = {
--                 lualine_a = {},
--                 lualine_b = {},
--                 lualine_c = {'filename'},
--                 lualine_x = {'location'},
--                 lualine_y = {},
--                 lualine_z = {}
--             },
--             tabline = {},
--             winbar = {},
--             inactive_winbar = {},
--             extensions = {"neo-tree", "lazy"}
--         }
--     end
-- }
