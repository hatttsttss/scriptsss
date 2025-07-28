-- Gun Mods (JQHub)
for _,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "Ammo") then
        v.Ammo = math.huge
        v.StoredAmmo = math.huge
        v.FireRate = 0.001
        v.Recoil = 0
    end
end

