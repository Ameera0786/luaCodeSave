local player = game.Players.LocalPlayer
local GUI = player:WaitForChild("PlayerGui"):WaitForChild("GUI")
local font = Enum.Font.FredokaOne
local backpackImg = "rbxassetid://72338635510808"

-- Create open inventory button
local function createOpenButton()
	-- Create button and scale
	local btn = Instance.new("ImageButton")
	btn.AnchorPoint = Vector2.new(0.5, 0.5)
	btn.Name = "OpenInventory"
	btn.Size = UDim2.new(0.2, 0, 0.2, 0)
	btn.Position = UDim2.new(0.5, 0, 0.9, 0)
	btn.BackgroundTransparency = 1
	btn.ScaleType = Enum.ScaleType.Fit
	btn.Image = backpackImg
	
	local scale = Instance.new("UIScale")
	scale.Scale = 0.75
	
	-- Set parents
	scale.Parent = btn
	btn.Parent = GUI
end

-- Create inventory container
local function createInventoryContainer()
	-- Create container
	local container = Instance.new("Frame")
	container.AnchorPoint = Vector2.new(0.5, 0.5)
	container.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
	container.BackgroundTransparency = 0.1
	container.Name = "InventoryContainer"
	container.Position = UDim2.new(0.5, 0, 0.5, 0)
	container.Size = UDim2.new(0.65, 0, 0.65, 0)
	container.Visible = false
	
	-- Create ratio, corner, scale, and stroke
	local ratio = Instance.new("UIAspectRatioConstraint")
	ratio.AspectRatio = 1.5
	
	local corner = Instance.new("UICorner")
	
	local scale = Instance.new("UIScale")
	scale.Scale = 0.8
	
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	
	-- Set parents
	ratio.Parent = container
	corner.Parent = container
	scale.Parent = container
	stroke.Parent = container
	container.Parent = GUI

	return container
end

-- Create inventory organizor
local function createInventoryOrganizor(container)
	-- Create container
	local organizorContainor = Instance.new("Frame")
	organizorContainor.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	organizorContainor.Name = "InventoryOrganizor"
	organizorContainor.Position = UDim2.new(-0.16, 0, 0.11, 0)
	organizorContainor.Size = UDim2.new(0.13, 0, 0.89, 0)
	
	-- Create corner, gridLayout, and stroke
	local corner = Instance.new("UICorner")
	
	local gridLayout = Instance.new("UIGridLayout")
	gridLayout.CellSize = UDim2.new(1, 0, 0.3, 0)
	gridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	gridLayout.FillDirection = Enum.FillDirection.Horizontal
	gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	gridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	
	local stroke = Instance.new("UIStroke")
	
	-- Set parents
	corner.Parent = organizorContainor
	gridLayout.Parent = organizorContainor
	stroke.Parent = organizorContainor
	organizorContainor.Parent = container
	
	return organizorContainor
end

-- Create sections
local function createSections(container, name, image)
	-- Create button
	local btn = Instance.new("ImageButton")
	btn.BackgroundTransparency = 1
	btn.Name = name
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.Image = image
	btn.ScaleType = Enum.ScaleType.Fit

	-- Create label and stroke
	local label = Instance.new("TextLabel")
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0.5, 0, 0.9, 0)
	label.Size = UDim2.new(1, 0, 0.2, 0)
	label.Font = font
	label.Text = name
	label.TextSize = 14
	label.TextScaled = true
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.TextYAlignment = Enum.TextYAlignment.Center
	
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(255, 255, 255)
	
	-- Set parents
	stroke.Parent = label
	label.Parent = btn
	btn.Parent = container
end

-- Create inventory UI
local function createInventoryUI(container)
	-- Create title
	local inventoryTitle = Instance.new("Frame")
	inventoryTitle.Size = UDim2.new(1, 0, 0.1, 0)
	
	-- Create scale, label, corner, and stroke
	local scale = Instance.new("UIScale")
	
	local inventoryLabel = Instance.new("TextLabel")
	inventoryLabel.BackgroundTransparency = 1
	inventoryLabel.Size = UDim2.new(1, 0, 1, 0)
	inventoryLabel.Font = font
	inventoryLabel.Text = "Inventory"
	inventoryLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	inventoryLabel.TextXAlignment = Enum.TextXAlignment.Center
	inventoryLabel.TextYAlignment = Enum.TextYAlignment.Center
	inventoryLabel.TextScaled = true
	inventoryLabel.TextSize = 14

	local corner = Instance.new("UICorner")

	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	
	-- Create horizontal line
	local horLine = Instance.new("Frame")
	horLine.AnchorPoint = Vector2.new(0.5, 0.5)
	horLine.Position = UDim2.new(0.5, 0, 0.1, 0)
	horLine.Size = UDim2.new(1, 0, 0.01, 0)
	
	-- Create scroll, corner, and padding
	local scroll = Instance.new("ScrollingFrame")
	scroll.AnchorPoint = Vector2.new(0.5, 1)
	scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	scroll.Position = UDim2.new(0.5, 0, 1, 0)
	scroll.Size = UDim2.new(1, 0, 0.9, 0)
	
	local corner2 = Instance.new("UICorner")
	
	local padding = Instance.new("UIPadding")
	padding.PaddingTop = UDim.new(0, 10)
	padding.PaddingLeft = UDim.new(0, 10)
	padding.PaddingRight = UDim.new(0, 10)
	padding.PaddingBottom = UDim.new(0, 10)

	-- Set parents
	inventoryTitle.Parent = container
	scale.Parent = inventoryTitle
	inventoryLabel.Parent = inventoryTitle
	corner.Parent = inventoryTitle
	stroke.Parent = inventoryLabel
	horLine.Parent = container
	scroll.Parent = container
	corner2.Parent = scroll
	padding.Parent = scroll
end

-- Create and populate initial inventory UI
createOpenButton()
local inventoryContainer = createInventoryContainer()
createInventoryUI(inventoryContainer)
local organizorContainer = createInventoryOrganizor(inventoryContainer)

sectionNames = {"Passives", "Tokens", "Weapons"}
sectionImgs = {"rbxassetid://121879948990743", "rbxassetid://106627634248898", "rbxassetid://115372928563817"}
for i = 1, #sectionNames do
	createSections(organizorContainer, sectionNames[i], sectionImgs[i])
end
