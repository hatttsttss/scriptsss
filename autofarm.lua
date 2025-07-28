-- Marshmello AutoFarm
local player = game.Players.LocalPlayer

while true do
    wait(1)
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent then
            firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end

