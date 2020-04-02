function onSay(cid, words, param, channel)

local config = {
-- Sex --
["Sexy"] = {cost = 15, add = 0, style = "sex"},
-- Vip --
["Vip30"] = {cost = 10, add = 30, style = "vip"},
["Vip60"] = {cost = 18, add = 60, style = "vip"},
["Vip90"] = {cost = 25, add = 90, style = "vip"},
-- Pokemon --
["Ditto"] = {cost = 15, add = "Ditto", count = 0, style = "pokemon"},
["ShinyDitto"] = {cost = 80, add = "Shiny Ditto", count = 0, style = "pokemon"},
-- Memory --
["Memory"] = {cost = 15, add = 19278, count = 1, style = "item"},
["Memory2"] = {cost = 10, add = 19279, count = 1, style = "item"},
["ShinyMemory"] = {cost = 35, add = 19280, count = 1, style = "item"},
-- Itens --
["Bike"] = {cost = 10, add = 19275, count = 1, style = "item"},
["Charm3"] = {cost = 17, add = 19581, count = 1, style = "item"},
["Charm7"] = {cost = 35, add = 19274, count = 1, style = "item"},
["Charm30"] = {cost = 65, add = 19277, count = 1, style = "item"},
["Boost20"] = {cost = 5, add = 19269, count = 1, style = "item"},
-- Card --
["Snorlax"] = {cost = 30, add = 19852, count = 20, style = "card"},
["Aerodactyl"] = {cost = 30, add = 19853, count = 20, style = "card"},
["Dragonite"] = {cost = 30, add = 19848, count = 20, style = "card"},
["Mew"] = {cost = 80, add = 19846, count = 50, style = "card"},
["Mewtwo"] = {cost = 100, add = 19847, count = 50, style = "card"},
-- New's --
["ShinyStone"] = {cost = 5, add = 19203, count = 1, style = "item"},
["BoostStone"] = {cost = 3, add = 12618, count = 1, style = "item"},
["Keybox"] = {cost = 2, add = 19917, count = 1, style = "item"},
["Heldbox"] = {cost = 2, add = 19916, count = 1, style = "item"},
["Particle"] = {cost = 15, add = 19918, count = 1, style = "item"},
["Brotherhood"] = {cost = 100, add = 19919, count = 1, style = "radar"},
["Boss"] = {cost = 100, add = 19920, count = 1, style = "radar"},
["Recovery"] = {cost = 25, add = 19276, count = 1, style = "item"},
["Xpclan2"] = {cost = 25, add = 19914, count = 1, style = "item"},
["Xpclan5"] = {cost = 40, add = 19915, count = 1, style = "item"},
-- Outfit Itens --
["outfitslash"] = {cost = 10, add = 181648, count = 0, style = "outfit"},
["outfitplayboy"] = {cost = 10, add = 181649, count = 0, style = "outfit"},
["outfitvinganca"] = {cost = 10, add = 181650, count = 0, style = "outfit"},
["outfithouse"] = {cost = 10, add = 181651, count = 0, style = "outfit"},
["outfitveteran"] = {cost = 15, add = 181653, count = 0, style = "outfit"},
["outfitassasin"] = {cost = 15, add = 181654, count = 0, style = "outfit"},
["outfitduelist"] = {cost = 10, add = 20019, count = 0, style = "outfit"},
["outfitrabbitt"] = {cost = 10, add = 181661, count = 0, style = "outfit"},
["outfitiron"] = {cost = 20, add = 181658, count = 0, style = "outfit"},
} 

local cfg = config[param]

	if not cfg then return false end

	if getPlayerItemCount(cid, 2145) >= cfg.cost then
		if cfg.style == "vip" then
			doPlayerAddPremiumDays(cid, cfg.add)	
		elseif cfg.style == "pokemon" then
			if cfg.add == "Ditto" then
				local ball = createBall(cid, "Ditto", 0, false)
				doItemSetAttribute(ball, "memory", "without")	
			elseif cfg.add == "Shiny Ditto" then
				local ball = createBall(cid, "Shiny Ditto", 0, false)
				doItemSetAttribute(ball, "memory", 2)				
			end
		elseif cfg.style == "sex" then
			doPlayerSetSex(cid, (getPlayerSex(cid) == 0 and 1 or 0))
				addEvent(function() 
					local playerGuid = getPlayerGUID(cid)
					doRemoveCreature(cid) 
					addEvent(function() 
						if isPlayer(getPlayerByGUID(playerGuid)) then
							doSendPlayerExtendedOpcode(getPlayerByGUID(playerGuid), OPCODE_EMERALD_SHOP, "True") 
						end
					end, 2000)
				end, 5)
		elseif cfg.style == "card" then
			setChanceCard(doPlayerAddItem(cid, cfg.add, 1), cfg.count)
		elseif cfg.style == "item" then
			doPlayerAddItem(cid, cfg.add, cfg.count)
		elseif cfg.style == "outfit" then
			setPlayerStorageValue(cid, cfg.add, 1)
		elseif cfg.style == "radar" then
			local radar = doPlayerAddItem(cid, cfg.add, cfg.count)
			doItemSetAttribute(radar, "dono", getCreatureName(cid))
		end
		doPlayerRemoveItem(cid, 2145, cfg.cost)
		return true
	end
	
return true
end
