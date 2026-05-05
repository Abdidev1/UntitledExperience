local GroupService = game:GetService("GroupService")
local GROUP_ID = 36084878 -- Replace with your actual Group ID

script.Parent.MouseButton1Click:Connect(function()
	-- This triggers the official "Join Community" pop-up from your photo to join the group!

	local success, errorMessage = pcall(function()
		GroupService:PromptJoinAsync(GROUP_ID)
	end)

	if not success then
		warn("Error showing group prompt: " .. errorMessage)
	end
end)
