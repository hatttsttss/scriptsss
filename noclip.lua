-- MIDNIGHTHUB NOCLIP (REPLACEMENT)
local NoClipConn
CreateToggle("NoClip", function(state)
    JQHubSettings.NoClip = state
    if state then
        NoClipConn = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide == true then
                        part.CanCollide = false
                    end
                end
                char.Humanoid:ChangeState(11)
            end
        end)
    else
        if NoClipConn then
            NoClipConn:Disconnect()
            NoClipConn = nil
        end
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)
