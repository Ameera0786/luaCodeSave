local player = game.Players.LocalPlayer
local GUI = player:WaitForChild("PlayerGui"):WaitForChild("GUI")
local font = Enum.Font.FredokaOne

-- Create a container for the controls
local function createContainer()
	-- Control container
	local container = Instance.new("Frame")
	container.Name = "ControlContainer"
	container.BackgroundTransparency = 1
	container.Position = UDim2.new(0, 0, 0.3, 0)
	container.Size = UDim2.new(0.25, 0, 0.25, 0)
	
	-- UIGridLayout and scale
	local gridLayout = Instance.new("UIGridLayout")
	gridLayout.CellSize = UDim2.new(0.25, 0, 0.45, 0)
	gridLayout.CellPadding = UDim2.new(0.02, 0, 0.1, 0)
	gridLayout.FillDirection = Enum.FillDirection.Horizontal
	gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	local scale = Instance.new("UIScale")
	scale.Scale = 0.5

	-- Set parents
	gridLayout.Parent = container
	scale.Parent = container	
	container.Parent = GUI
	
	return container
end

-- Create button
local function createButton(container, name, index, image)
	-- Create button
	local btn = Instance.new("ImageButton")
	btn.BackgroundTransparency = 1
	btn.Name = name.."Button"
	btn.LayoutOrder = index
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.Image = image
	btn.ScaleType = Enum.ScaleType.Fit
	
	-- Create label
	local label = Instance.new("TextLabel")
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0.5, 0, 1, 0)
	label.Size = UDim2.new(1, 0, 0.2, 0)
	label.Font = font
	label.Text = name
	label.TextScaled = true
	
	-- Create scale and stroke
	local scale = Instance.new("UIScale")
	scale.Scale = 2
	
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(255, 255, 255)
	
	-- Set parents
	scale.Parent = label
	stroke.Parent = label
	label.Parent = btn
	btn.Parent = container
end

-- Create and populate control container
container = createContainer()
buttonNames = {"Rewards", "Teleport", "Shop", "Sprint", "Quest", "Fast"}
images = {"rbxassetid://113180766094879", "rbxassetid://97046454959862", "rbxassetid://126039916030306",
	"rbxassetid://126389204899471", "rbxassetid://133482966432294", "rbxassetid://125045934339156"}
for i = 1, #buttonNames do
	createButton(container, buttonNames[i], i, images[i])
end
