CreateToggle("ESP", function(state)
    JQHubSettings.ESP = state

    if state then
        local function CreateESPBox(plr)
            if plr == LocalPlayer then return end
            if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end
            if plr.Character:FindFirstChild("ESPBox") then return end

            local box = Instance.new("BoxHandleAdornment")
            box.Name = "ESPBox"
            box.Size = Vector3.new(4, 6, 2)
            box.Adornee = plr.Character:FindFirstChild("HumanoidRootPart")
            box.Color3 = Color3.fromRGB(0, 255, 0)
            box.AlwaysOnTop = true
            box.ZIndex = 5
            box.Transparency = 0.3
            box.Parent = plr.Character
        end

        for _, p in ipairs(Players:GetPlayers()) do
            CreateESPBox(p)
        end

        Players.PlayerAdded:Connect(function(p)
            p.CharacterAdded:Connect(function()
                task.wait(1)
                CreateESPBox(p)
            end)
        end)

        RunService.RenderStepped:Connect(function()
            if not JQHubSettings.ESP then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p.Character and p.Character:FindFirstChild("ESPBox") then
                        p.Character.ESPBox:Destroy()
                    end
                end
            end
        end)
    else
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("ESPBox") then
                p.Character.ESPBox:Destroy()
            end
        end
    end
end)
