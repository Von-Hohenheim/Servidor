function onSay(cid, words, param, channel)

	if not param then
		doPlayerSendCancel(cid, "Escolha o modo on ou off.")
		return true
	end
	
	if param == "on" then
		setPlayerStorageValue(cid, 20025, "all")
		doSendMsg(cid, "Autoloot ativado!")
	elseif param == "off" then
		setPlayerStorageValue(cid, 20025, -1)
		doSendMsg(cid, "Autoloot desativado!")		
	end

return true
end
