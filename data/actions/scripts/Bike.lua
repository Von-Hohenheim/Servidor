function onUse(cid, item, frompos, item2, topos)
	
	local config = {
		[1] = {lookType = 1394}, --- lookType da outfit male.
		[0] = {lookType = 1393}, --- lookType da outfit female.
	}
	
	if getPlayerItemCount(cid, item.itemid) < 1 then
		return true
	end	
	
	if isRiderOrFlyOrSurf(cid) then
		doPlayerSendCancel(cid, "Você não pode usar a bike enquanto está montado.")
		return true
	end
	
	local underwater = {231, 670, 671, 5405, 5406, 5407, 5408, 5409, 5410, 5427, 5428, 5429, 5430, 5431, 5432, 5433, 5434, 5435, 5436, 5437, 5438}
			
	if isInArray(underwater, getTileInfo(getThingPos(cid)).itemid)  then 
		return doPlayerSendCancel(cid, "Você não pode usar bike nesse local.")
	end	
	
	if isBiking(cid) then
		cancelBike(cid)
		doRegainSpeed(cid)
	else 
		doSetCreatureOutfit(cid, config[getPlayerSex(cid)], -1)
		setPlayerStorageValue(cid, 32001, 1)
		doRegainSpeed(cid)
	end
	
	return true
end