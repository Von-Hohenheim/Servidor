local items = {
	[19914] = {percentExtra = 100, timeType = "hours", time = 2}, -- 1 hora
	[19915] = {percentExtra = 100, timeType = "hours", time = 5}, -- 1 hora

}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local expItem = items[item.itemid]
	
	if not expItem then
		return true
	end
	
	local tempo = 0
	local death = false
	
	if expItem.timeType == "days" then
		tempo = expItem.time * 60 * 60 * 24
	else -- Hours
		tempo = expItem.time * 60 * 60
	end
	
	if getPlayerStorageValue(cid, 43144) - os.time() > 0 then
		doPlayerSendTextMessage(cid, 20, "Você ainda tem um Clan Booster ativo de "..getPlayerStorageValue(cid, 43145).."%. Ele irá acabar em "..convertTime(getPlayerStorageValue(cid, 43144) - os.time())..".")
		return false
	end
	
	doRemoveItem(item.uid, 1)
	setPlayerStorageValue(cid, 43144, tempo + os.time())
	setPlayerStorageValue(cid, 43145, expItem.percentExtra)
	doPlayerSendTextMessage(cid, 20, "Você ativou um Clan Booster de "..expItem.percentExtra.."% a mais, que durará "..(death and "até morrer" or convertTime(tempo))..".")
	
	return true
end