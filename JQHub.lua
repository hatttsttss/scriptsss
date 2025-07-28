-- JQHub (Minimal Test + WalkSpeed 22)

pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "JQHub",
        Text = "✅ Minimal script loaded",
        Duration = 5
    })
end)

print("✅ JQHub minimal test script is running!")

-- WalkSpeed Feature
local settings = {
    WalkSpeed = 22
}

spawn(function()
    local player = game.Players.LocalPlayer
    local function applySpeed()
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid.WalkSpeed = settings.WalkSpeed
            pcall(function()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "JQHub",
                    Text = "🏃 WalkSpeed set to " .. settings.WalkSpeed,
                    Duration = 4
                })
            end)
        else
            warn("Humanoid not found")
        end
    end

    applySpeed()
    player.CharacterAdded:Connect(applySpeed)
end)
