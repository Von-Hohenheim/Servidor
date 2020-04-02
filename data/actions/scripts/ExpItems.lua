local items = {
	[19268] = {percentExtra = 10, timeType = "hours", time = 1}, -- 1 hora
	[19269] = {percentExtra = 20, timeType = "hours", time = 1}, -- 1 hora
	
	[19270] = {percentExtra = 10, timeType = "days", time = 7}, -- 1 semana
	[19271] = {percentExtra = 20, timeType = "days", time = 7}, -- 1 semana
	
	[19272] = {percentExtra = 15, timeType = "days", time = 30}, -- 1 Mês
	[19273] = {percentExtra = 20, timeType = "days", time = 30}, -- 1 Mês
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local expItem = items[item.itemid]
	
	if not expItem then
		return true
	end
	
	local tempo = 0
	local death = false
	
	--[[if expItem.timeType == "death" then
		tempo = "death"
		death = true
		
	else]]
	
	if expItem.timeType == "days" then
		tempo = expItem.time * 60 * 60 * 24
	else -- Hours
		tempo = expItem.time * 60 * 60
	end
	
	if getPlayerStorageValue(cid, 45144) - os.time() > 1 then
		doPlayerSendTextMessage(cid, 20, "Você ainda tem um Experience Booster ativo de "..getPlayerStorageValue(cid, 45145).."%. Ele irá acabar em "..convertTime(getPlayerStorageValue(cid, 45144) - os.time())..".")
		return false
	end
	
	doRemoveItem(item.uid, 1)
	setPlayerStorageValue(cid, 45144, tempo + os.time())
	setPlayerStorageValue(cid, 45145, expItem.percentExtra)
	doPlayerSendTextMessage(cid, 20, "Você ativou um Experience Booster de "..expItem.percentExtra.."% a mais, que durará "..(death and "até morrer" or convertTime(tempo))..".")
	
	return true
end