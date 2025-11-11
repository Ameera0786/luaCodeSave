local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local playerGui = LocalPlayer.PlayerGui
local GUI = playerGui:WaitForChild("GUI")

-- Container variables
local controlContainer = GUI:WaitForChild("ControlContainer")
local rewardContainer = GUI:WaitForChild("RewardContainer")
local inventoryContainer = GUI:WaitForChild("InventoryContainer")

-- Button and panel variables
local rewardsButton = controlContainer:WaitForChild("RewardsButton")
local inventoryButton = GUI:WaitForChild("OpenInventory")
local panels = {rewardContainer, inventoryContainer}

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

-- Rewards button toggle
rewardsButton.MouseButton1Click:Connect(function()
	updateVisibility(rewardContainer)
end)

-- Inventory button toggle
inventoryButton.MouseButton1Click:Connect(function()
	updateVisibility(inventoryContainer)
end)


