
-- Remove highlights from leaving players
Players.PlayerRemoving:Connect(function(playerRemoved)
    local character = playerRemoved.Character
    if character then
        removeHighlightFromCharacter(character)
    end
end)
 
-- The following code may be deleted if you are using a custom GUI library. 
 
-- Toggle ESP Button Text based on variable status
toggleButton.MouseButton1Click:Connect(function()
    _G.ESPToggle = not _G.ESPToggle
    if _G.ESPToggle then
        toggleButton.Text = "ESP ON"
    else
        toggleButton.Text = "ESP OFF"
    end
end)
 
-- Initial button text
if _G.ESPToggle then
    toggleButton.Text = "ESP ON"
else
    toggleButton.Text = "ESP OFF"
end
 
-- Keybind to toggle GUI visibility
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.H and not gameProcessed then -- Change Enum.KeyCode.H to another key if you want to, e.g. Enum.KeyCode.P for "P" Key.
        mainFrame.Visible = not mainFrame.Visible
    end
end)
