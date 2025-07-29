local function fastInteract()
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "table" and rawget(v, "HoldTime") and typeof(v.HoldTime) == "number" then
            v.HoldTime = 0
        end
    end
end

task.spawn(function()
    while true do
        if _G.InstantInteractEnabled then
            fastInteract()
        end
        task.wait(0.25)
    end
end)
