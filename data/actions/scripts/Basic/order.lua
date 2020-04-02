function onUse(cid, item, frompos, item2, topos) 
	if getCreatureCondition(cid, CONDITION_EXHAUST) or isWatchingTv(cid) then return true end
	doAddCondition(cid, ordercondition)
	
	local pPos = getThingPos(cid)
	pPos.stackpos = 0
	local pos = getThingFromPos(pPos)
	
	if isSurf(cid) or isInArray(11756, item2.itemid) or item2.itemid == 11756 or isInArray(11756, pos.itemid) or pos.itemid == 11756 or isInArray({11756, 11675, 11676, 460}, pos.itemid) then
		return doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL)
	end
	
	if item2.uid == cid then -- demound poke

		local pokes = getCreatureSummons(cid)[1]	
	
		if isInArray({"Smeargle 1", "Smeargle 2", "Smeargle 3", "Smeargle 4", "Smeargle 5", "Smeargle 6", "Smeargle 7", "Smeargle 8"}, getCreatureName(pokes)) then
			setPlayerStorageValue(cid, 156493, 1)
			addEvent(setPlayerStorageValue, 1 * 60 * 1000, cid, 156493, -1)
			doSendMsg(cid, "Você acaba de liberar a proteção do Smeargle, use o move conforme o que você deseja copiar.")
		end
		
		if isPlayer(item2.uid) and getPlayerStorageValue(item2.uid, 55006) >= 1 then
			return doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL)
		end
		
		if isRiderOrFlyOrSurf(cid) then 
			
			if getHouseFromPos(getThingPos(cid)) then
				doPlayerSendCancel(cid, "You cannot drop of the fly or ride while you are inside of a house!")
				return true
			end
			
			
			local ball = getPlayerSlotItem(cid, 8)
			doGoPokemon(cid, ball, false)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doCreatureSay(cid, getCreatureNick(getCreatureSummons(cid)[1]) .. orderTalks["downability"].talks[math.random(#orderTalks["downability"].talks)], 20)	
			setPlayerStorageValue(cid, orderTalks["ride"].storage, -1)
			setPlayerStorageValue(cid, orderTalks["fly"].storage, -1)
			doChangeSpeed(cid, -getCreatureSpeed(cid))			
			doChangeSpeed(cid, 325)		
			doSendPlayerExtendedOpcode(cid, 95, '12//,show')
			return true
		end
	end
	--- ride/fly retirada
	
	
	if isRiderOrFlyOrSurf(cid) then
		return doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL)
	end
	
	if #getCreatureSummons(cid) == 0 then
		return doPlayerSendCancel(cid, "Você precisa de um pokemon para usar o order.")
	end
	
	local poke = getCreatureSummons(cid)[1]
	local pokeName = getCreatureNick(poke)
	local habilidades = getPokemonSkills(getCreatureName(poke)) 
	
	if item2.uid == cid then
		
		if isFight(cid) and not canMountOnFight then -- EdiÃ§Ã£o pra ficar igual pxg.. nao dar fly ou ride com fight
			setMoveSummon(cid, false)
			addEvent(doMovePokeToPos, 5, poke, getThingPos(cid))
			return true 
		end 
		
		if getPlayerStorageValue(cid, 154585) >= 1 then
			return doPlayerSendCancel(cid, "Você não pode usar fly enquanto pesca!")
		end				
		
		if getPlayerStorageValue(cid, 123124) >= 1 and getPlayerStorageValue(cid, 78497) ~= 1 then
			return doPlayerSendCancel(cid, "Você não tem licensa para usar o fly!")
		end		
		
		if getPlayerInTower(cid) or getPlayerStorageValue(cid, 2154601) >= 1 then
			return doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL) -- PROBIR FLY/SURF NA TOWER
		end
		
		if isBiking(cid) then
			doPlayerSendCancel(cid, "Você precisa sair da bike para montar no pokémon.")
			return true
		end
		
		 if isMega(poke) then
			 return doPlayerSendCancel(cid, "Pokemons megas não tem habilidades de fly/ride.")
		 end
		
		if getPlayerStorageValue(cid, 55006) >= 1 then 
			return doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL)
		end
		
		if isPlayer(item2.uid) and (getPlayerStorageValue(item2.uid, 55006) >= 1 or getCreatureSkullType(item2.uid) == SKULL_WHITE or getCreatureSkullType(item2.uid) == 1 or getCreatureSkullType(item2.uid) == 2) then
			return doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL)
		end
		
		if not (getThingPos(poke) or getThingPos(item2.uid)) then -- correÃ§Ã£o de um erro.
			return true
		end
		local dist = getDistanceBetween(getThingPos(poke), getThingPos(item2.uid)) 
		--- ride
		if string.find(habilidades, "ride") then
	
			local underwater = {5405, 5406, 5407, 5408, 5409, 5410, 5427, 5428, 5429, 5430, 5431, 5432, 5433, 5434, 5435, 5436, 5437, 5438}
			
			if isInArray(underwater, getTileInfo(getThingPos(cid)).itemid)  then 
				return doPlayerSendCancel(cid, "Você não pode usar ride em baixo d'agua.")
			end
			
			doCreatureSay(cid, pokeName..orderTalks["ride"].talks[math.random(#orderTalks["ride"].talks)], 20)
			
			if dist == 1 then
				doUp(cid, poke, "ride")
				return true
			end
			
			setMoveSummon(cid, false)
			addEvent(doMovePokeToPos, 200, poke, topos)
			setPlayerStorageValue(poke, orderTalks["ride"].storage, 1)
			
		elseif string.find(habilidades, "fly") or string.find(habilidades, "levitate_fly") then
		
			local underwater = {5405, 5406, 5407, 5408, 5409, 5410, 5427, 5428, 5429, 5430, 5431, 5432, 5433, 5434, 5435, 5436, 5437, 5438}
			
			if isInArray(underwater, getTileInfo(getThingPos(cid)).itemid)  then 
				return doPlayerSendCancel(cid, "Você não pode usar fly em baixo d'agua.")
			end
	
			if string.find(habilidades, "levitate_fly") then
				doPlayerSay(cid, pokeName..orderTalks["levitate"].talks[math.random(#orderTalks["levitate"].talks)])
			else
				doPlayerSay(cid, pokeName..orderTalks["fly"].talks[math.random(#orderTalks["fly"].talks)])
			end
			
			if dist == 1 then
				doUp(cid, poke, "fly")
				return true
			end
			
			setMoveSummon(cid, false)
			addEvent(doMovePokeToPos, 200, poke, topos)
			setPlayerStorageValue(poke, orderTalks["fly"].storage, 1)
		end 
		----------------- Ditto ----------------- 
	elseif isMonster(item2.uid) and isInArray({"Shiny Ditto", "Ditto"}, getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")) then
		
		if isPlayer(item2.uid) and getPlayerStorageValue(cid, 55006) >= 1 then 
			return doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL)
		end
		if #getCreatureSummons(cid) > 1 then
			repeat
				doRemoveCreature(getCreatureSummons(cid)[#getCreatureSummons(cid)])
			until(#getCreatureSummons(cid) == 1)
		end
		if isPlayerSummon(cid, item2.uid) and isInArray({"Shiny Ditto", "Ditto"}, getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")) and not isInArray({"Shiny Ditto", "Ditto"}, getItemAttribute(getPlayerSlotItem(cid, 8).uid, "copyName")) then 
			doCopyPokemon(poke, getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke"), true)
			doPlayerSay(cid, getCreatureNick(getCreatureSummons(cid)[1])..", reverta-se.")
			-- -- Shiny Ditto Change Color hehe
			local pkD = getCreatureSummons(cid)[1]
			shColor = math.random(0, 132)
			shColor2 = math.random(0, 132)
			if isInArray({"shiny ditto"}, getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")) then 
				doSetCreatureOutfit(pkD, {lookType = getCreatureOutfit(pkD).lookType, lookBody = shColor2, lookLegs = shColor}, -1)
			end
			doSendPlayerExtendedOpcode(cid, 95, '12//,hide')
			return true
			
		elseif not isPlayerSummon(cid, item2.uid) and getPokeName(item2.uid) ~= getPokeName(poke) then 
			
			if isSummon(item2.uid) then
				if getPlayerSlotItem(getCreatureMaster(item2.uid), 8).uid ~= 0 and isInArray({"Shiny Ditto", "Ditto"}, getItemAttribute(getPlayerSlotItem(getCreatureMaster(item2.uid), 8).uid, "poke")) then
					doPlayerSendCancel(cid, "Você não pode fazer uma copia de um outro ditto.")
					return true 
				end
			end
			
			local thingName = doCorrectString(getCreatureName(item2.uid))
			if pokes[thingName].level > getPlayerLevel(cid) then
				doPlayerSendCancel(cid, "Você não tem level para copiar este pokémon.")
				return true 
			end
			doCopyPokemon(poke, thingName, true)
			doSendPlayerExtendedOpcode(cid, 95, '12//,show')
			return true 
			
		end
		
		
		----------------- Mover ----------------- 
	elseif not isCreature(item2.uid) then
		setMoveSummon(cid, false)
		doEreaseUsingOrder(poke)
		local oldTopos = getThingPos(item2.uid)
		local oldTopos_2 = topos
		local x, y = 0, 0
		
		if (topos.x - getThingPos(poke).x) > 0 then
			topos.x = topos.x +1
		elseif (topos.x - getThingPos(poke).x) < 0 then
			topos.x = topos.x -1
		end
		if (topos.y - getThingPos(poke).y) > 0 then
			topos.y = topos.y +1 
		elseif (topos.y - getThingPos(poke).y) < 0 then
			topos.y = topos.y -1
		end 	
		
		setPlayerStorageValue(poke, 505, getThingPos(cid).x)
		setPlayerStorageValue(poke, 506, getThingPos(cid).y)
	
		addEvent(doMovePokeToPos, 5, poke, topos)
		doWalkAgain(poke)	
		local calculo = tonumber(getDistanceBetween(getThingPos(poke), topos)) * 7 * 60
		addEvent(setMoveSummon, calculo, cid, true)		
		
		----- EdiÃ§Ãµes dig/cut/rock smash/headbutt/blink
		local buracos = {468, 481, 483} 
		local arvores = {2767, 2768} 
		local pedras = {1285, 1290, 3615} 
		local headbutt = {2707} 
		
		if item2.uid == 0 then return true end
		local pos = getThingPos(item2.uid)
		local dist = getDistanceBetween(getThingPos(poke), getThingPos(item2.uid)) 
		local heldy = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "yHeldItem") or ""
		local heldName, heldTier = string.explode(heldy, "|")[1] or "", string.explode(heldy, "|")[2]		
		 
			if isInArray(buracos, item2.itemid) then ----------------------- DIG
				if string.find(habilidades, "dig") or (heldy and heldName == "Y-Dig") then	
					doMarkedPos(poke, getThingPos(item2.uid))
					doEreaseUsingOrder(cid)
					setPlayerStorageValue(poke, orderTalks["dig"].storage, 1)
					setMoveSummon(cid, false)
					
					if dist <= 3 then
						recheck(poke, "dig", getThingPos(item2.uid))
					else 
						addEvent(doMovePokeToPos, 200, poke, topos)
					end
					
					doCreatureSay(cid, getCreatureNick(poke)..orderTalks["dig"].talks[math.random(#orderTalks["dig"].talks)], 20)	
				else
					doPlayerSendCancel(cid, "Esse pokemon não tem a habilidade de cavar.")
				end				
				return true
			elseif isInArray(arvores, item2.itemid) then 		
				if string.find(habilidades, "cut") or (heldy and heldName == "Y-Cut") then
					doMarkedPos(poke, getThingPos(item2.uid))
					doEreaseUsingOrder(cid)
					setPlayerStorageValue(poke, orderTalks["cut"].storage, 1)
					setMoveSummon(cid, false)
				
					if dist <= 3 then
						addEvent(recheck, (1000 - (2.3*getCreatureSpeed(poke))) * dist, poke, "cut", getThingPos(item2.uid))
					else 
						addEvent(doMovePokeToPos, 200, poke, topos)
					end
				
					doCreatureSay(cid, getCreatureNick(poke)..orderTalks["cut"].talks[math.random(#orderTalks["cut"].talks)], 20)
				else
					doPlayerSendCancel(cid, "Esse pokemon não tem a habilidade de cortar.")
				end
				return true
			elseif isInArray(pedras, item2.itemid) then ----------------------- ROCK			
				if string.find(habilidades, "rock smash") or (heldy and heldName == "Y-Smash") then			
					local pos = getThingPos(item2.uid)
					doMarkedPos(poke, getThingPos(item2.uid))
					doEreaseUsingOrder(cid)
					setPlayerStorageValue(poke, orderTalks["rock"].storage, 1)
					setMoveSummon(cid, false)
				
					if dist <= 3 then
						addEvent(recheck, (1000 - (2.3*getCreatureSpeed(poke))) * dist, poke, "rock", getThingPos(item2.uid))
					else 
						addEvent(doMovePokeToPos, 200, poke, topos)
					end
				
					doCreatureSay(cid, getCreatureNick(poke)..orderTalks["rock"].talks[math.random(#orderTalks["rock"].talks)], 20)
				else
					doPlayerSendCancel(cid, "Esse pokemon não tem a habilidade de quebrar.")
				end
				return true		
			elseif isInArray(headbutt, item2.itemid) then ----------------------- HEAD				
				if string.find(habilidades, "headbutt") or (heldy and heldName == "Y-Headbutt") then
					local pos = getThingPos(item2.uid)
					doMarkedPos(poke, getThingPos(item2.uid))
					doEreaseUsingOrder(cid)
					setPlayerStorageValue(poke, orderTalks["headbutt"].storage, 1)
					setMoveSummon(cid, false)
					
					if dist <= 1 then
						addEvent(recheck, (1000 - (2.3*getCreatureSpeed(poke))) * dist, poke, "headbutt", getThingPos(item2.uid))
					else 
						addEvent(doMovePokeToPos, 200, poke, topos)
					end
					
					doCreatureSay(cid, getCreatureNick(poke)..orderTalks["headbutt"].talks[math.random(#orderTalks["headbutt"].talks)], 20)
				else
					doPlayerSendCancel(cid, "Esse pokemon nao tem a habilidade de balancar Arvores.")
				end
				return true
			end	
		if string.find(habilidades, "blink") then
			if getPlayerStorageValue(cid, 432423) - os.time() > 0 then
				doCreatureSay(cid, getCreatureNick(poke)..orderTalks["move"].talks[math.random(#orderTalks["move"].talks)], 20)
				doPlayerSendCancel(cid, "Você precisa esperar "..convertTime(getPlayerStorageValue(cid, 432423) - os.time()).." para usar o blink novamente!")
				return true
			elseif (getCreatureSkullType(cid) == SKULL_WHITE or getPlayerStorageValue(cid, 55006) >= 1 ) and getTileInfo(getThingPos(item2.uid)).protection then 
				doPlayerSendCancel(cid, "Você não pode usar blink em protection zone quando está em duelo.")
				return true
			elseif not isWalkable(getThingPos(item2.uid)) then
				doPlayerSendCancel(cid, "Isso não é possível.")
				return true
			end
			
			local heldx = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "xHeldItem")
			
			if heldx then
				local heldName, heldTier = string.explode(heldx, "|")[1], string.explode(heldx, "|")[2]
				if heldName == "X-Blink" then -- do Wing
					timerBlink = 12
				end
			else
				timerBlink = 40
			end				
			
			setPlayerStorageValue(cid, 432423, os.time()+timerBlink)
			doSendMagicEffect(getThingPos(poke), 134) 
			doTeleportThing(poke, getThingPos(item2.uid), false)
			doSendMagicEffect(getThingPos(poke), 134)
			doCreatureSay(cid, getCreatureNick(poke)..orderTalks["blink"].talks[math.random(#orderTalks["blink"].talks)], 20)
			
			return true
		end
		
		doCreatureSay(cid, getCreatureNick(poke)..orderTalks["move"].talks[math.random(#orderTalks["move"].talks)], 20)
		
	end 
	return true
end

function isGhost(cid)
	local hab = getPokemonSkills(string.lower(getPokeName(cid)))
	if string.find(hab, "ghost") then
		return true
	end
	return false
end