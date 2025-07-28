-- JQHub | Scrollable GUI with Toggles

local Features = {
    {Name = "WalkSpeed", ToggleKey = "WalkSpeed"},
    {Name = "Aimbot", ToggleKey = "Aimbot"},
    {Name = "ESP", ToggleKey = "ESP"},
    {Name = "Fly", ToggleKey = "Fly"},
    {Name = "GunMods", ToggleKey = "GunMods"},
    {Name = "AutoFarm", ToggleKey = "AutoFarm"},
}

getgenv().JQHubSettings = getgenv().JQHubSettings or {
    WalkSpeed = false,
    Aimbot = false,
    ESP = false,
    Fly = false,
    GunMods = false,
    AutoFarm = false
}

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "JQHub_UI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0

local Scroller = Instance.new("ScrollingFrame", MainFrame)
Scroller.Size = UDim2.new(1, 0, 1, 0)
Scroller.CanvasSize = UDim2.new(0, 0, 0, #Features * 45 + 10)
Scroller.ScrollBarThickness = 6
Scroller.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", Scroller)
UIListLayout.Padding = UDim.new(0, 5)

for _, feature in pairs(Features) do
    local btn = Instance.new("TextButton", Scroller)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Text = feature.Name .. ": OFF"

    btn.MouseButton1Click:Connect(function()
        local key = feature.ToggleKey
        JQHubSettings[key] = not JQHubSettings[key]
        btn.Text = feature.Name .. ": " .. (JQHubSettings[key] and "ON" or "OFF")

        if key == "WalkSpeed" then
            if JQHubSettings.WalkSpeed then
                spawn(function()
                    while JQHubSettings.WalkSpeed do
                        local h = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if h then h.WalkSpeed = 22 end
                        task.wait(1)
                    end
                end)
            end
        elseif key == "Aimbot" and JQHubSettings.Aimbot then
            spawn(function()
                local cam = workspace.CurrentCamera
                local lp = game.Players.LocalPlayer
                local function getClosest()
                    local closest, dist = nil, math.huge
                    for _, p in pairs(game.Players:GetPlayers()) do
                        if p ~= lp and p.Character and p.Character:FindFirstChild("Head") then
                            local pos = cam:WorldToViewportPoint(p.Character.Head.Position)
                            local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)).Magnitude
                            if mag < dist then
                                dist = mag
                                closest = p
                            end
                        end
                    end
                    return closest
                end
                game:GetService("RunService").RenderStepped:Connect(function()
                    if not JQHubSettings.Aimbot then return end
                    local target = getClosest()
                    if target and target.Character:FindFirstChild("Head") then
                        cam.CFrame = CFrame.new(cam.CFrame.Position, target.Character.Head.Position)
                    end
                end)
            end)
        elseif key == "ESP" and JQHubSettings.ESP then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/teslamly2424/scripts/main/esp.lua"))()
        elseif key == "Fly" and JQHubSettings.Fly then
            loadstring(game:HttpGet("https://pastebin.com/raw/s3pVWMaA"))()
        elseif key == "GunMods" and JQHubSettings.GunMods then
            for _,v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v, "Ammo") then
                    v.Ammo = math.huge
                    v.StoredAmmo = math.huge
                    v.FireRate = 0.
