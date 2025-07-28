-- WalkSpeed Script (JQHub)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid", 5)
if humanoid then
    humanoid.WalkSpeed = 30
    game.StarterGui:SetCore("SendNotification", {
        Title = "JQHub",
        Text = "🏃 WalkSpeed set to 30",
        Duration = 4
    })
end

