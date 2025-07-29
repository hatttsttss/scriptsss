-- Loop Instant Proximity Prompt By DIR (TheUberAccount_x)
local Workspace = game:GetService("Workspace")
 
local function updateProximityPrompts()
    for i, v in ipairs(Workspace:GetDescendants()) do
        if v.ClassName == "ProximityPrompt" then
            v.HoldDuration = 0.0001
        end
    end
end
 
updateProximityPrompts()
 
Workspace.DescendantAdded:Connect(function(descendant)
    if descendant.ClassName == "ProximityPrompt" then
        descendant.HoldDuration = 0.0001
    end
end)
