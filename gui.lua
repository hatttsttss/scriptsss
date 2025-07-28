-- JQHub GUI Loader
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "JQHubUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Position = UDim2.new(0.5, -125, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local UIListLayout = Instance.new("UIListLayout", Frame)
UIListLayout.Padding = UDim.new(0, 6)

local features = {
    {name = "WalkSpeed", url = "https://raw.githubusercontent.com/hatttsttss/scriptsss/main/walkspeed.lua"},
    {name = "Aimbot", url = "https://raw.githubusercontent.com/hatttsttss/scriptsss/main/aimbot.lua"},
    {name = "ESP", url = "https://raw.githubusercontent.com/hatttsttss/scriptsss/main/esp.lua"},
    {name = "Fly", url = "https://raw.githubusercontent.com/hatttsttss/scriptsss/main/fly.lua"},
    {name = "GunMods", url = "https://raw.githubusercontent.com/hatttsttss/scriptsss/main/gunmods.lua"},
    {name = "AutoFarm", url = "https://raw.githubusercontent.com/hatttsttss/scriptsss/main/autofarm.lua"},
}

for _, feature in pairs(features) do
    local Button = Instance.new("TextButton", Frame)
    Button.Size = UDim2.new(1, -12, 0, 30)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = "Load " .. feature.name
    Button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(feature.url))()
    end)
end

print("✅ JQHub GUI Loaded")

