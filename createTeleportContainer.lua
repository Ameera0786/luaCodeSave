local player = game.Players.LocalPlayer
local GUI = player:WaitForChild("PlayerGui"):WaitForChild("GUI")
local font = Enum.Font.FredokaOne

-- Create teleportccontainer
local function createContainer() 
	local container = Instance.new("Frame")
	container.AnchorPoint = Vector2.new(0.5, 0.5)
	container.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	container.Name = "TeleportContainer"
	container.Position = UDim2.new(0.5, 0, 0.5, 0)
	container.Size = UDim2.new(0.55, 0, 0.35, 0)
	container.Visible = false

	local corner = Instance.new("UICorner")
	
	local padding = Instance.new("UIPadding")
	padding.PaddingTop = UDim.new(0, 10)
	padding.PaddingLeft = UDim.new(0, 10)
	padding.PaddingRight = UDim.new(0, 10)
	padding.PaddingBottom = UDim.new(0, 10)

	local text = Instance.new("TextLabel")
	text.AnchorPoint = Vector2.new(0.5, 0.5)
	text.Position = UDim2.new(0.5, 0, -0.1, 0)
	text.Size = UDim2.new(0.5, 0, 0.15, 0)
	text.Font = font
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	text.Text = "Teleportation Hub"
	text.TextScaled = true
	text.TextSize = 10
	
	local stroke = Instance.new("UIStroke")
	
	local corner2 = Instance.new("UICorner")
	
	local scroll = Instance.new("ScrollingFrame")
	scroll.BackgroundTransparency = 1
	scroll.Name = "ScrollingFrame"
	scroll.ScrollBarThickness = 8
	scroll.Size = UDim2.new(1, 0, 1, 0)
	
	local listLayout = Instance.new("UIListLayout")
	listLayout.Padding = UDim.new(0, 20)
	
	corner.Parent = container
	padding.Parent = container
	text.Parent = container
	stroke.Parent = text
	corner2.Parent = text
	scroll.Parent = container
	listLayout.Parent = scroll
	container.Parent = GUI
	return container
end

local function createMapTeleportor(containerScrollFrame, mapName, index) 
	-- Container frame
	local worldFrame = Instance.new("Frame")
	worldFrame.Size = UDim2.new(0.9, 0, 0.17, 0)
	worldFrame.BackgroundTransparency = 1
	
	-- Teleport button
	local btn = Instance.new("TextButton")
	btn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	btn.AnchorPoint = Vector2.new(0.5, 0.5)
	btn.Position = UDim2.new(0.9, 0, 0.5, 0)
	btn.TextXAlignment = Enum.TextXAlignment.Center
	btn.TextYAlignment = Enum.TextYAlignment.Center
	btn.Size = UDim2.new(0.3, 0, 0.5, 0)
	btn.Text = "Teleport"
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = font
	btn.TextScaled = true
	
	-- Padding, scale, stroke, and corner
	local padding = Instance.new("UIPadding")
	padding.PaddingTop = UDim.new(0.02, 0)
	padding.PaddingLeft = UDim.new(0.02, 0)
	padding.PaddingRight = UDim.new(0.02, 0)
	padding.PaddingBottom = UDim.new(0.02, 0)

	
	local scale = Instance.new("UIScale")
	scale.Scale = 0.7
	
	local stroke = Instance.new("UIStroke")

	local corner = Instance.new("UICorner")
	
	-- World icon and world number
	local imgLabel = Instance.new("ImageLabel")
	imgLabel.Position = UDim2.new(0, 0, 0, 0)
	imgLabel.BackgroundTransparency = 1
	imgLabel.Size = UDim2.new(1, 0, 1, 0)
	imgLabel.Image = "rbxassetid://138929576830797"
	imgLabel.ScaleType = Enum.ScaleType.Fit
	
	-- Set number for each world icon
	local worldLabel = Instance.new("TextLabel")
	worldLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	worldLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	worldLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	worldLabel.Size = UDim2.new(0.7, 0, 0.7, 0)
	worldLabel.TextSize = 18
	worldLabel.BackgroundTransparency = 1
	worldLabel.Font = font
	worldLabel.Text = index
	worldLabel.TextScaled = true
	
	-- Image ratio
	local ratio = Instance.new("UIAspectRatioConstraint")
	ratio.AspectRatio = 0.7
	
	-- Text label indicating world name
	local textLabel = Instance.new("TextLabel")
	textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	textLabel.Position = UDim2.new(0.35, 0, 0.5, 0)
	textLabel.Size = UDim2.new(0.6, 0, 1, 0)
	textLabel.Font = font
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextXAlignment = Enum.TextXAlignment.Center
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	textLabel.Text = mapName
	textLabel.Name = mapName.."Label"
	textLabel.TextScaled = true
	
	-- Stroke, corner, and scale
	local stroke2 = Instance.new("UIStroke")
	
	local corner2 = Instance.new("UICorner")

	local scale2 = Instance.new("UIScale")
	scale2.Scale = 0.6
	
	-- Set parents
	btn.Parent = worldFrame
	corner.Parent = btn
	padding.Parent = btn
	scale.Parent = btn
	stroke.Parent = btn
	imgLabel.Parent = worldFrame
	worldLabel.Parent = imgLabel
	ratio.Parent = imgLabel
	textLabel.Parent = worldFrame
	stroke2.Parent = textLabel
	corner2.Parent = textLabel
	scale2.Parent = textLabel
	worldFrame.Parent = containerScrollFrame
end

-- Create and populate teleport container
teleportContainer = createContainer()
maps = {"World 1", "World 2", "World 3"}
scrollingFrame = teleportContainer:WaitForChild("ScrollingFrame")
for i = 1, #maps do
	createMapTeleportor(scrollingFrame, maps[i], i)
end
