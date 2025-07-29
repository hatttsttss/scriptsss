-- This script creates a draggable GUI with Noclip toggle and keybind support.
-- Features:
-- - Toggle button that switches between "Noclip: ON/OFF"
-- - Customizable hotkey to activate Noclip
-- - Draggable UI window
 
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
 
local noclip = false
local noclipKey = Enum.KeyCode.V
 
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
 
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
 
local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(0, 180, 0, 40)
noclipButton.Position = UDim2.new(0, 10, 0, 10)
noclipButton.Text = "Noclip: OFF"
noclipButton.Parent = frame
 
local bindText = Instance.new("TextLabel")
bindText.Size = UDim2.new(0, 180, 0, 20)
bindText.Position = UDim2.new(0, 10, 0, 60)
bindText.Text = "Bind: "..tostring(noclipKey)
bindText.Parent = frame
 
local function toggleNoclip()
    noclip = not noclip
    noclipButton.Text = "Noclip: "..(noclip and "ON" or "OFF")
end
 
noclipButton.MouseButton1Click:Connect(toggleNoclip)
 
UIS.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == noclipKey and not gameProcessed then
        toggleNoclip()
    end
end)
 
RunService.Stepped:Connect(function()
    if noclip and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
 
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
end)
