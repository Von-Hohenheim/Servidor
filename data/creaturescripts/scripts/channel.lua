function onJoinChannel(cid, channel, users)

	if channel == 14 and getPlayerStorageValue(cid, 252512) ~= 1 then
		return false
	end
	
	--print('Oi')
	
return true
end