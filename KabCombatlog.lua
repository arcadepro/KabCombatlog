local mythicraid 	=       true  -- 20-player Mythic Raid
local heroicraid 	=       true  -- 10-30-player Heroic Raid
local normalraid 	=       true  -- 10-30-player Normal Raid


local EventFrame = CreateFrame("Frame")
	EventFrame:SetScript("OnEvent", function(self, event, ...)

	C_Timer.After(2, function()
		local flag, instanceType = IsInInstance()
		local name, type, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()

		if not flag then
			--print("Combat Logging Disabled")
			--print("|cffff00ff Combat Logging Disabled|r")
			LoggingCombat(false)
		end

		if (mythicraid) and type == "raid" and difficulty == 16 then
		-- 16 - 20-player Mythic Raid Instance
			print("|cffff00ff",name, difficultyName, "- Logging Enabled|r")
			LoggingCombat(true)
		elseif (heroicraid) and type == "raid" and difficulty == 15 then
		-- 15 - 10-30-player Heroic Raid Instance
			print("|cffff00ff",name, difficultyName, "- Logging Enabled|r")
			LoggingCombat(true)
		elseif (normalraid) and type == "raid" and difficulty == 14 then
		-- 14 - 10-30-player Normal Raid Instance
			print("|cffff00ff",name, difficultyName, "- Logging Enabled|r")
			LoggingCombat(true)
		else
			--LoggingCombat(false)
		end
	end)
end)

EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
--EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
