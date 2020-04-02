local Quests = {
-- Quest's Bau
	[7001] = {questName = "Parasect Quest", slot = 5, storageId = 50901, premium = false, level = 25, teleportHome = false, reward = {{2160, 3}, {11639, 1}, {12344, 25}}, customMessage = ""},
	[7002] = {questName = "Rattata Quest", slot = 5, storageId = 50902, premium = false, level = 10, teleportHome = false, reward = {{2160, 1}, {11638, 1}, {12344, 10}}, customMessage = ""},
	[7003] = {questName = "Darkness Stone", slot = 5, storageId = 50903, premium = false, level = 40, teleportHome = false, reward = {{2160, 5}, {11450, 2}, {12344, 50}}, customMessage = ""},
	[7004] = {questName = "Underwater Quest", slot = 5, storageId = 50904, premium = false, level = 60, teleportHome = false, reward = {{2160, 20}, {11640, 1}, {11442, 2}}, customMessage = ""},	
	[7005] = {questName = "Earth Stone", slot = 5, storageId = 50905, premium = false, level = 40, teleportHome = false, reward = {{2160, 5}, {11451, 2}, {12344, 50}}, customMessage = ""},	
	[7006] = {questName = "Coccon Stone", slot = 5, storageId = 50906, premium = false, level = 60, teleportHome = false, reward = {{2160, 10}, {11448, 2}, {12344, 75}}, customMessage = ""},
	[7007] = {questName = "Venom Stone", slot = 5, storageId = 50907, premium = false, level = 40, teleportHome = false, reward = {{2160, 5}, {11443, 2}, {12344, 50}}, customMessage = ""},	
	[7008] = {questName = "Punch Stone", slot = 5, storageId = 50908, premium = false, level = 60, teleportHome = false, reward = {{2160, 10}, {11446, 2}, {12344, 50}}, customMessage = ""},		
-- Quest's High	
	[7022] = {questName = "Zapdos Quest", slot = 5, storageId = 50922, premium = false, level = 120, teleportHome = false, reward = {{2160, 60}, {12150, 1}, {11444, 15}}, customMessage = ""},	
	[7023] = {questName = "Moltres Quest", slot = 5, storageId = 50923, premium = false, level = 120, teleportHome = false, reward = {{2160, 60}, {12151, 1}, {11447, 15}}, customMessage = ""},
	[7024] = {questName = "Articuno Quest", slot = 5, storageId = 50924, premium = false, level = 120, teleportHome = false, reward = {{2160, 60}, {12149, 1}, {11454, 15}}, customMessage = ""},	
	[7025] = {questName = "Psychic Quest", slot = 5, storageId = 50925, premium = false, level = 80, teleportHome = false, reward = {{2160, 40}, {11641, 1}, {11452, 2}}, customMessage = ""},	
-- Quest Big Porygon --
	[7026] = {questName = "Big Porygon Quest", slot = 8, storageId = 50926, premium = false, level = 180, teleportHome = true, reward = {{2160, 200}, {12244, 25}, {19575, 1}, {19577, 1}, {19578, 1}, {19579, 1}}, customMessage = ""},		
-- First Stone --
	[7027] = {questName = "First Stone Quest", slot = 3, storageId = 50927, premium = false, level = 40, teleportHome = false, reward = {{2160, 5}, {12344, 30}, {11441, 1}}, customMessage = ""},	
	[7028] = {questName = "First Stone Quest", slot = 3, storageId = 50927, premium = false, level = 40, teleportHome = false, reward = {{2160, 5}, {12344, 30}, {11447, 1}}, customMessage = ""},	
	[7029] = {questName = "First Stone Quest", slot = 3, storageId = 50927, premium = false, level = 40, teleportHome = false, reward = {{2160, 5}, {12344, 30}, {11442, 1}}, customMessage = ""},	
--	
	[7030] = {questName = "Fire Stone Quest", slot = 5, storageId = 50928, premium = false, level = 60, teleportHome = false, reward = {{2160, 10}, {12344, 50}, {11447, 2}}, customMessage = ""},	
	
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not Quests[item.actionid] then
		return true
	end
	
	local quest = Quests[item.actionid]
	
	if getPlayerStorageValue(cid, quest.storageId) > -1 then
		doPlayerSendCancel(cid, "Você já completou essa quest!")
		return true
	end
	
	if getPlayerLevel(cid) < quest.level then
		doPlayerSendCancel(cid, "Você precisa do level ".. quest.level .." para a quest!")
		return true
	end

	if getContainerSlotsFree(getPlayerSlotItem(cid, 3).uid) <= quest.slot then
		doPlayerSendCancel(cid, "Você precisa de ".. quest.slot .." vazios!")
		return true
	end	
	
	if quest.premium and not isPremium(cid) then
		doPlayerSendCancel(cid, "Você precisa ser vip para concluir essa quest!")
		return true
	end
	
	local itemsName = {}
	local rewardItemid, count = 0, 0
	
	for _, items in pairs(quest.reward) do
		count = items[2]
		rewardItemid = items[1]
		
		table.insert(itemsName, count.."x "..getItemNameById(rewardItemid))
		doPlayerAddItem(cid, rewardItemid, count)
	end
	
	local text = "Você terminou a ".. quest.questName .." e recebeu ".. doConcatTable(itemsName, ", ", " e ").."."
	
	if not quest.customMessage == "" then
		text = quest.customMessage
	end
	
	doPlayerSendTextMessage(cid, 20, text)
	setPlayerStorageValue(cid, quest.storageId, 1)
	
	if quest.teleportHome then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end
	
	return true  
end
