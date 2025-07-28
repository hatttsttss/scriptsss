-- JQHub | All-in-One Toggle GUI

local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- GitHub base URL
local baseURL = "https://raw.githubusercontent.com/hatttsttss/scriptsss/main/"

-- Features & scripts
local features = {
    { name = "WalkSpeed", file = "walkspeed.lua" },
    { name = "Aimbot", file = "aimbot.lua" },
    { name = "ESP", file = "esp.lua" },
    { name = "Fly", file = "fly.lua" },
    { name = "GunMods", file = "gunmods.lua" },
    { name = "AutoFarm", file = "autofarm.lua" },
}

-- GUI Setup
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "JQHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 45 + (#features * 40))
frame.Position = UDim2.new(0.05, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "🌀 JQHub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Toggle states
local toggles = {}

-- Create toggle buttons
for i, feature in ipairs(features) do
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(0, 200, 0, 30)
    button.Position = UDim2.new(0, 10, 0, 35 + ((i - 1) * 35))
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.Text = "Toggle " .. feature.name .. " [OFF]"

    toggles[feature.name] = false

    button.MouseButton1Click:Connect(function()
        toggles[feature.name] = not toggles[feature.name]
        button.Text = "Toggle " .. feature.name .. (toggles[feature.name] and " [ON]" or " [OFF]")
        button.BackgroundColor3 = toggles[feature.name] and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(50, 50, 50)

        if toggles[feature.name] then
            local success, err = pcall(function()
                loadstring(game:HttpGet(baseURL .. feature.file))()
            end)
            if not success then
                warn("[JQHub] Failed to load " .. feature.name .. ": " .. tostring(err))
            end
        end
    end)
end

print("✅ JQHub loaded with GUI toggles")
