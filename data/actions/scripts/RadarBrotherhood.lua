function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	if not isMemberBrotherhood(cid) then
		doPlayerSendCancel(cid, "S� membros da Brotherhood podem usar o detector!")
		return true
	end
	
	if getPlayerStorageValue(cid, 5465500) - os.time() > 0 then
		doPlayerSendCancel(cid, "Aguarde "..convertTime(getPlayerStorageValue(cid, 5465500) - os.time()).." para voc� usar novamente o radar.")
		return true
	end
	
	if not getItemAttribute(item.uid, "dono") then
		doItemSetAttribute(item.uid, "dono", getCreatureName(cid))
		return true
	end
	
	if getCreatureName(cid) ~= getItemAttribute(item.uid, "dono") then
		doPlayerSendCancel(cid, "S� o "..getItemAttribute(item.uid, "dono").." poder� usar esse radar.")
		return true
	end		
	
	doSummonNpcBrotherhoodRadar(cid)
	setPlayerStorageValue(cid, 5465500, 30 * 60 + os.time())
	return true  
end
