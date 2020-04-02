local config = {
	[6000] = {storage = 60900, type = "da Floresta"},
	[6001] = {storage = 60901, type = "da Terra"},
	[6002] = {storage = 60902, type = "do Mar"}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local cfg = config[item.actionid]	

	if getPlayerStorageValue(cid, cfg.storage) >= 1 then
		return doPlayerSendCancel(cid, "Voc� j� coletou essa essencia!")
	end
	
	doPlayerSendTextMessage(cid, 20, "Voc� acaba de coletar � essencia da pedra sagrada "..cfg.type..".")
	setPlayerStorageValue(cid, cfg.storage, 1)
	return true  
end
