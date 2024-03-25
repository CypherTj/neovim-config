-- local modes = {
--   ["n"] = "NORMAL",
--   ["no"] = "NORMAL",
--   ["v"] = "VISUAL",
--   ["V"] = "VISUAL LINE",
--   [""] = "VISUAL BLOCK",
--   ["s"] = "SELECT",
--   ["S"] = "SELECT LINE",
--   [""] = "SELECT BLOCK",
--   ["i"] = "INSERT",
--   ["ic"] = "INSERT",
--   ["R"] = "REPLACE",
--   ["Rv"] = "VISUAL REPLACE",
--   ["c"] = "COMMAND",
--   ["cv"] = "VIM EX",
--   ["ce"] = "EX",
--   ["r"] = "PROMPT",
--   ["rm"] = "MOAR",
--   ["r?"] = "CONFIRM",
--   ["!"] = "SHELL",
--   ["t"] = "TERMINAL",
-- }
-- local function mode()
--   local current_mode = vim.api.nvim_get_mode().mode
--   return string.format(" %s ", modes[current_mode]):upper()
-- end
-- local function update_mode_colors()
--   local current_mode = vim.api.nvim_get_mode().mode
--   local mode_color = "%#StatusLineAccent#"
--   if current_mode == "n" then
--       mode_color = "%#StatuslineAccent#"
--   elseif current_mode == "i" or current_mode == "ic" then
--       mode_color = "%#StatuslineInsertAccent#"
--   elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
--       mode_color = "%#StatuslineVisualAccent#"
--   elseif current_mode == "R" then
--       mode_color = "%#StatuslineReplaceAccent#"
--   elseif current_mode == "c" then
--       mode_color = "%#StatuslineCmdLineAccent#"
--   elseif current_mode == "t" then
--       mode_color = "%#StatuslineTerminalAccent#"
--   end
--   return mode_color
-- end
-- local function filepath()
--   local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
--   if fpath == "" or fpath == "." then
--       return " "
--   end
--   return string.format(" %%<%s/", fpath)
-- end
-- local function lsp()
--   local count = {}
--   local levels = {
--     errors = "Error",
--     warnings = "Warn",
--     info = "Info",
--     hints = "Hint",
--   }
--   for k, level in pairs(levels) do
--     count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
--   end
--   local errors = ""
--   local warnings = ""
--   local hints = ""
--   local info = ""
--   if count["errors"] ~= 0 then
--     errors = " %#LspDiagnosticsSignError# " .. count["errors"]
--   end
--   if count["warnings"] ~= 0 then
--     warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
--   end
--   if count["hints"] ~= 0 then
--     hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
--   end
--   if count["info"] ~= 0 then
--     info = " %#LspDiagnosticsSignInformation# " .. count["info"]
--   end
--   return errors .. warnings .. hints .. info .. "%#Normal#"
-- end
-- local function lineinfo()
--   if vim.bo.filetype == "alpha" then
--     return ""
--   end
--   return " %P %l:%c "
-- end
-- local vcs = function()
--   local git_info = vim.b.gitsigns_status_dict
--   if not git_info or git_info.head == "" then
--     return ""
--   end
--   local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
--   local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
--   local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
--   if git_info.added == 0 then
--     added = ""
--   end
--   if git_info.changed == 0 then
--     changed = ""
--   end
--   if git_info.removed == 0 then
--     removed = ""
--   end
--   return table.concat {
--      " ",
--      added,
--      changed,
--      removed,
--      " ",
--      "%#GitSignsAdd# ",
--      git_info.head,
--      " %#Normal#",
--   }
-- end
-- Statusline = {}
-- Statusline.active = function()
--   return table.concat {
--     "%#Statusline#",
--     update_mode_colors(),
--     mode(),
--     vcs(),
--     "%#Normal# ",
--     filepath(),
--     "%#Normal#",
--     lsp(),
--     "%=%#StatusLineExtra#",
--     lineinfo(),
--   }
-- end
-- function Statusline.inactive()
--   return " %F"
-- end
-- function Statusline.short()
--   return "%#StatusLineNC#   NvimTree"
-- end
-- vim.api.nvim_exec([[
--   augroup Statusline
--   au!
--   au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
--   au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
--   au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
--   augroup END
-- ]], false)


-- diff conf
-- Define a function to get the full mode name
--   vim.g.get_mode_name = function()
--     local mode = vim.fn.mode()

--     local mode_names = {
--         n = "Normal",
--         v = "Visual",
--         V = "V-Line",
--         [""] = "V-Block",
--         s = "Select",
--         S = "S-Line",
--         [""] = "S-Block",
--         i = "Insert",
--         R = "Replace",
--         c = "Command-Line",
--         ["!"] = "Ex",
--         t = "Terminal"
--     }

--     -- Return the mode name or the mode character if not found
--     return mode_names[mode] or mode
-- end

-- -- Function to add separators around a string
-- local function with_separators(str)
--     local sep_s = "%#SLModeSep#"  -- start separator
--     local sep_e = "%#SLModeSep#" -- end separator
--     return sep_s .. str .. sep_e
-- end

-- local function setup_statusline()
--     -- Set colors for the status line components
--     vim.cmd("highlight VertSplit guibg=#181818 guifg=#996228")
--     vim.cmd("highlight SLBackground guibg=#181818 guifg=#996228")
--     vim.cmd("highlight SLFileType guibg=indianred guifg=#663333")
--     vim.cmd("highlight SLBufNumber guibg=SeaGreen guifg=#003333")
--     vim.cmd("highlight SLLineNumber guibg=#80a0ff guifg=#003366")
--     vim.cmd("highlight SLModeBox guibg=#ff0000 guifg=#ffffff") -- Customize background and foreground for mode box
--     vim.cmd("highlight SLModeSep guibg=NONE guifg=NONE")

--     -- Set the status line format
--     vim.o.statusline = table.concat({
--     with_separators("%#SLModeBox# %{get_mode_name()} "), -- Separator for mode box
--     with_separators("%#SLBackground# %F "), -- Separator for SLBackground component
--     with_separators("%#SLBufNumber# BN: %n "), -- Separator for SLBufNumber component
--     with_separators("%#SLLineNumber# LN: %l"), -- Separator for SLLineNumber component
--     })
-- end

-- -- Call the setup function to initialize the status line
-- setup_statusline()


-- Define a function to get the full mode name
  vim.g.get_mode_name = function()
    local mode = vim.fn.mode()

    local mode_names = {
        n = "Normal",
        v = "Visual",
        V = "V-Line",
        [""] = "V-Block",
        s = "Select",
        S = "S-Line",
        [""] = "S-Block",
        i = "Insert",
        R = "Replace",
        c = "Command-Line",
        ["!"] = "Ex",
        t = "Terminal"
    }

    -- Return the mode name or the mode character if not found
    return mode_names[mode] or mode
end

-- Function to add separators around a string
local function with_separators(str)
    local sep_start = "%#SLModeSep#"
    local sep_end = "%#SLModeSep#"
    return sep_start .. str .. sep_end
end

local function setup_statusline()
    -- Set colors for the status line components
    vim.cmd("highlight VertSplit guibg=#181818 guifg=#996228")
    vim.cmd("highlight SLBackground guibg=#181818 guifg=#996228")
    vim.cmd("highlight SLFileType guibg=indianred guifg=#663333")
    vim.cmd("highlight SLBufNumber guibg=SeaGreen guifg=#003333")
    vim.cmd("highlight SLLineNumber guibg=#80a0ff guifg=#003366")
    vim.cmd("highlight SLModeBox guibg=#d183e8 guifg=#080808") -- Customize background and foreground for mode box
    vim.cmd("highlight SLModeSep guibg=NONE guifg=#d183e8") -- Separator for mode box

    -- Set the status line format
    vim.o.statusline = table.concat({
    with_separators("%#SLModeBox# %{get_mode_name()} "), -- Separator for mode box
    "%#SLBackground# ", with_separators("%F "), -- Separator for SLBackground component
    "%#SLFileType# ", with_separators("FT: %Y "), -- Separator for SLFileType component
    "%#SLBufNumber# ", with_separators("BN: %n "), -- Separator for SLBufNumber component
    "%#SLLineNumber# ", with_separators("LN: %l"), -- Separator for SLLineNumber component
    })
end

-- Call the setup function to initialize the status line
setup_statusline()



