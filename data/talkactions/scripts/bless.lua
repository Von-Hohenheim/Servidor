function onSay(cid, words, param)
	if getPlayerBlessPercent(cid) > 0 then
		doPlayerSendTextMessage(cid, 20, "Você está com uma Bless de "..getPlayerBlessPercent(cid) * 100 .."% ativa.")
	else
		doPlayerSendTextMessage(cid, 20, "Você não está com nenhuma Bless ativa.")
	end	
	return true
end