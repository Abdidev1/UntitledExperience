local DataStoreService = game:GetService("DataStoreService")
local BadgeService = game:GetService("BadgeService")
local completedData = DataStoreService:GetDataStore("PlayerPermData_V110")

local BADGE_ID = 00000000

local touchedMemory = {}
local finishClickCooldown = {}

game.Players.PlayerAdded:Connect(function(player)
	touchedMemory[player.UserId] = {}

	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"

	local stages = Instance.new("IntValue", leaderstats)
	stages.Name = "Stages"
	stages.Value = 0

	local completed = Instance.new("IntValue", leaderstats)
	completed.Name = "Completed"

	local success, data = pcall(function() return completedData:GetAsync(player.UserId) end)
	completed.Value = (success and data) or 0

	player.CharacterAdded:Connect(function(character)
		local lastStageName = player:GetAttribute("LastStageName")
		if lastStageName then
			local stageFolder = workspace:FindFirstChild("StageParts")
			local stagePart = stageFolder and stageFolder:FindFirstChild(lastStageName)
			if stagePart then
				task.wait(0.1)
				character:MoveTo(stagePart.Position + Vector3.new(0, 3, 0))
			end
		end
		finishClickCooldown[player.UserId] = false
	end)
end)

game.Players.PlayerRemoving:Connect(function(player)
	pcall(function() completedData:SetAsync(player.UserId, player.leaderstats.Completed.Value) end)
	touchedMemory[player.UserId] = nil
	finishClickCooldown[player.UserId] = nil
end)

--- STAGE PARTS LOGIC ---
local stageFolder = workspace:WaitForChild("StageParts")
for _, part in ipairs(stageFolder:GetChildren()) do
	if part:IsA("BasePart") then
		part.Touched:Connect(function(hit)
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			if player then
				local memory = touchedMemory[player.UserId]
				if memory and not table.find(memory, part.Name) then
					table.insert(memory, part.Name)
					player.leaderstats.Stages.Value += 1
					player:SetAttribute("LastStageName", part.Name)
				end
			end
		end)
	end
end

--- CLICK DETECTOR LOGIC FOR FINISH ---
local finishPart = workspace:WaitForChild("FinishPart")
local clickDetector = finishPart:FindFirstChildOfClass("ClickDetector")

if not clickDetector then
	clickDetector = Instance.new("ClickDetector", finishPart)
end

clickDetector.MouseClick:Connect(function(player)
	local character = player.Character

	-- Check if player is already in the process of finishing
	if player and finishClickCooldown[player.UserId] ~= true then
		finishClickCooldown[player.UserId] = true 

		-- 1. Award +1 Completed
		player.leaderstats.Completed.Value += 1

		-- 2. Award Badge
		local success, hasBadge = pcall(function()
			return BadgeService:UserHasBadgeAsync(player.UserId, BADGE_ID)
		end)

		if success and not hasBadge then
			pcall(function()
				BadgeService:AwardBadge(player.UserId, BADGE_ID)
			end)
		end

		-- 3. Reset Stages and Memory
		player.leaderstats.Stages.Value = 0
		touchedMemory[player.UserId] = {} 
		player:SetAttribute("LastStageName", nil)

		-- 4. Kill/Respawn to start over
		if character and character:FindFirstChild("Humanoid") then
			character.Humanoid.Health = 0
		end

		task.wait(2)
		finishClickCooldown[player.UserId] = false
	end
end)