function! ReloadPomodoro()
lua << EOF
    for k in pairs(package.loaded) do 
        if k:match("^pomodoro") then
            package.loaded[k] = nil
        end
    end

EOF

endfunction

lua << EOF

local lualinePomodoroStatus = "🍅 Stopped"
local pomodoroBgColor = ''

local function getPomodoroColor()
  return pomodoroBgColor
end

local function getPomodoroStatus()
  return lualinePomodoroStatus
end

function callBack(pomodoroStatus)
    if pomodoroStatus.status == PomodoroStates.Pomodoro then
        lualinePomodoroStatus = "🍅 Pomodoro: " .. pomodoroStatus.timeLeftInSeconds
        -- pomodoroBgColor = '#609700'
        -- updateLuaConfig()
    elseif pomodoroStatus.status == PomodoroStates.Break then
        lualinePomodoroStatus = "🍅 Break: " .. pomodoroStatus.timeLeftInSeconds
        -- pomodoroBgColor = '#004297'
        -- updateLuaConfig()
    elseif pomodoroStatus.status == PomodoroStates.Stopped then
        lualinePomodoroStatus = "🍅 Stopped"
        -- pomodoroBgColor = ''
        -- updateLuaConfig()
    end
end

local lualineConfig = {
    options = {
        icons_enabled = true,
        -- theme = 'nvcode',
        -- theme = 'solarized_dark',
        section_separators = {'', ''},
        component_separators = {'', ''},
        disabled_filetypes = {},
        theme = 'iceberg_dark' -- https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', },
        lualine_c = {'filename'},
        lualine_x = {
            {
                getPomodoroStatus,
            },
        { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
        'encoding',
        'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive'}
}
-- require("lualine").setup(lualineConfig)


--[[
require('pomodoro').setup{
    pomodoroBreakMinutes = 1,
    pomodoroLongBreakMinutes = 1,
    pomodoroMinutes = 1,
    updateFrequency = 1000,
    notifyCallBack = callBack
}
--]]



-- require('lualine').setup{
    -- options = {lower = true},
    -- sections = {lualine_a = {hello}, lualine_b = {'branch'}}
-- }

EOF

" Reload the plugin think: 'plugin reload pomodoro'
nnoremap <Leader>prp :call ReloadPomodoro()<CR>" Test the plugin
" Reload the plugin think: 'plugin test pomodoro'
nnoremap <Leader>ptp :lua require("pomodoro").pomodoroStart()<CR>
