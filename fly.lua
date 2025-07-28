-- JQHub Fly Script

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = char:WaitForChild("HumanoidRootPart")

local flying = true
local speed = 50
local bodyGyro = Instance.new("BodyGyro")
local bodyVelocity = Instance.new("BodyVelocity")

bodyGyro.P = 9e4
bodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bodyGyro.cframe = humanoidRootPart.CFrame
bodyGyro.Parent = humanoidRootPart

bodyVelocity.velocity = Vector3.new(0, 0, 0)
bodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
bodyVelocity.Parent = humanoidRootPart

local UIS = game:GetService("UserInputService")
local direction = Vector3.zero

local function updateVelocity()
	while flying do
		local camCF = workspace.CurrentCamera.CFrame
		bodyGyro.CFrame = camCF
		bodyVelocity.Velocity = (camCF.lookVector * direction.Z + camCF.RightVector * direction.X + camCF.UpVector * direction.Y) * speed
		task.wait()
	end
end

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.W then direction = Vector3.new(direction.X, direction.Y, -1) end
	if input.KeyCode == Enum.KeyCode.S then direction = Vector3.new(direction.X, direction.Y, 1) end
	if input.KeyCode == Enum.KeyCode.A then direction = Vector3.new(-1, direction.Y, direction.Z) end
	if input.KeyCode == Enum.KeyCode.D then direction = Vector3.new(1, direction.Y, direction.Z) end
	if input.KeyCode == Enum.KeyCode.Space then direction = Vector3.new(direction.X, 1, direction.Z) end
	if input.KeyCode == Enum.KeyCode.LeftControl then direction = Vector3.new(direction.X, -1, direction.Z) end
end)

UIS.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S then direction = Vector3.new(direction.X, direction.Y, 0) end
	if input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then direction = Vector3.new(0, direction.Y, direction.Z) end
	if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftControl then direction = Vector3.new(direction.X, 0, direction.Z) end
end)

task.spawn(updateVelocity)
print("[JQHub] Fly enabled (WASD + Space/Control)")
