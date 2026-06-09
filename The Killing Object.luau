local lavaPart = script.Parent

local function onTouch(otherPart)
	-- Check if the thing that touched the part is part of a Character
	local character = otherPart.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	-- If a humanoid exists, set health to 0
	if humanoid then
		humanoid.Health = 0
	end
end

-- Connect the function to the Touched event
lavaPart.Touched:Connect(onTouch)