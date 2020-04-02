function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid, 509001) >= 1 then
		doShowRoom(cid)
	else
		doPlayerSendCancel(cid, "Você não provou ser capaz de poder acessar a Tower!")
	end
	
	return true
end