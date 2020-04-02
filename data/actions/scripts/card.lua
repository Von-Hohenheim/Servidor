local config = {
-- Mew and Mewtwo Cards --
[19846] = {name = "Cmew", cd = 2 * 60 * 60, remove = true},
[19847] = {name = "Cmewtwo", cd = 2 * 60 * 60, remove = true},
-- Legendary Cards --
[19849] = {name = "Cmoltres", cd = 2 * 60 * 60, remove = true},
[19850] = {name = "Czapdos", cd = 2 * 60 * 60, remove = true},
[19851] = {name = "Carticuno", cd = 2 * 60 * 60, remove = true},
-- Other Cards --
[19580] = {name = "Cporygon", cd = 2 * 60 * 60, remove = true},
[19848] = {name = "Cdragonite", cd = 2 * 60 * 60, remove = true},
[19853] = {name = "Caerodactyl", cd = 2 * 60 * 60, remove = true},
[19852] = {name = "Csnorlax", cd = 2 * 60 * 60, remove = true}
} -- cd em segundos

local cdStorage = 53799
function onUse(cid, item, frompos, item2, topos)
	local usedItem = config[item.itemid]
		if usedItem then
			if getPlayerLevel(cid) >= 120 then
			local att = getPlayerStorageValue(cid, cdStorage)
				if att == -1 or os.time() >= tonumber(att)+usedItem.cd or isGod(cid) then
					if getChanceCard(item.uid) >= 1 then
						doCreateNpcWithFocus(usedItem.name, getClosestFreeTile(cid, getCreaturePosition(cid)), cid)
						setPlayerStorageValue(cid, cdStorage, os.time())
						--setPlayerStorageValue(cid, 2152525, 1)
						removeChanceCard(item.uid)
						doSendMsg(cid, "Para mais informações sobre o card: https://trello.com/c/L19NuYta/16-pokémon-card")
					else
						if usedItem.remove then
							doRemoveItem(item.uid, 1)
						end
					end
				else
					stringTime = math.floor(((tonumber(att)+usedItem.cd)-os.time()))
					stringMinOrSec = "segundos"
					if stringTime > 60 then
						stringTime = math.floor(stringTime/60)
						stringMinOrSec = "minutos"
					end
					doPlayerSendCancel(cid, "Você poderá usar novamente em: "..stringTime.." "..stringMinOrSec)
				end
			end
		else
			doPlayerSendCancel(cid, "Você precisa de level 120 para poder usar o card.")
	end
	return true
end