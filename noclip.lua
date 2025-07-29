Press v to activate


-- LocalScript (Place inside StarterPlayer -> StarterPlayerScripts)

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local c = workspace.CurrentCamera

local speed = 60
local selected = false
local lastUpdate = 0

-- Function to handle player movement
local function getNextMovement(deltaTime)
    local nextMove = Vector3.new()

    -- Get the camera's forward and right directions
    local cameraCFrame = c.CFrame
    local cameraForward = cameraCFrame.LookVector
    local cameraRight = cameraCFrame.RightVector

    -- Calculate movement direction based on the camera orientation
    if userInput:IsKeyDown("W") then
        nextMove = nextMove + cameraForward
    elseif userInput:IsKeyDown("S") then
        nextMove = nextMove - cameraForward
    end

    if userInput:IsKeyDown("A") then
        nextMove = nextMove - cameraRight
    elseif userInput:IsKeyDown("D") then
        nextMove = nextMove + cameraRight
    end

    return nextMove * (speed * deltaTime)
end

-- Function to toggle noclip mode
local function toggleNoClip()
    local char = player.Character
    if char then
        local humanoid = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")

        selected = not selected

        if selected then
            -- Enable noclip: Disable gravity, disable collisions
            humanoid.PlatformStand = true
            root.Anchored = true

            while selected do
                wait()
                local delta = tick() - lastUpdate
                local move = getNextMovement(delta)
                -- Move the character through objects
                local pos = root.Position
                root.CFrame = CFrame.new(pos + move)
                lastUpdate = tick()
            end

            humanoid.PlatformStand = false
            root.Anchored = false
        end
    end
end

-- Detect V key to toggle noclip
userInput.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.V then
        toggleNoClip()
    end
end)
