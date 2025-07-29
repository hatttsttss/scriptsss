CreateToggle("GunMods", function(state)
    if state then
        for _, obj in pairs(getgc(true)) do
            if typeof(obj) == "table" then
                if rawget(obj, "Ammo") then
                    obj.Ammo = math.huge
                    obj.StoredAmmo = math.huge
                end
                if rawget(obj, "Recoil") then
                    obj.Recoil = 0
                end
                if rawget(obj, "Spread") then
                    obj.Spread = 0
                end
                if rawget(obj, "ReloadTime") then
                    obj.ReloadTime = 0
                end
                if rawget(obj, "FireRate") then
                    obj.FireRate = 0
                end
                if rawget(obj, "Auto") ~= nil then
                    obj.Auto = true
                end
            end
        end
    end
end)
