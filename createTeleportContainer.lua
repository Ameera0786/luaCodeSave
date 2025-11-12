local player = game.Players.LocalPlayer
local GUI = player:WaitForChild("PlayerGui"):WaitForChild("GUI")
local font = Enum.Font.FredokaOne

-- Create teleportccontainer
local function createContainer() 
	-- Create container
	local container = Instance.new("Frame")
	container.AnchorPoint = Vector2.new(0.5, 0.5)
	container.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	container.Name = "TeleportContainer"
	container.Position = UDim2.new(0.5, 0, 0.5, 0)
	container.Size = UDim2.new(0.55, 0, 0.35, 0)
	container.Visible = false

	-- Create corner and padding
	local corner = Instance.new("UICorner")
	
	local padding = Instance.new("UIPadding")
	padding.PaddingTop = UDim.new(0, 10)
	padding.PaddingLeft = UDim.new(0, 10)
	padding.PaddingRight = UDim.new(0, 10)
	padding.PaddingBottom = UDim.new(0, 10)
	
	-- Set parents
	corner.Parent = container
	padding.Parent = container
	container.Parent = GUI
	return container
end

-- Create title label
local function createTitle(container)
	-- Create label
	local title = Instance.new("TextLabel")
	title.AnchorPoint = Vector2.new(0.5, 0.5)
	title.Position = UDim2.new(0.5, 0, -0.1, 0)
	title.Size = UDim2.new(0.5, 0, 0.15, 0)
	title.Font = font
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.Text = "Teleportation Hub"
	title.TextScaled = true
	title.TextSize = 10

	-- Create stroke and corner
	local stroke = Instance.new("UIStroke")

	local corner = Instance.new("UICorner")
	
	-- Set parents
	title.Parent = container
	stroke.Parent = title
	corner.Parent = title
end

-- Create scroll
local function createScroll(container)
	-- Create scroll and layout
	local scroll = Instance.new("ScrollingFrame")
	scroll.BackgroundTransparency = 1
	scroll.Name = "ScrollingFrame"
	scroll.ScrollBarThickness = 8
	scroll.Size = UDim2.new(1, 0, 1, 0)

	local listLayout = Instance.new("UIListLayout")
	listLayout.Padding = UDim.new(0, 20)

	-- Set parents
	scroll.Parent = container
	listLayout.Parent = scroll
end

-- Create teleport button
local function createTeleportButton(frame)
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

	-- Corner, padding, scale, and stroke
	local corner = Instance.new("UICorner")

	local padding = Instance.new("UIPadding")
	padding.PaddingTop = UDim.new(0.02, 0)
	padding.PaddingLeft = UDim.new(0.02, 0)
	padding.PaddingRight = UDim.new(0.02, 0)
	padding.PaddingBottom = UDim.new(0.02, 0)

	local scale = Instance.new("UIScale")
	scale.Scale = 0.7

	local stroke = Instance.new("UIStroke")

	-- Set parents
	corner.Parent = btn
	padding.Parent = btn
	scale.Parent = btn
	stroke.Parent = btn
	btn.Parent = frame
end

-- Create world icon
local function createIcon(frame, index)
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
	
	-- Set parents
	imgLabel.Parent = frame
	worldLabel.Parent = imgLabel
	ratio.Parent = imgLabel
end

-- Create label for current world name
local function createWorldLabel(frame, mapName)
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
	local stroke = Instance.new("UIStroke")

	local corner = Instance.new("UICorner")

	local scale = Instance.new("UIScale")
	scale.Scale = 0.6

	-- Set parents
	textLabel.Parent = frame
	stroke.Parent = textLabel
	corner.Parent = textLabel
	scale.Parent = textLabel
end

-- Create world rows
local function createMapTeleportor(containerScrollFrame, mapName, index) 
	-- Container frame
	local worldFrame = Instance.new("Frame")
	worldFrame.Size = UDim2.new(0.9, 0, 0.17, 0)
	worldFrame.BackgroundTransparency = 1
	
	-- Set parent
	worldFrame.Parent = containerScrollFrame
	
	-- Helper functions to design frame
	createIcon(worldFrame, index)
	createTeleportButton(worldFrame)
	createWorldLabel(worldFrame, mapName)
end

-- Create and populate teleport container
teleportContainer = createContainer()
createTitle(teleportContainer)
createScroll(teleportContainer)
maps = {"World 1", "World 2", "World 3"}
scrollingFrame = teleportContainer:WaitForChild("ScrollingFrame")
for i = 1, #maps do
	createMapTeleportor(scrollingFrame, maps[i], i)
end
