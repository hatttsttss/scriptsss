-- JQHub WalkSpeed Script

local player = game.Players.LocalPlayer
local speed = 22 -- You can change this number if you want faster or slower

local function applySpeed()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.WalkSpeed = speed
        print("[JQHub] WalkSpeed set to:", speed)
    else
        warn("[JQHub] Humanoid not found")
    end
end

-- Apply immediately and on respawn
applySpeed()
player.CharacterAdded:Connect(applySpeed)

