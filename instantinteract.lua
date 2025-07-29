CreateToggle("Instant Interact", function(state)
    JQHubSettings.InstantInteract = state
    if state then
        task.spawn(function()
            while JQHubSettings.InstantInteract do
                for _, tbl in ipairs(getgc(true)) do
                    if type(tbl) == "table" then
                        if rawget(tbl, "HoldTime") and type(tbl.HoldTime) == "number" and tbl.HoldTime > 0 then
                            tbl.HoldTime = 0
                        end
                        if rawget(tbl, "RequiredTime") and type(tbl.RequiredTime) == "number" and tbl.RequiredTime > 0 then
                            tbl.RequiredTime = 0
                        end
                        if rawget(tbl, "TimeRequired") and type(tbl.TimeRequired) == "number" and tbl.TimeRequired > 0 then
                            tbl.TimeRequired = 0
                        end
                    end
                end
                task.wait(0.2)
            end
        end)
    end
end)
