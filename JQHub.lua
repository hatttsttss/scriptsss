-- JQHub (Minimal Test)

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
    WalkSpeed = 75
}

spawn(function()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    char:WaitForChild("Humanoid").WalkSpeed = settings.WalkSpeed
end)
