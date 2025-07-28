-- JQHub | Roblox Script Hub

-- Configuration
getgenv().JQHubSettings = {
    Aimbot = true,
    WalkSpeed = 100,
    AutoFarm = false,
    GunMods = true,
    Fly = false,
    ESP = true,
}

-- Aimbot
if JQHubSettings.Aimbot then
    spawn(function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local Camera = workspace.CurrentCamera

        local function getClosestPlayer()
            local closest, dist = nil, math.huge
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local pos = Camera:WorldToViewportPoint(player.Character.Head.Position)
                    local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if mag < dist then
                        dist = mag
                        closest = player
                    end
                end
            end
            return closest
        end

        game:GetService("RunService").RenderStepped:Connect(function()
            local target = getClosestPlayer()
            if target and target.Character and target.Character:FindFirstChild("Head") then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
            end
        end)
    end)
end

-- WalkSpeed
spawn(function()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    char:WaitForChild("Humanoid").WalkSpeed = JQHubSettings.WalkSpeed
end)

-- Fly
if JQHubSettings.Fly then
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/s3pVWMaA"))()
    end)
end

-- ESP
if JQHubSettings.ESP then
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/teslamly2424/scripts/main/esp.lua"))()
    end)
end

-- AutoFarm (basic placeholder)
if JQHubSettings.AutoFarm then
    spawn(function()
        while wait(2) do
            print("[JQHub] AutoFarm running...")
        end
    end)
end

-- Gun Mods
if JQHubSettings.GunMods then
    spawn(function()
        for _,v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "Ammo") then
                v.Ammo = math.huge
                v.StoredAmmo = math.huge
                v.FireRate = 0.001
                v.Recoil = 0
            end
        end
    end)
end

print("✅ JQHub fully loaded!")
