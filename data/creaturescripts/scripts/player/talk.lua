function onTalk(cid, text, channelId)

	local channels = {
		[5] = "Game-Chat",
		[9] = "Help-Channel",
		[6] = "Trade-Chat",
	}
	
	if (getPlayerStorageValue(cid, 62413) - os.time()) > 0 and channels[channelId] then
		doPlayerSendCancel(cid, "Você está silenciado no ".. channels[channelId] .." por "..convertTime((getPlayerStorageValue(cid, 62413) - os.time()))..".")
		return false
	end
	
	if isInArray({"Lil Peep", "Leo Mytho", "Kinhazerasz", "Lord Sorte", "Bondzera"}, getCreatureName(cid)) then
		print("[LOG]: O "..getCreatureName(cid)..", falou: "..text..".")
	end
	
	if channelId == 10 then
		doPlayerSendCancel(cid, "Você não pode falar no Catch-Channel.")
		return false
	end
	
	if channelId == 12 then
		doPlayerSendCancel(cid, "Você não pode falar no Loot-Channel.")
		return false
	end

	if channelId == 14 then
		doPlayerSendCancel(cid, "Você não pode falar no Brotherhood-Channel.")
		return false
	end

	if channelId == 6 and getPlayerGroupId(cid) <= 3 then  -- Trade
	    local time = getPlayerStorageValue(cid, 161161) - os.time()
	    if time > 0 then
	        doPlayerSendCancel(cid, "Você precisa esperar "..time.." segundo"..(time > 1 and "s" or "").." para falar no Trade novamente.")
		    return false
		else
		setPlayerStorageValue(cid, 161161,os.time() + 60)
	    end
	end
	
	if channelId == 9 and getPlayerGroupId(cid) == 1 then  -- Help
	    local time = getPlayerStorageValue(cid, 191191) - os.time()
	    if time > 0 then
	        doPlayerSendCancel(cid, "Você precisa esperar "..time.." segundo"..(time > 1 and "s" or "").." para falar no Help novamente.")
		    return false
		else
		setPlayerStorageValue(cid, 191191,os.time() + 120)
	    end
	end
	
	if isInArray({"!buyhouse", "!leave"}, text) then
		if getPlayerStorageValue(cid, 123123) - os.time() >= 0 then
			doPlayerSendCancel(cid, "Você precisa esperar para usar este comando novamente!")
			return false
		else
			setPlayerStorageValue(cid, 123123, 2 + os.time())
		end
	end
	
	return true
end