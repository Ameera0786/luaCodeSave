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

createOpenButton()
