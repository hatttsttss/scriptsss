-- JQHub | Final GUI with Instant Interact Fix

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local JQHubSettings = {
    WalkSpeed = false,
    Aimbot = false,
    ESP = false,
    Fly = false,
    GunMods = false,
    MarshAutoFarm = false,
    Dupe = false,
    InstantInteract = false,
    NoClip = false,
}

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "JQHub_UI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 250, 0, 400)
MainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

local Scroll = Instance.new("ScrollingFrame", MainFrame)
Scroll.Size = UDim2.new(1, 0, 1, 0)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 800)
Scroll.ScrollBarThickness = 6
Scroll.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 5)

function CreateToggle(name, callback)
    local btn = Instance.new("TextButton", Scroll)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Text = name .. ": OFF"

    local toggled = false
    btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        btn.Text = name .. ": " .. (toggled and "ON" or "OFF")
        callback(toggled)
    end)
end

function CreateButton(name, callback)
    local btn = Instance.new("TextButton", Scroll)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Text = name
    btn.MouseButton1Click:Connect(callback)
end

-- ========== TOGGLES ==========
CreateToggle("WalkSpeed", function(state)
    JQHubSettings.WalkSpeed = state
    if state then
        spawn(function()
            while JQHubSettings.WalkSpeed do
                local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if h then h.WalkSpeed = 22 end
                task.wait(1)
            end
        end)
    end
end)

CreateToggle("Aimbot", function(state)
    JQHubSettings.Aimbot = state
    if state then
        spawn(function()
            local cam = workspace.CurrentCamera
            local function getClosest()
                local closest, dist = nil, math.huge
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        local pos = cam:WorldToViewportPoint(p.Character.Head.Position)
                        local mag = (Vector2.new(pos.X, pos.Y) - cam.ViewportSize/2).Magnitude
                        if mag < dist then
                            dist = mag
                            closest = p
                        end
                    end
                end
                return closest
            end
            RunService.RenderStepped:Connect(function()
                if not JQHubSettings.Aimbot then return end
                local target = getClosest()
                if target and target.Character:FindFirstChild("Head") then
                    cam.CFrame = CFrame.new(cam.CFrame.Position, target.Character.Head.Position)
                end
            end)
        end)
    end
end)

CreateToggle("ESP", function(state)
    JQHubSettings.ESP = state
    if state then
        local function CreateESPBox(plr)
            if plr == LocalPlayer then return end
            if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end
            if plr.Character:FindFirstChild("ESPBox") then return end

            local box = Instance.new("BoxHandleAdornment")
            box.Name = "ESPBox"
            box.Size = Vector3.new(4, 6, 2)
            box.Adornee = plr.Character:FindFirstChild("HumanoidRootPart")
            box.Color3 = Color3.fromRGB(0, 255, 0)
            box.AlwaysOnTop = true
            box.ZIndex = 5
            box.Transparency = 0.3
            box.Parent = plr.Character
        end

        for _, p in ipairs(Players:GetPlayers()) do
            CreateESPBox(p)
        end

        Players.PlayerAdded:Connect(function(p)
            p.CharacterAdded:Connect(function()
                task.wait(1)
                CreateESPBox(p)
            end)
        end)

        RunService.RenderStepped:Connect(function()
            if not JQHubSettings.ESP then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p.Character and p.Character:FindFirstChild("ESPBox") then
                        p.Character.ESPBox:Destroy()
                    end
                end
            end
        end)
    else
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("ESPBox") then
                p.Character.ESPBox:Destroy()
            end
        end
    end
end)

CreateToggle("Fly", function(state)
    if state then
        loadstring(game:HttpGet("https://pastebin.com/raw/s3pVWMaA"))()
    end
end)

CreateToggle("GunMods", function(state)
    if state then
        for _,v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "Ammo") then
                v.Ammo = math.huge
                v.StoredAmmo = math.huge
                v.FireRate = 0
            end
        end
    end
end)

CreateToggle("Marshmello AutoFarm", function(state)
    JQHubSettings.MarshAutoFarm = state
    if state then
        spawn(function()
            while JQHubSettings.MarshAutoFarm do
                local npc = workspace:FindFirstChild("Marshmello")
                if npc and LocalPlayer.Character then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                end
                task.wait(1)
            end
        end)
    end
end)

CreateToggle("Dupe", function(state)
    if state then
        fireclickdetector(workspace:FindFirstChild("DupeTrigger"):FindFirstChildOfClass("ClickDetector"))
    end
end)

-- ✅ UPDATED INSTANT INTERACT
CreateToggle("Instant Interact", function(state)
    JQHubSettings.InstantInteract = state
    if state then
        local function patch()
            for _, obj in pairs(getgc(true)) do
                if typeof(obj) == "table" and rawget(obj, "HoldTime") then
                    if type(obj.HoldTime) == "number" then
                        obj.HoldTime = 0
                    end
                end
            end
        end
        task.spawn(function()
            while JQHubSettings.InstantInteract do
                patch()
                task.wait(0.1) -- faster loop
            end
        end)
    end
end)

-- Noclip GitHub Loader
local NoClip = loadstring(game:HttpGet("https://raw.githubusercontent.com/hatttsttss/scriptsss/main/noclip.lua"))()
CreateToggle("NoClip", function(state)
    if state then
        NoClip.Enable()
    else
        NoClip.Disable()
    end
end)

-- ========== TELEPORT BUTTONS ==========
local locations = {
    ["Dealership"] = Vector3.new(-125, 3, 550),
    ["Gun Store"] = Vector3.new(200, 3, 680),
    ["Box Job"] = Vector3.new(85, 3, 480),
    ["Bank"] = Vector3.new(300, 3, 740),
    ["Card Seller"] = Vector3.new(-50, 3, 600),
}

for name, pos in pairs(locations) do
    CreateButton("TP to " .. name, function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(pos)
        end
    end)
end

print("✅ JQHub Loaded with Instant Interact Fix")
