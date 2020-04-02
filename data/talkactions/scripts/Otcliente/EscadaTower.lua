function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageVale(cid, 509001) ~= 0 then
		doShowRoom(cid)
	end
	
	return true
end	