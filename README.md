local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "El Pato Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "ElPatoHubConfig"})

local MainTab = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local BasicTab = Window:MakeTab({
Name = "Basic",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local TrollTab = Window:MakeTab({
Name = "Troll",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

MainTab:AddLabel("Você está jogando: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

local function increaseSpeed(speed)
humanoid.WalkSpeed = speed
end

local function increaseJumpPower(jumpPower)
humanoid.JumpPower = jumpPower
end

local flying = false
local function fly()
flying = not flying
if flying then
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = Vector3.new(0, 0, 0)
bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bodyVelocity.Parent = humanoidRootPart

game:GetService("RunService").Stepped:Connect(function()
if flying then
local moveDirection = humanoid.MoveDirection
humanoidRootPart.Velocity = moveDirection * 50
else
bodyVelocity:Destroy()
end
end)
end
end

local function teleportPlayer(targetName)
local target = game.Players:FindFirstChild(targetName)
if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
target.Character.HumanoidRootPart.CFrame = humanoidRootPart.CFrame
end
end

local function copyAvatar(targetName)
local target = game.Players:FindFirstChild(targetName)
if target and target.Character then

for _, item in pairs(target.Character:GetChildren()) do
if item:IsA("Accessory") or item:IsA("Clothing") then
item:Clone().Parent = character
end
end
end
end

BasicTab:AddTextbox({
Name = "Aumentar Velocidade",
Default = "",
TextDisappear = true,
Callback = function(value)
increaseSpeed(tonumber(value))
end
})

BasicTab:AddTextbox({
Name = "Aumentar Pulo",
Default = "",
TextDisappear = true,
Callback = function(value)
increaseJumpPower(tonumber(value))
end
})

BasicTab:AddButton({
Name = "Voar (Não Disponível)",
Callback = function()
fly()
end
})

TrollTab:AddTextbox({
Name = "Teletransportar Jogador",
Default = "",
TextDisappear = true,
Callback = function(value)
teleportPlayer(value)
end
})

TrollTab:AddTextbox({
Name = "Copiar Avatar (Não Disponível)",
Default = "",
TextDisappear = true,
Callback = function(value)
copyAvatar(value)
end
})

OrionLib:Init()
