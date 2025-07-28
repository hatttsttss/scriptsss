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
