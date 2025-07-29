CreateToggle("Instant Interact", function(state)
    JQHubSettings.InstantInteract = state

    if state then
        local function patchHoldTime()
            for _, v in pairs(getgc(true)) do
                if typeof(v) == "table" and rawget(v, "HoldTime") and type(v.HoldTime) == "number" then
                    v.HoldTime = 0
                end
            end
        end

        patchHoldTime()
        task.spawn(function()
            while JQHubSettings.InstantInteract do
                patchHoldTime()
                task.wait(1)
            end
        end)
    end
end)
