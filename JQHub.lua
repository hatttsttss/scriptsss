-- JQHub | South Bronx | All-in-One Script

-- Aimbot
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

-- ESP
spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/teslamly2424/scripts/main/esp.lua"))()
end)

-- Fly
spawn(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/s3pVWMaA"))()
end)

-- WalkSpeed
spawn(function()
    local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    char:WaitForChild("Humanoid").WalkSpeed = 100
end)

-- AutoFarm (placeholder logic)
spawn(function()
    while true do
        wait(2)
        print("AutoFarm tick... (add real farm logic here)")
        -- Add farming logic here
    end
end)

-- Gun Mods (placeholder logic)
spawn(function()
    for _,v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "Ammo") then
            v.Ammo = math.huge
            v.StoredAmmo = math.huge
            v.FireRate = 0.001
            v.Recoil = 0
            print("Applied gun mods!")
        end
    end
end)

print("✅ JQHub Loaded: All features active!")
