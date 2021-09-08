return {
    add = function(fn)
        local function timedFn()
            local wait = fn()
            if (wait > 0) then
                vim.defer_fn(timedFn, wait)
            end
        end
        timedFn()
      end
}
