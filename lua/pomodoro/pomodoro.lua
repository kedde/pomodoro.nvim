local timer = require("pomodoro.timer")
local config = require("pomodoro.config")
PomodoroStates = require("pomodoro.pomodoro-states") -- needs to be global because of callback

local M = {}

local numberOfPomodoros = 0
local currentTimeLeftInSec = 0

local pomodoroStatus = PomodoroStates.Stopped

-- public methods
function M.pomodoroStatus()
    return M.status()
end

function M.pomodoroReset()
    currentTimeLeftInSec = 0
    numberOfPomodoros = 0
    pomodoroStatus = PomodoroStates.Stopped
end

function M.pomodoroStop()
    M.stopPomodoro()
end

function M.pomodoroStart()
    M.startPomodoro()
end


local count = 0
-- TODO move the following to separate module
-- should be private methods
function M.startPomodoro()
    pomodoroStatus = PomodoroStates.Pomodoro
    timer = require("pomodoro.timer")
    currentTimeLeftInSec = config.options.pomodoroMinutes * 60
    timer.add(
        function()
            if pomodoroStatus == PomodoroStates.Pomodoro then
                if currentTimeLeftInSec > 0 then
                    currentTimeLeftInSec = currentTimeLeftInSec - 1
                    M.notify()
                    return config.options.updateFrequency
                else
                    pomodoroStatus = PomodoroStates.Break
                    numberOfPomodoros = numberOfPomodoros + 1
                    currentTimeLeftInSec = config.options.pomodoroBreakMinutes * 60
                    local remainder = math.fmod(numberOfPomodoros, 3)
                    if (remainder == 0) then
                        currentTimeLeftInSec = config.options.pomodoroLongBreakMinutes * 60
                    end

                    M.notify()
                    return config.options.updateFrequency
                end
            elseif pomodoroStatus == PomodoroStates.Break then
                if currentTimeLeftInSec > 0 then
                    currentTimeLeftInSec = currentTimeLeftInSec - 1
                    M.notify()
                    return config.options.updateFrequency
                else
                    M.stopPomodoro()
                    M.notify()
                    return -1
                end
            else
                count = count + 1
                print("stoppped - still being called " .. count)
                M.notify()
                return -1
            end
            print("not everything returns??? ")
            return 1000
        end
    )
end

function M.stopPomodoro()
    pomodoroStatus = PomodoroStates.Stopped
    print("stopping pomodoro " .. count)
    count = count + 1
    currentTimeLeftInSec = 0
    timer = nil
end

function M.notify()
    if config.options.notifyCallBack ~= nil then
        config.options.notifyCallBack(M.status())
    end
end

function M.status()
    return {
        status = pomodoroStatus,
        timeLeftInSeconds = currentTimeLeftInSec,
        numberOfPomodoros = numberOfPomodoros
    }
end

return M
