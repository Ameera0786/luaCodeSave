local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local playerGui = LocalPlayer.PlayerGui
local GUI = playerGui:WaitForChild("GUI")
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Container variables
local controlContainer = GUI:WaitForChild("ControlContainer")
local rewardContainer = GUI:WaitForChild("RewardContainer")
local inventoryContainer = GUI:WaitForChild("InventoryContainer")
local teleportContainer = GUI:WaitForChild(("TeleportContainer"))

-- Button and panel variables
local rewardsButton = controlContainer:WaitForChild("RewardsButton")
local inventoryButton = GUI:WaitForChild("OpenInventory")
local teleportButton = controlContainer:WaitForChild("TeleportButton")
local sprintButton = controlContainer:WaitForChild("SprintButton")

-- Panel variables
local panels = {rewardContainer, inventoryContainer, teleportContainer}
local buttons = {rewardsButton, inventoryButton, teleportButton}

-- Walk speed
local defaultWalkSpeed = humanoid.WalkSpeed
local speedMultiplier = 2
local sprinting = false

local function updateWalkSpeed()
	sprinting = not sprinting
	if sprinting then 
		humanoid.WalkSpeed = defaultWalkSpeed * speedMultiplier
	else
		humanoid.WalkSpeed = defaultWalkSpeed
	end
end

-- Close all panels
local function closeAllPanels()
	for _, panel in pairs(panels) do
		panel.Visible = false
	end
	-- add more panels here if needed
end

-- Toggle panel visibility
local function updateVisibility(panel)
	if panel.Visible then
		panel.Visible = false
	else
		closeAllPanels()
		panel.Visible = true
	end
end

-- Update buttons on key press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if (not gameProcessed) then
		-- Check for sprint key (LeftShift)
		if (input.KeyCode == Enum.KeyCode.LeftShift) then
			updateWalkSpeed()
		-- Check for teleport key (T)
		elseif input.KeyCode == Enum.KeyCode.T then
			updateVisibility(teleportContainer)
		-- Check for rewards key (R)
		elseif input.KeyCode == Enum.KeyCode.R then
			updateVisibility(rewardContainer)
		-- Check for inventory key (U)
		elseif input.KeyCode == Enum.KeyCode.U then
			updateVisibility(inventoryContainer)
		end
	end
end)

-- Update walk speed based on mouse click
sprintButton.MouseButton1Click:Connect(function()
	updateWalkSpeed()
end)

-- Connect buttons to toggle panels
for i = 1, #buttons do
	buttons[i].MouseButton1Click:Connect(function()
		updateVisibility(panels[i])
	end)
end
