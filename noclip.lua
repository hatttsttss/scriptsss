-- 🧱 MidnightHub NoClip (Standalone)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local noclipEnabled = true -- Set to false to disable

if noclipEnabled then
    RunService.Stepped:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end
