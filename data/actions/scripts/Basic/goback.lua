local EFFECTS = {
	--[OutfitID] = {Effect}
	["Magmar"] = 35, 
	["Shiny Magmar"] = 35,
	["Shiny Magmortar"] = 35,
	["Shiny Electivire"] = 48,
	["Magmortar"] = 35,
	["Electivire"] = 48,	
	["Jynx"] = 17, --alterado v1.5
	["Shiny Jynx"] = 17, 
	["Piloswine"] = 205, --alterado v1.8
	["Swinub"] = 205, 
}

function onUse(cid, item, frompos, item2, topos)
	
	if exhaustion.get(cid, 6666) and exhaustion.get(cid, 6666) > 0 then return true end
	if isRiderOrFlyOrSurf(cid) then return true end
	
	if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 
	or getPlayerStorageValue(cid, 75846) >= 1 or getPlayerStorageValue(cid, 5700) >= 1 then --alterado v1.9 <<
		return true 
	end
	
	local ballName = getItemAttribute(item.uid, "poke")
	local btype = getPokeballType(item.itemid)
	local usando = pokeballs[btype].use
	
	local effect = pokeballs[btype].effect
	if not effect then
		effect = 21
	end
	
	unLock(item.uid) --alterado v1.8
	
	if item.itemid == usando and #getCreatureSummons(cid) > 0 then 
		local summon = getCreatureSummons(cid)[1]
		if getPlayerStorageValue(summon, 9658783) == 1 and isInArray({"Aggron", "Sudowoodo", "Mega Aggron"}, getCreatureName(summon)) then
			doKillWildPoke(getCreatureSummons(cid)[1], getCreatureSummons(cid)[1])
			doPlayerSendCancel(cid, "O pokémon está morto.")
			if getPlayerStorageValue(cid, 55006) >= 1 then 
				doRemoveCountPokemon(cid)
			end
			return true
		end
		
		if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then --alterado v1.6
			if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then 
				BackTeam(cid) 
			end
		end 

		if getPlayerStorageValue(cid, 141410) >= 1 then
			return true
		end		
		
		if getPlayerStorageValue(cid, 58496) >= 1 then
			if isInArray(pokeballs[btype].all, item.itemid) then
				doReturnPokemon(cid, item, false)					
				doSendPlayerExtendedOpcode(getCreatureMaster(cid), 95, '12//,hide') --alterado v1.7
				doUpdateMoves(getCreatureMaster(cud))				
				doTransformItem(item.uid, pokeballs[btype].off)
				doItemSetAttribute(item.uid, "hp", 0)
				doPlayerSendCancel(cid, "O pokémon está morto.")
				return true
			end
		end
		
		if #getCreatureSummons(cid) <= 0 then
			if isInArray(pokeballs[btype].all, item.itemid) then			
				doTransformItem(item.uid, pokeballs[btype].off)
				doItemSetAttribute(item.uid, "hp", 0)
				doPlayerSendCancel(cid, "O pokémon está morto.")
				return true
			end
		end	
		
		local cd = getCD(item.uid, "blink", 30)
		if cd > 0 then
			setCD(item.uid, "blink", 0)
		end
				
		local z = getCreatureSummons(cid)[1]
		
		if getCreatureCondition(z, CONDITION_INVISIBLE) and not isGhostPokemon(z) then
			return true
		end
		
		checkGiveUp(cid)
		
		doReturnPokemon(cid, item, false)
		doSendPlayerExtendedOpcode(cid, 95, '12//,hide')
		doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_DITTO_MEMORY, "sair") -- ditto memory system
		doSendPlayerExtendedOpcode(cid, 56,  "false")
		
	elseif item.itemid == pokeballs[btype].on then
		
		if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
			doPlayerSendCancel(cid, "You must put your pokeball in the correct place!")
			return TRUE
		end
		
		-- rever a seguranca do pokemon ser sumanado com 0 de hp
		
		local pokemon = getItemAttribute(item.uid, "poke")
		
		if not pokes[pokemon] then
			return true
		end
	
		----------------------- Sistema de nao poder carregar mais que 3 pokes lvl baixo e + q 1 poke de lvl medio/alto ---------------------------------
		if not isInArray({5, 6}, getPlayerGroupId(cid)) then
			local balls = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)
			local low = {}
			local lowPokes = {"Rattata", "Caterpie", "Weedle", "Oddish", "Pidgey", "Paras", "Poliwag", "Bellsprout", "Magikarp", "Hoppip", "Sunkern"}
			if #balls >= 1 then
				for _, uid in ipairs(balls) do
					local nome = getItemAttribute(uid, "poke")
					if not isInArray(lowPokes, pokemon) and nome == pokemon and not isGod(cid) then
						return doPlayerSendTextMessage(cid, 27, "Atenção, você não pode usar pokémons iguais.")
					else
						if nome == pokemon then
							table.insert(low, nome)
						end
					end
				end
			end
			if #low >= 3 then
				return doPlayerSendTextMessage(cid, 27, "Atenção, você não pode usar pokémons iguais.")
			end 
		end
		---------------------------------------------------------------------------------------------------------------------------------------------------
		
		local x = pokes[pokemon]
		local boost = getItemAttribute(item.uid, "boost") or 0
		
		if getPlayerLevel(cid) < (x.level+boost) then
			doPlayerSendCancel(cid, "Você precisa ser do level "..(x.level+boost).." para usar esse pokémon.")
			return true
		end
					
		---------------------------- Sistema pokes de clan --------------------------------------
		local shinysClan = {
			["Shiny Fearow"] = {4, "Wingeon"},
			["Shiny Flareon"] = {1, "Volcanic"},
			["Shiny Vaporeon"] = {2, "Seavel"}, 
			["Shiny Jolteon"] = {9, "Raibolt"},
			["Shiny Hypno"] = {7, "Psycraft"}, 
			["Shiny Golem"] = {3, "Orebound"},
			["Shiny Vileplume"] = {8, "Naturia"},
			["Shiny Nidoking"] = {5, "Malefic"},
			["Shiny Hitmontop"] = {6, "Gardestrike"}, --alterado v1.4
			["Shiny Hitmonlee"] = {6, "Gardestrike"}, --alterado v1.4
			["Shiny Hitmonchan"] = {6, "Gardestrike"}, --alterado v1.4
		}

		if shinysClan[pokemon] and getPlayerGroupId(cid) < 4 then --alterado v1.9 \/
			if getPlayerClanNum(cid) ~= shinysClan[pokemon][1] then
				doPlayerSendCancel(cid, "Você precisa ser membro do clan "..shinysClan[pokemon][2].." para usar esse pokémon!")
				return true 
			elseif getPlayerClanRank(cid) < 2 then
				doPlayerSendCancel(cid, "Você precisa ser rank 2 para usar esse pokémon.")
				return true
			end
		end
		--------------------------------------------------------------------------------------
		local isNicked, nick = false, pokemon
		local pokeSourceCode = "sim"
		
		if getItemAttribute(item.uid, "copyName") then -- ditto system
			pokemon = getItemAttribute(item.uid, "copyName")
		end
		
		if getItemAttribute(item.uid, "nick") and getItemAttribute(item.uid, "nick") ~= "" then
			isNicked = true nick = getItemAttribute(item.uid, "nick")
			pokeSourceCode = doCreateMonsterNick(cid, pokemon, getItemAttribute(item.uid, "nick"), getThingPos(cid), true)
		elseif isInArray({"Smeargle 1", "Smeargle 2", "Smeargle 3", "Smeargle 4", "Smeargle 5", "Smeargle 6", "Smeargle 7", "Smeargle 8"}, pokemon) then
			pokeSourceCode = doCreateMonsterNick(cid, pokemon, retireSmeargleNumber(pokemon), getThingPos(cid), true) 
		else
			pokeSourceCode = doCreateMonsterNick(cid, pokemon, retireShinyName(pokemon), getThingPos(cid), true) -- chama o pokemon com nome verdadeiro, mas se for shiny ja tera seu nome alterado		
		end	
		
		if pokeSourceCode == "Nao" then
			doSendMsg(cid, "Não há espaço para seu pokemon.")
			return true 
		end	 	
	
		local pk = getCreatureSummons(cid)[1]
		
		setMoveSummon(cid, true)
		if not isCreature(pk) then return true end
		
		------------------------passiva hitmonchan------------------------------
		if isSummon(pk) then --alterado v1.8 \/
			if pokemon == "Shiny Hitmonchan" or pokemon == "Hitmonchan" then
				if not getItemAttribute(item.uid, "hands") then
					doSetItemAttribute(item.uid, "hands", 0)
				end
				local hands = getItemAttribute(item.uid, "hands")
				doSetCreatureOutfit(pk, {lookType = hitmonchans[pokemon][hands].out}, -1)
			end
		end
		-------------------------------------------------------------------------
		---------movement magmar, jynx-------------
		if EFFECTS[getCreatureName(pk)] then 
			markPosEff(pk, getThingPos(pk))
			sendMovementEffect(pk, EFFECTS[getCreatureName(pk)], getThingPos(pk)) 
		end
		
		doCreatureSetLookDir(pk, 2)	
		adjustStatus(pk, item.uid, true, true, true)
		doAntiSelfY(getCreatureMaster(pk), pk)
		doRegenerateWithY(getCreatureMaster(pk), pk)	
		doCureWithY(getCreatureMaster(pk), pk)	
		doTransformItem(item.uid, pokeballs[btype].use)
			
		local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", (isNicked and nick or retireShinyName(pokemon)))
		doCreatureSay(cid, mgo, TALKTYPE_ORANGE_1)
		
		local addon = getItemAttribute(item.uid, "addon")
		
		if addon == 0 or addon == "0" then
			doItemEraseAttribute(item.uid, "addon")
			return true
		end
		
		if addon then
			doSetCreatureOutfit(pk, {lookType = PokeAddons[getCreatureName(pk)][addon].looktype}, -1)
		end
	
		if getItemAttribute(item.uid, "aura") == "particle" then
			doCreatureSetSkullType(pk, math.random(10, 20))
		end
		
		-- Shiny Ditto Change Color hehe
		shColor = math.random(0, 132)
		shColor2 = math.random(0, 132)
		if isInArray({"shiny ditto"}, pokemon) then 
			doSetCreatureOutfit(pk, {lookType = getCreatureOutfit(pk).lookType, lookBody = shColor2, lookLegs = shColor}, -1)
		end
		--
		
		doSendMagicEffect(getCreaturePosition(pk), effect)
		doSendPlayerExtendedOpcode(cid, 95, '12//,show')
		doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_BATTLE_POKEMON, tostring(pk))
		setPokemonGhost(pk)
		
		if getCreatureName(pk):find("Smeargle") then
			local id = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "SmeargleID")
			setPlayerStorageValue(pk, storages.SmeargleID, "Smeargle " .. id) 
		end
		
		sendDittoWindow(cid, item)
		setPlayerStorageValue(cid, 141410, 1)
		addEvent(setPlayerStorageValue, 150, cid, 141410, -1)
		
		if isInArray({"Ditto", "Shiny Ditto"}, getCreatureName(getCreatureSummons(cid)[1])) then
			doSendPlayerExtendedOpcode(cid, 95, '12//,hide')
		end	
		doSendPlayerExtendedOpcode(cid, 56,  pokemon)
		
	else
		
		doPlayerSendCancel(cid, "O pokémon está morto.")
		
	end
	
	doSendLifePokeToOTC(cid)
	doUpdateMoves(cid)

	return true
end