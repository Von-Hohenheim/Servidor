local storage = 121212 --storage da quest

function onUse(cid, item, frompos, item2, topos)
	
	if getPlayerStorageValue(cid, 55006) >= 1 and not canUseReviveOnDuel then
		doPlayerSendCancel(cid, "Você não pode usar isso no duelo.") 
		return true
	elseif isPlayer(item2.uid) then
		doPlayerSendCancel(cid, "Por favor, use o revive na pokeball.")
		return true
	elseif getPlayerStorageValue(cid, 201001) >= 1 then
		doPlayerSendCancel(cid, "Você não pode utilizar o revive enquanto duela.") 
		return true		
	elseif getPlayerStorageValue(cid, 252526) >= 1 then
		doPlayerSendCancel(cid, "Você não pode utilizar o revive agora.") 
		return true
	end

	if getPlayerInTower(cid) then
		if getPlayerStorageValue(cid, 200050) >= 1 then
			setPlayerStorageValue(cid, 200050, (getPlayerStorageValue(cid, 200050)-1))
			doPlayerSendTextMessage(cid, 20, "Lhe restou apenas ["..getPlayerStorageValue(cid, 200050).."] revives.")
		else
			doPlayerSendCancel(cid, "Você não pode usar mais revives.")
			return true
		end		
	end
	
	if isRiderOrFlyOrSurf(cid) then return true end
	
	for a, b in pairs (pokeballs) do
		if not item2.itemid == b.on or not item2.itemid == b.off or not item2.itemid == b.use then
			doPlayerSendCancel(cid, "Por favor, use o revive na pokeball.")
			return true
		end
	end
	
	local pokeball = getPlayerSlotItem(cid, 8)
	for a, b in pairs (pokeballs) do
			
		if (item2.itemid == b.on or item2.itemid == b.off) or (item2.itemid == b.use and getBallHealthProtect(cid, item2) <= 0) then
			doTransformItem(item2.uid, b.on)
			doSetItemAttribute(item2.uid, "hpToDraw", 0)
			for c = 1, 15 do		
				local str = "move"..c			 
				setCD(item2.uid, str, 1) -- 0				
			end
	
			setCD(item2.uid, "control", 0)
			setCD(item2.uid, "blink", 0) --alterado v1.6
			doSendMagicEffect(getThingPos(cid), 13)
			doRemoveItem(item.uid, 1)
			doCureBallStatus(getPlayerSlotItem(cid, 8).uid, "all")
			doCureStatus(cid, "all", true)
			cleanBuffs2(item2.uid) --alterado v1.5
			
			if getPlayerStorageValue(cid, storage) > 0 then
				setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage)-1)
			end

			setPlayerStorageValue(cid, 432423, -1)			
			doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_POKEMON_HEALTH, getBallMaxHealth(cid, item2).."|"..getBallMaxHealth(cid, item2))
			return true
			
		end
	end
	return true
end