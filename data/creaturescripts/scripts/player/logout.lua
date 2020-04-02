function onLogout(cid)
	if not isCreature(cid) then return true end 
	
	local timeNow = os.time()
	local totalTime = getPlayerLastLoginSaved(cid) + 5
	
	if totalTime >= timeNow then
		doPlayerSendTextMessage(cid, 19, "Aguarde ".. totalTime - timeNow .." segundo"..(totalTime - timeNow > 1 and "s" or "").." para poder deslogar!.")
		return false
	end
	
	doPlayerSave(cid, true)
	setPlayerStorageValue(cid, 201507080001, getPlayerIp(cid))
	
	if isBiking(cid) then
		doPlayerSendCancel(cid, "Você não pode relogar de bike.")
		return false
	end	
		
	if getPlayerInTower(cid) then
		doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL) -- PROBIR FLY/SURF NA TOWER		
		return true
	end	
	
	doLoogoutInDuel(cid)	

	if isInChannelsArray(cid) then 
		closeInServerChannmel(cid)
		addEvent(doRemoveCreatureWithS, 5, cid)
		return false
	end
	
	if isWatchingTv(cid) then
		doRetirePlayerToChannel(cid)
		addEvent(doRemoveCreatureWithS, 5, cid)
		return false
	end
	
	local thisitem = getPlayerSlotItem(cid, 8)
	
	if thisitem.uid <= 0 then return true end
	
	local ballName = getItemAttribute(thisitem.uid, "poke")
	local btype = getPokeballType(thisitem.itemid)
	
	
	---------------------------------------------------------------
	if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then --alterado v1.6
		if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then 
			BackTeam(cid) 
		end
	end

	--////////////////////////////////////////////////////////////////////////////////////////--
	--[[if #getCreatureSummons(cid) == 2 and getPlayerStorageValue(cid, 212124) >= 1 then
		local cmed2 = getCreatureSummons(cid)[1]
		local poscmed = getThingPos(cmed2)
		local cmeddir = getCreatureLookDir(cmed2)
		local namecmed = getCreatureName(cmed2)
		local hp, maxHp = getCreatureHealth(getCreatureSummons(cid)[1]), getCreatureMaxHealth(getCreatureSummons(cid)[1])
		local gender = getPokemonGender(cmed2) 
		doRemoveCreature(getCreatureSummons(cid)[1])
		local back = doCreateMonster(namecmed, poscmed)
		addEvent(doCreatureSetSkullType, 150, back, gender)
		doCreatureSetLookDir(back, cmeddir)
		addEvent(doCreatureAddHealth, 100, back, hp-maxHp)
		
		-- pokemon controlador	
		local ball2 = getPlayerSlotItem(cid, 8)
		local mynewpos = getThingPos(getCreatureSummons(cid)[1])
		doRemoveCreature(getCreatureSummons(cid)[1])
		local pk2 = doSummonCreature(getItemAttribute(ball2.uid, "poke"), mynewpos) 
		doConvinceCreature(cid, pk2)
		addEvent(doAdjustWithDelay, 100, cid, pk2, true, true, false)
		setPlayerStorageValue(cid, 888, -1) 
		cleanCMcds(ball2.uid)
		doCreatureSetLookDir(getCreatureSummons(cid)[1], 2)
		registerCreatureEvent(pk2, "SummonDeath") 
	end]]
	
	----------------------------------------------------------------------
	local summon = getCreatureSummons(cid)[1] 
	
	if #getCreatureSummons(cid) >= 1 and thisitem.uid > 1 then
		if getPlayerStorageValue(cid, 212124) <= 0 then
			doItemSetAttribute(thisitem.uid, "hp", (getCreatureHealth(summon) / getCreatureMaxHealth(summon)))
		end 
		setPlayerStorageValue(cid, 212124, 0)
		doTransformItem(thisitem.uid, pokeballs[btype].on)
		doSendMagicEffect(getThingPos(summon), pokeballs[btype].effect)
		doRemoveCreature(summon)
	end
	
	if isRiderOrFlyOrSurf(cid) then 
		doMarkedPos(cid, getThingPos(cid))
	end
	
	doSendMagicEffect(getThingPos(cid), 21)
	setPlayerStorageValue(cid, 30, -1)
	
	return TRUE
end