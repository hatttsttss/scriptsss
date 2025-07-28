-- JQHub | All-in-One GUI (Toggle Edition)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Feature States
getgenv().JQHubFeatures = {
    WalkSpeed = false,
    Aimbot = false,
    ESP = false,
    Fly = false,
    GunMods = false,
    AutoFarm = false,
}

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Position = UDim2.new(0.05, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Name = "JQHubUI"

-- Toggle Buttons
local features = {"WalkSpeed", "Aimbot", "ESP", "Fly", "GunMods", "AutoFarm"}

for i, name in ipairs(features) do
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(1, -20, 0, 35)
    btn.Position = UDim2.new(0, 10, 0, (i - 1) * 40 + 10)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Text = name .. ": OFF"

    btn.MouseButton1Click:Connect(function()
        local state = not JQHubFeatures[name]
        JQHubFeatures[name] = state
        btn.Text = name .. ": " .. (state and "ON" or "OFF")
        print("[JQHub] " .. name .. " is now " .. (state and "ENABLED" or "DISABLED"))
    end)
end

-- Feature Logic
-- Aimbot
RunService.RenderStepped:Connect(function()
    if not JQHubFeatures.Aimbot then return end
    local closest, dist = nil, math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local pos = Camera:WorldToViewportPoint(player.Character.Head.Position)
            local mag = (Vector2.new(pos.X, pos.Y) - Camera.ViewportSize/2).Magnitude
            if mag < dist then
                dist = mag
                closest = player
            end
        end
    end
    if closest and closest.Character and closest.Character:FindFirstChild("Head") then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Character.Head.Position)
    end
end)

-- WalkSpeed
LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    while true do
        if JQHubFeatures.WalkSpeed then
            pcall(function()
                char.Humanoid.WalkSpeed = 75
            end)
        else
            pcall(function()
                char.Humanoid.WalkSpeed = 16
            end)
        end
        task.wait(1)
    end
end)

-- Fly
local flying = false
RunService.RenderStepped:Connect(function()
    if JQHubFeatures.Fly and not flying then
        flying = true
        loadstring(game:HttpGet("https://pastebin.com/raw/s3pVWMaA"))()
    elseif not JQHubFeatures.Fly and flying then
        -- no easy universal "stop fly" — recommend reload char
        flying = false
    end
end)

-- ESP
local espLoaded = false
RunService.RenderStepped:Connect(function()
    if JQHubFeatures.ESP and not espLoaded then
        espLoaded = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/teslamly2424/scripts/main/esp.lua"))()
    end
end)

-- GunMods
RunService.RenderStepped:Connect(function()
    if JQHubFeatures.GunMods then
        for _,v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "Ammo") then
                v.Ammo = math.huge
                v.StoredAmmo = math.huge
                v.FireRate = 0.001
                v.Recoil = 0
            end
        end
    end
end)

-- AutoFarm (placeholder)
task.spawn(function()
    while true do
        if JQHubFeatures.AutoFarm then
            print("[JQHub] Farming tick...")
            -- add autofarm logic here
        end
        task.wait(3)
    end
end)

print("✅ JQHub toggle GUI loaded!")
