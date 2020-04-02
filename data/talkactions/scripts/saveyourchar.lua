function onSay(cid, words, param, channel)
	local time = getPlayerStorageValue(cid, 11548) - os.time()
	if time < 1 then
		doPlayerSave(cid)
		setPlayerStorageValue(cid, 11548,os.time() + 20)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Seu Personagem foi salvo com sucesso!!.")
	else
		doPlayerSendCancel(cid, "Você precisa esperar "..time.." segundo"..(time > 1 and "s" or "").." para salvar seu personagem novamente.")
	end
	return true
end