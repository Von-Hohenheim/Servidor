function onSay(cid, words, param, channel)
	
	if not param or param == "" then
		doPlayerSendCancel(cid, "Escolha um dos parametros count ou pos.")
		return true
	end
	
	if string.lower(param) == "count" then
		doPlayerSendTextMessage(cid, 20, "Você já executou ["..getPlayerKillCount(cid, "easy").."] Easy, ["..getPlayerKillCount(cid, "medium").."] Medium, ["..getPlayerKillCount(cid, "hard").."], Hard, ["..getPlayerKillCount(cid, "expert").."], Expert, ["..getPlayerKillCount(cid, "legendary").."], Legendary.")	  
	elseif string.lower(param) == "pos" then
		doPlayerSendTextMessage(cid, 20, getPlayerStorageValue(cid, "Brotherhood"))	 
		return true
	end
	
	return true
end
