for _,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "HoldTime") then
        v.HoldTime = 0
    end
end

