-- JQHub GunMods Script

local applied = false
local success = pcall(function()
    for _, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "Ammo") and rawget(v, "FireRate") then
            v.Ammo = math.huge
            v.StoredAmmo = math.huge
            v.FireRate = 0.001
            v.Recoil = 0
            applied = true
        end
    end
end)

if applied and success then
    print("[JQHub] GunMods applied successfully!")
else
    warn("[JQHub] GunMods failed or no guns found.")
end

