-- Simple ESP by JQHub
local function createESP(plr)
    if plr == game.Players.LocalPlayer then return end
    local char = plr.Character or plr.CharacterAdded:Wait()
    local box = Instance.new("BillboardGui", char:WaitForChild("Head"))
    box.Name = "JQ_ESP"
    box.Size = UDim2.new(4, 0, 0.5, 0)
    box.AlwaysOnTop = true
    local label = Instance.new("TextLabel", box)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = plr.Name
    label.TextColor3 = Color3.new(1, 0, 0)
    label.TextStrokeTransparency = 0.5
    label.TextScaled = true
end

for _, plr in pairs(game.Players:GetPlayers()) do
    if not plr.Character or not plr.Character:FindFirstChild("Head") then
        plr.CharacterAdded:Wait()
    end
    createESP(plr)
end

game.Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(1)
        createESP(plr)
    end)
end)
