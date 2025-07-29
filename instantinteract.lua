-- Instant Interact Script
for _, v in pairs(getgc(true)) do
    if typeof(v) == "table" and rawget(v, "HoldTime") then
        v.HoldTime = 0
    end
end
