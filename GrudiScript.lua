```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Universal Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "UniversalHubConfig"})

local MainTab = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local function increaseSpeed(speed)
humanoid.WalkSpeed = speed
end

local function increaseJumpPower(jumpPower)
humanoid.JumpPower = jumpPower
end

local function becomeImmortal()
humanoid.Health = math.huge
humanoid:GetPropertyChangedSignal("Health"):Connect(function()
humanoid.Health = math.huge
end)
end

local function noclip()
game:GetService("RunService").Stepped:Connect(function()
for _, part in pairs(character:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
end
end
end)
end

local function teleportPlayer(targetName)
local target = game.Players:FindFirstChild(targetName)
if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
humanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
end
end

MainTab:AddSlider({
Name = "Increase Speed",
Min = 16,
Max = 200,
Default = 16,
Color = Color3.fromRGB(255, 255, 255),
Increment = 1,
ValueName = "Speed",
Callback = function(value)
increaseSpeed(value)
end
})

MainTab:AddSlider({
Name = "Increase Jump Power",
Min = 50,
Max = 300,
Default = 50,
Color = Color3.fromRGB(255, 255, 255),
Increment = 1,
ValueName = "Jump Power",
Callback = function(value)
increaseJumpPower(value)
end
})

MainTab:AddButton({
Name = "Become Immortal",
Callback = function()
becomeImmortal()
end
})

MainTab:AddButton({
Name = "Noclip",
Callback = function()
noclip()
end
})

```
