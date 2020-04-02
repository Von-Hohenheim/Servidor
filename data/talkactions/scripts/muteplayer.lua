local v = {}

function onSay(cid, words, param, channel)
	
	if (words == "/mute") then
		
		local t = string.explode(param, ",") 
		
		if param == '' then doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.") return true end 
		
		local player, time, pid = getPlayerByName(t[1]), t[2], getPlayerByNameWildcard(t[1]) 
		
		
		if not time then
			doPlayerSendCancel(cid, "Você precisa informar por quantos minutos ele permanecerá silenciado.")
			return true
		end
		
		if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then 	
			doPlayerSendCancel(cid, "Este jogador não existe ou está offline.") 
			return true 
		end
		
		if getPlayerGroupId(cid) < getPlayerGroupId(player) then
			doPlayerSendCancel(cid, "Você não pode silenciar um superior.") 
			return true
		end
		
		doPlayerSendCancel(cid, "Você silenciou o jogador ".. getCreatureName(player) .." por ".. time.." minutos.")
		
		setPlayerStorageValue(player, 62413, os.time()+time*60)
		
		doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você foi silenciado por ".. getCreatureName(cid) .." durante ".. time .." minutos.")
	
		for _, oid in pairs(getPlayersOnline()) do
			doPlayerSendChannelMessage(oid, "", "O jogador ".. getCreatureName(player) .." foi silenciado por ".. getCreatureName(cid) .." durante ".. time .." minutos.", TALKTYPE_CHANNEL_W, 5)
			doPlayerSendChannelMessage(oid, "", "O jogador ".. getCreatureName(player) .." foi silenciado por ".. getCreatureName(cid) .." durante ".. time .." minutos.", TALKTYPE_CHANNEL_W, 9)
		end
		
	elseif (words == "/desmute") then
		
		if param == '' then doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.") return true end 
		
		local player = getPlayerByNameWildcard(param)
		
		if(not player)then 
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador não encontrado.")
			return true 
		end
		
		if getPlayerStorageValue(cid, 62413) < 1 then 
			doPlayerSendCancel(cid, "Este jogador não está silenciado.") 
			return true 
		end
		
		doPlayerSendCancel(cid, "O jogador "..param.." não está mais silenciado.")
		
		setPlayerStorageValue(player, 62413, -1)
		
		doPlayerSendCancel(player, "Você não está mais silenciado.")
		
	end
	
	return true 
	
end