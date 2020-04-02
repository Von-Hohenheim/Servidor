function onUse(cid, item, frompos, item2, topos)
	
	if getPlayerInGolden(cid) then
		doPlayerSendCancel(cid, "Você já está na Survival Arena!")
		return true
	end
	
	if isRiderOrFlyOrSurf(cid) then 
		doPlayerSendCancel(cid, "Você não pode entrar de fly, ride ou surf!")
		return true
	end
	
	if getGlobalStorageValue(254601) ~= 1 then	
		doPlayerSendCancel(cid, "Você só pode entrar na Survival Arena nos horarios 13:30, 18:30 ou 00:30.")
		return true
	end
	
	doTeleportArena(cid)
	doRemoveItem(item.uid, 1)
	doPlayerSendTextMessage(cid, 20, "Bem vindo a Survival Arena!")	
	return true
end