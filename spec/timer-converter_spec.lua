local timeConverter = require("../lua/pomodoro/time-converter")
require("busted")

describe("timer-converter", function()
  describe("-> convert seconds to minutes and seconds", function()
    local function getMappingTable()
        return {
                {seconds = 60, expectedResult = "01:00"},
                {seconds = 61, expectedResult = "01:01"},
                {seconds = 140, expectedResult = "02:20"},
                {seconds = 25*60, expectedResult = "25:00"},
            }
    end

    it("-> validate mapping table", function()
        local table = getMappingTable()
        for index, value in ipairs(table) do
            local seconds = value.seconds
            local expectedResult = value.expectedResult
            local result = timeConverter.ConvertSecondsToMinutesAndSeconds(seconds)
            assert.are.equal(expectedResult, result)
        end
    end)
  end)
end)
