-- ✅ Clean JQHub Base Loader (Crash-Free)

print("[JQHub] Initializing...")

getgenv().JQHubSettings = {
    Aimbot = false,
    WalkSpeed = 75,
    AutoFarm = false,
    GunMods = false,
    Fly = false,
    ESP = false,
}

-- Only run WalkSpeed (safe baseline)
spawn(function()
    local plr = game.Players.LocalPlayer
    local function setSpeed()
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid", 5)
        if hum then hum.WalkSpeed = JQHubSettings.WalkSpeed end
    end
    setSpeed()
    plr.CharacterAdded:Connect(setSpeed)
end)

print("[JQHub] Loaded without crashes.")
