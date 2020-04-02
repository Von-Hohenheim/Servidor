function onSay(cid, words, param, channel)
	
	if not param or param == "" then
		doPlayerSendCancel(cid, "Escolha um dos parametros mytime ou timequest.")
		return true
	end
	
	if string.lower(param) == "mytime" then
		doPlayerSendTextMessage(cid, 20, "[Clones]: "..convertTime(getPlayerStorageValue(cid, 245680) - os.time()).." restantes.")	
		return true
	elseif string.lower(param) == "timequest" then
		if getGlobalStorageValue(245679) > 0 then
			doPlayerSendTextMessage(cid, 20, "[Clones]: "..convertTime(getGlobalStorageValue(245679) - os.time()).." restantes.")
		else
			doPlayerSendTextMessage(cid, 20, "[Clones]: J� est� dispon�vel para voc� faze-la.")
		end
		return true
	end
	
	return true
end
