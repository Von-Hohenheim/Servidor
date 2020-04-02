local day = 24 * 60 * 60

local shinyCharm = {
	[19582] = {time = 1 * day},
	[19581] = {time = 3 * day},
	[19274] = {time = 7 * day},
	[19277] = {time = 30 * day},
}

function onUse(cid, item, frompos, itemEx, topos)
	local charm = shinyCharm[item.itemid]
	if not charm then
		return true
	end
	
	if getPlayerStorageValue(cid, 4125) - os.time() > 0 then
		doPlayerSendCancel(cid, "Você ainda tem um Shiny Charm ativo!")
		return true
	end
	
	setPlayerStorageValue(cid, 4125, charm.time + os.time())
	doPlayerSendCancel(cid, "Você acaba de ativar um Shiny Charm com duração de "..charm.time/day.." dias. Aproveite muito bem esse Shiny Charm!")
	doRemoveItem(item.uid, 1)
	return true
end