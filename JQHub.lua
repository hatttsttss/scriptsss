-- JQHub (WalkSpeed 22 - Debug Mode)

print("📦 JQHub loading...")

pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "JQHub",
        Text = "✅ Minimal script loaded",
        Duration = 5
    })
end)

print("✅ Notification attempted")

-- WalkSpeed Feature
local settings = {
    WalkSpeed = 22
}

spawn(function()
    local player = game.Players.LocalPlayer
    print("👤 Player loaded:", player)

    local function applySpeed()
        local char = player.Character or player.CharacterAdded:Wait()
        print("🧍 Character found:", char)

        local humanoid = char:WaitForChild("Humanoid", 5)
        print("💡 Humanoid:", humanoid)

        if humanoid then
            humanoid.WalkSpeed = settings.WalkSpeed
            print("🏃 WalkSpeed set to", settings.WalkSpeed)

            pcall(function()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "JQHub",
                    Text = "🏃 WalkSpeed set to " .. settings.WalkSpeed,
                    Duration = 4
                })
            end)
        else
            warn("❌ Humanoid not found")
        end
    end

    applySpeed()
    player.CharacterAdded:Connect(applySpeed)
end)
-- JQHub Button GUI Loader

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local features = {
    {name = "WalkSpeed", file = "walkspeed.lua"},
    {name = "Aimbot", file = "aimbot.lua"},
    {name = "ESP", file = "esp.lua"},
    {name = "Fly", file = "fly.lua"},
    {name = "GunMods", file = "gunmods.lua"},
    {name = "AutoFarm", file = "autofarm.lua"},
}

local githubBaseURL = "https://raw.githubusercontent.com/hatttsttss/scriptsss/main/"

-- Setup UI
ScreenGui.Parent = game:GetService("CoreGui")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 180, 0, #features * 45 + 10)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0

for i, feature in ipairs(features) do
    local btn = Instance.new("TextButton")
    btn.Parent = Frame
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 45 + 5)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Text = "Load " .. feature.name
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18

    btn.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(githubBaseURL .. feature.file))()
        end)
        if success then
            print("[JQHub] Loaded: " .. feature.name)
        else
            warn("[JQHub] Failed to load: " .. feature.name .. " | " .. tostring(err))
        end
    end)
end

print("✅ JQHub GUI loaded!")
