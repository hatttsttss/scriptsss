-- JQHub ESP Script

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function createESPBox(player)
    if player == LocalPlayer then return end
    local character = player.Character
    if not character then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "JQHubESP"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Adornee = character
    highlight.Parent = character
end

-- Apply ESP to all players
for _, player in ipairs(Players:GetPlayers()) do
    createESPBox(player)
end

-- Update ESP when new characters load
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        createESPBox(player)
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        local esp = player.Character:FindFirstChild("JQHubESP")
        if esp then esp:Destroy() end
    end
end)

print("[JQHub] ESP enabled")

