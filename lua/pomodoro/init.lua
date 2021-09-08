local pomodoro = require('pomodoro.pomodoro')
pomodoro.PomodoroStates = require('pomodoro.pomodoro-states')

function pomodoro.setup(opts)
    opts = opts or {}
    require("pomodoro.config").setup_options(opts)
end


return pomodoro
