local player = game.Players.LocalPlayer
local GUI = player:WaitForChild("PlayerGui"):WaitForChild("GUI")
local font = Enum.Font.FredokaOne

-- Create a container for the stats
local function createContainer()
	-- Stats container
	local container = Instance.new("Frame")
	container.Name = "StatsContainer"
	container.BackgroundTransparency = 1
	container.Position = UDim2.new(0, 0, 0.13, 0)
	container.Size = UDim2.new(0.14, 0, 0.127, 0)
	
	-- UIGridLayout and scale
	local gridLayout = Instance.new("UIGridLayout")
	gridLayout.CellPadding = UDim2.new(0.6, 0, 0.6, 0)
	gridLayout.CellSize = UDim2.new(1, 0, 1, 0)
	gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	local scale = Instance.new("UIScale")
	scale.Scale = 0.28
	
	-- Set parents
	scale.Parent = container
	gridLayout.Parent = container
	container.Parent = GUI
	
	return container
end

-- Create a display for each stat
local function createDisplay(container, name, image, color)
	-- Create display container
	local displayContainer = Instance.new("Frame")
	displayContainer.BackgroundTransparency = 1
	displayContainer.Name = name.."Display"
	displayContainer.Position = UDim2.new(0, 0, 0, 0)
	displayContainer.Size = UDim2.new(1, 0, 1, 0)
	
	-- UIGridLayout
	local gridLayout = Instance.new("UIGridLayout")
	gridLayout.CellPadding = UDim2.new(0.05, 0, 0.05, 0)
	gridLayout.CellSize = UDim2.new(1, 0, 1, 0)
	gridLayout.FillDirection = Enum.FillDirection.Vertical
	
	-- Create image
	local displayImg = Instance.new("ImageLabel")
	displayImg.BackgroundTransparency = 1
	displayImg.Position = UDim2.new(0, 0, 0, 0)
	displayImg.Size = UDim2.new(1, 0, 1, 0)
	displayImg.Name = name.."Image"
	displayImg.Image = image
	displayImg.ScaleType = Enum.ScaleType.Fit
	
	local ratio = Instance.new("UIAspectRatioConstraint")
	ratio.AspectRatio = 0.8
	
	-- Create label
	local label = Instance.new("TextLabel")
	label.AnchorPoint = Vector2.new(0, 1)
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Size = UDim2.new(1, 0, 0.25, 0)
	label.TextSize = 35
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Name = name.."Label"
	label.Font = font
	label.Text = name..":"
	label.TextColor3 = color
	
	local stroke = Instance.new("UIStroke")
	
	-- Set parents
	stroke.Parent = label
	label.Parent = displayContainer
	ratio.Parent = displayImg
	displayImg.Parent = displayContainer
	gridLayout.Parent = displayContainer
	displayContainer.Parent = container
end

-- Create and populate stats container
container = createContainer()
names = {'Energy', "DPS", "Coin"}
imagePics = {"rbxassetid://95797647841933", "rbxassetid://94841436540782", "rbxassetid://90028869046346"}
textColors = {Color3.fromRGB(0, 0, 127), Color3.fromRGB(170, 0, 0), Color3.fromRGB(255, 170, 0)}
for i = 1, #names do
	createDisplay(container, names[i], imagePics[i], textColors[i])
end
