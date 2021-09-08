local config = {}

config.options = {}
local defaults = {
    pomodoroMinutes = 25,
    pomodoroBreakMinutes = 5,
    pomodoroLongBreakMinutes = 15,
    updateFrequency = 1000
}

function config.setup_options(opts)
    config.options = vim.tbl_deep_extend("force", {}, defaults, opts or {})
end

return config
