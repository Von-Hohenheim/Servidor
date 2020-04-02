local Quests = {
	[72356] = {questName = "Quest nub", storageId = 543251, premium = false, level = 1, teleportHome = true, reward = {{2160, 100}, {2150, 10}}, customMessage = ""},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not Quests[item.actionid] then
		return true
	end
	
	local quest = Quests[item.actionid]
	
	if getPlayerStorageValue(cid, quest.storageId) > -1 then
		doPlayerSendCancel(cid, "You've finished this quest!")
		return true
	end
	
	if getPlayerLevel(cid) < quest.level then
		doPlayerSendCancel(cid, "You need be level ".. quest.level .." to do this quest!")
		return true
	end
	
	if quest.premium and not isPremium(cid) then
		doPlayerSendCancel(cid, "You need be premium to do this quest!")
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
