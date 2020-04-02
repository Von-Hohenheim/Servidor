local op_crea = {
	OPCODE_SKILL_BAR = opcodes.OPCODE_SKILL_BAR,
	OPCODE_POKEMON_HEALTH = opcodes.OPCODE_POKEMON_HEALTH,
	OPCODE_BATTLE_POKEMON = opcodes.OPCODE_BATTLE_POKEMON,
	OPCODE_FIGHT_MODE = opcodes.OPCODE_FIGHT_MODE,
	OPCODE_WILD_POKEMON_STATS = opcodes.OPCODE_WILD_POKEMON_STATS,
	OPCODE_REQUEST_DUEL = opcodes.OPCODE_REQUEST_DUEL,
	OPCODE_ACCEPT_DUEL = opcodes.OPCODE_ACCEPT_DUEL,
	OPCODE_YOU_ARE_DEAD = opcodes.OPCODE_YOU_ARE_DEAD,
	OPCODE_DITTO_MEMORY = opcodes.OPCODE_DITTO_MEMORY,
}

function doCollectAll(cid, col)
	setPlayerStorageValue(cid, storages.AutoLootCollectAll, col == true and "all" or "no")
end

local rate = 200

local PosByPoke = {
	['Charizard'] = {{x=1081, y=981, z=7, imagem="20", description = "teste"}, {x=1091, y=991, z=7, imagem="10", description = "teste"}}
}

local moveDescDex = {
	["Ember"] = "Magia que causa dano!",
	["Magia Name"] = "Magia que causa dano!"
}
local STORAGEMARCAMAPA = 66698
local STORAGEVERLOOT = 66699

function haveLocation(cid, name)
	if getPlayerStorageValue(cid, STORAGEMARCAMAPA) < 1 then
		return "false"
	end
	if PosByPoke[name] then
		return "true"
	else
		return "false"
	end
end

function haveLoot(cid, name)
	if getPlayerStorageValue(cid, STORAGEVERLOOT) < 1 then
		return "false"
	end
	return print_table(getMonsterLootSpriteId(name))
end

function print_table(self) -- by vyctor17
        local str = "{"

        for i, v in pairs(self) do
                local index = type(i) == "string" and "[\"".. i .. "\"]" or "[".. i .. "]"
                local value = type(v) == "table" and print_table(v) or type(v) == "string" and "\"".. v .. "\"" or tostring(v)

                str = str .. index .. " = ".. value .. ", "
        end

        return (#str > 1 and str:sub(1, #str - 2)) .. "}"
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function onExtendedOpcode(cid, opcode, buffer)
	if opcode == op_crea.OPCODE_SKILL_BAR then
		if buffer == "refresh" then
			doOTCSendPlayerSkills(cid)
		end
	elseif opcode == 71 then
		local dados = string.explode(buffer, "|")
		local offerId = getOfferIdByCounter(dados[4], dados[5])
		if offerId then
			doSendOfflineMessage(getCreatureName(cid), dados[1], dados[2], dados[3], offerId)
			local player = getPlayerByName(dados[1])
			if player then
				doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "you receive a new offer in market")
			else
				doSendOfflineMessage2(dados[1], "you receive a new offer in market")
			end
			doSendPlayerExtendedOpcode(cid, 96, checkOfflineMessages(getCreatureName(cid), offerId))
		end
	elseif opcode == 72 then
		local dados = string.explode(buffer, "|")
		local offerId = getOfferIdByCounter(dados[1], dados[2])
		if offerId then
			doSendPlayerExtendedOpcode(cid, 96, checkOfflineMessages(getCreatureName(cid), offerId))
		end
	elseif opcode == 73 then
		local dados = string.explode(buffer, "|")
		local player = getPlayerByName(dados[1])
		if player then
			doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "you offer to "..dados[3].." was declined.")
		else
			doSendOfflineMessage2(dados[1], "you offer to "..dados[3].." was declined.")
		end
		deleteMessage(dados[1], dados[2])
	elseif opcode == 74 then
		--doSendPlayerExtendedOpcode(cid, 97, checkHistory(getPlayerGUID(cid)))
	elseif opcode == 53 then-- open nova dex
			local UID = tonumber(buffer)
			if isMonster(UID) then
				if getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(UID)) <= 5 then
					local name = getCreatureName(UID)
						if string.lower(name) == "farfetch'd" then
							name = "farfetch_d"
						end
						if string.lower(name) == "cacturn" then
							name = "cacturne"
						end
						if string.lower(name) == "nidoran male" then
							name = "nidoran_m"
						end
						if string.lower(name) == "nidoran female" then
							name = "nidoran_f"
						end
						if string.lower(name) == "shiny farfetch'd" then
							name = "shiny farfetch_d"
						end
						
						if string.find(name, "shiny") then 
							local name2 = string.explode(name, " ") 
							name = name2[2] 
						end
					
					if isInArray({"Aporygon", "Abporygon", "Big Porygon", "Tangrowth", "Magmortar", "Electivire", "Dusknoir"}, name) then
						doPlayerSendCancel(cid, "Você não pode dar dex nesse pokémon.")
						return false
					end
					
					if getPlayerDexInfo(cid, name).dex == 0 and not isShiny(UID) then
						local exp = math.random(3000, 15000)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have unlocked ".. name.." in your pokedex!")
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have gained "..exp.." experience points.")
						doPlayerAddExperience(cid, exp)
						doRegisterPokemonToDex(cid, name)
					end
				else
					doPlayerSendCancel(cid, "You are too far away to scan this pokemon")
				end
			end
			doSendPlayerExtendedOpcode(cid, 60, generateList(cid))
	elseif opcode == 55 then
			if isPlayer(cid) then
				local data = string.explode(buffer, "*")
				if data[2] == "false" then
					doSendPlayerExtendedOpcode(cid, 62, haveLoot(cid, data[1]).."*"..haveLocation(cid, data[1]).."*"..getPokemonEvolutionDescription(firstToUpper(data[1])))
				else
					doSendPlayerExtendedOpcode(cid, 62, haveLoot(cid, "Shiny "..data[1]).."*"..haveLocation(cid, data[1]).."*"..getPokemonEvolutionDescription(data[1]))
				end
			end
	elseif opcode == 69 then
		if getPlayerStorageValue(cid, STORAGEMARCAMAPA) >= 1 then
			doSendPlayerExtendedOpcode(cid, 63, print_table(PosByPoke[buffer]))
		else
			doPlayerSendCancel(cid, "You don't have permission to use that")
			print("O player: "..getCreatureName(cid).." usou o botão de localização sem permisão")
			doSendPlayerExtendedOpcode(cid, 63, "false")
		end
	elseif opcode == 173 then -- Channel
		doPlayerOpenChannel(cid, tonumber(buffer))
	elseif opcode == 151 then
	--[[	if isInParty(cid) then
			local party = getPartyMembers(cid)
			if party[#party] == cid then
				for i = 1, #party do
					if buffer == "enable" then
						setPlayerStorageValue(party[i], 4875498, 1)
						doPlayerSendTextMessage(party[i], 20, "A experiência compartilhada na party foi ativada.")
					else
						setPlayerStorageValue(party[i], 4875498, -1)
						doPlayerSendTextMessage(party[i], 20, "A experiência compartilhada na party foi desativada.")
					end
				end
			else
				doPlayerSendTextMessage(cid, 27, "Você não é o lider da party para ativar a exp compartilhada.")
			end
		else
			doPlayerSendTextMessage(cid, 27, "Você precisar ser lider de uma party para ativar a exp compartilhada.")
		end	]]--	
	elseif opcode == op_crea.OPCODE_POKEMON_HEALTH then
		if buffer == "refresh" then
			doOTCSendPokemonHealth(cid)
		end
	elseif opcode == op_crea.OPCODE_BATTLE_POKEMON then
		if buffer == "refresh" then
			if #getCreatureSummons(cid) >= 1 then
				doSendPlayerExtendedOpcode(cid, op_crea.OPCODE_BATTLE_POKEMON, tostring(getCreatureSummons(cid)[1]))
			end
		end
	elseif opcode == op_crea.OPCODE_FIGHT_MODE then
		setPlayerStorageValue(cid, storages.fightMode, tonumber(buffer))
	elseif opcode == op_crea.OPCODE_WILD_POKEMON_STATS then
		doSendPlayerExtendedOpcode(cid, op_crea.OPCODE_WILD_POKEMON_STATS, pokeStatus.getVity(tonumber(buffer)).."|"..pokeStatus.getAtk(tonumber(buffer)).."|"..pokeStatus.getSpAtk(tonumber(buffer)).."|"..pokeStatus.getDef(tonumber(buffer)).."|"..pokeStatus.getSpDef(tonumber(buffer)).."|"..pokeStatus.getSpeed(tonumber(buffer)))
		
		--//Duel
	elseif opcode == opcodes.OPCODE_REQUEST_DUEL then
		--legenda: cid = player, sid = player convidado
		local cut = string.explode(buffer, "/")
		local pokeballsCount, sid = tonumber(cut[1]), getCreatureByName(cut[2])
		
		if isCreature(sid) then 
			doIniteDuel(cid, sid, pokeballsCount)
		end

	elseif opcode == opcodes.OPCODE_ACCEPT_DUEL then
		local p2 = getCreatureByName(buffer)
		
		if isInvitedDuel(p2, cid) then
			doPantinNoDuel(cid, p2, getPlayerStorageValue(p2, duelTable.infoBalls), 5)
		end

	elseif opcode == opcodes.OPCODE_DITTO_MEMORY then
		local item = getPlayerSlotItem(cid, 8)
		if item.uid == 0 then doSendMsg(cid, "Coloque seu shiny ditto no slot correto.") return true end
		local pokeName = getItemAttribute(item.uid, "poke")
		if not pokeName:lower():find("ditto") then return true end
		
		if isInArray({"saveMemory1", "saveMemory2", "saveMemory3"}, buffer) then
			local copyName = getItemAttribute(item.uid, "copyName")
			if pokeName == copyName then doSendMsg(cid, "Transforme seu ditto primeiro.") return true end
			if not fotos[doCorrectString(copyName)] then return true end
			if isPokeInSlots(getItemAttribute(item.uid, "memoryDitto"), doCorrectString(copyName)) then doSendMsg(cid, "Esta copia já está salva em um slot.") return true end
			if buffer == "saveMemory1" then
				if getItemAttribute(item.uid, "memory") >= 2 then
					doItemSetAttribute(item.uid, "memoryDitto", saveSlot(getItemAttribute(item.uid, "memoryDitto"), 1, getItemInfo(fotos[doCorrectString(copyName)]).clientId)) -- getPortraitClientID(doCorrectString(copyName))))
				else
					doSendMsg(cid, "Este pokémon não tem memory.")
				end			
			elseif buffer == "saveMemory2" then
				if getItemAttribute(item.uid, "memory") >= 2 then
					doItemSetAttribute(item.uid, "memoryDitto", saveSlot(getItemAttribute(item.uid, "memoryDitto"), 2, getItemInfo(fotos[doCorrectString(copyName)]).clientId))
				else
					doSendMsg(cid, "Este pokémon não tem memory.")
				end
			elseif buffer == "saveMemory3" then
				if getItemAttribute(item.uid, "memory") ~= 3 then
					doSendMsg(cid, "Seu Ditto só tem os 2 primeiros slots no memory.")
				else
					doItemSetAttribute(item.uid, "memoryDitto", saveSlot(getItemAttribute(item.uid, "memoryDitto"), 3, getItemInfo(fotos[doCorrectString(copyName)]).clientId))
				end
			end
		elseif isInArray({"clearSlot1", "clearSlot2", "clearSlot3"}, buffer) then
			if buffer == "clearSlot1" then
				doItemSetAttribute(item.uid, "memoryDitto", saveSlot(getItemAttribute(item.uid, "memoryDitto"), 1, "?"))
			elseif buffer == "clearSlot2" then
				doItemSetAttribute(item.uid, "memoryDitto", saveSlot(getItemAttribute(item.uid, "memoryDitto"), 2, "?"))
			elseif buffer == "clearSlot3" then
				doItemSetAttribute(item.uid, "memoryDitto", saveSlot(getItemAttribute(item.uid, "memoryDitto"), 3, "?"))
			end
		elseif isInArray({"use1", "use2", "use3"}, buffer) then
			local summons = getCreatureSummons(cid)
			if #summons < 1 then doSendMsg(cid, "Coloque seu ditto para fora da pokeball.") return true end

			if getPlayerStorageValue(summons[1], 9658783) ~= -1 then
				doSendMsg(cid, "Você não pode copiar outro pokemon enquanto o ditto está usando Study.")
				return true
			end
			
			if getPlayerStorageValue(cid, 4324) - os.time() > 0 then
				doSendMsg(cid, "Você precisa esperar ".. getPlayerStorageValue(cid, 4324) - os.time().." segundo(s) parar poder copiar outro pokémon.")
				return true
			end
			
			local pokeToTransform = getSlot(getItemAttribute(item.uid, "memoryDitto"), tonumber(buffer:explode("use")[1]))
			doCopyPokemon(summons[1], pokeToTransform, true)
			setPlayerStorageValue(cid, 4324, 20 + os.time())
		end
		
		
		local memory = getItemAttribute(item.uid, "memoryDitto")
		if not memory or memory == nil then
			doItemSetAttribute(item.uid, "memoryDitto", "?|?|?")
			memory = getItemAttribute(item.uid, "memoryDitto")
		end
		local memoryOne, memoryTwo, memoryTree = memory:explode("|")[1], memory:explode("|")[2], memory:explode("|")[3]
		
		local str = memoryOne .. "-".. memoryTwo .."-" .. memoryTree
		doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_DITTO_MEMORY, str)
		
		
	elseif opcode == opcodes.OPCODE_TV_CAM then -- TVCam
		--doCreatePrivateChannel(cid)
		--doInviteToPrivateChannel(cid, playerName)
		--doRemoveIntoPrivateChannel(cid, playerName)
		if getGlobalStorageValue(globalsTV) == -1 then -- iniciar sistema
			setGlobalStorageValue(globalsTV, "")
		end
		local action = buffer:explode("/")[1]
		
		if action == "create" then
			createChannel(cid, buffer)
			
		elseif action == "close" then
			closeInClientChannmel(cid)
			
		elseif action == "watch" then
			
			local playerToWatch = getCreatureByName(buffer:explode("/")[2])
			if isCreature(playerToWatch) then
				if getPlayerStorageValue(playerToWatch, storages.playerTVPass) ~= "" and getPlayerStorageValue(playerToWatch, storages.playerTVPass) ~= "notASSenha" then
					doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_TV_CAM, "requestPass|" .. getPlayerStorageValue(playerToWatch, storages.playerTVPass) .. "|" .. buffer:explode("/")[2]) 
				else
					doWatch(cid, playerToWatch)
				end
			else
				doSendMsg(cid, "Este player não está mais gravando.")
			end
			
		elseif action == "watchWithPass" then
			
			local playerToWatch = getCreatureByName(buffer:explode("/")[2])
			if isCreature(playerToWatch) then
				doWatch(cid, playerToWatch)
			else
				doSendMsg(cid, "Este player não está mais gravando.")
			end
			
		elseif action == "errou" then
			doSendMsg(cid, "Senha do digitada incorreta.")
		end
		
	elseif opcode == opcodes.OPCODE_PLAYER_SHOW_AUTOLOOT then -- Autoloot
		if buffer:find("load/") then
			--local itens = getAllItensAutoLoot()	
			doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_PLAYER_SHOW_AUTOLOOT, (isCollectAll(cid) and "yes" or "no") .. "|0|0")
		elseif buffer:find("all") then
			doCollectAll(cid, true)
			doSendMsg(cid, "AutoLoot: Coletar tudo foi ativado.")
		elseif buffer:find("no") then
			doCollectAll(cid, false)
			doSendMsg(cid, "AutoLoot: Coletar tudo foi desativado.")
		end	
	elseif opcode == opcodes.OPCODE_PLAYER_SHOW_ONLINE then -- Janela de onlines do ADM
		local players = getPlayersOnline()
		local str = "online/"
		if #players > 0 then
			for _, pid in ipairs(players) do
				str = str .. getCreatureName(pid) .. "," .. getPlayerLevel(pid) .. "/"
			end
		end
		doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_PLAYER_SHOW_ONLINE, str)
		
	elseif opcode == opcodes.OPCODE_PLAYER_SHOW_TRADE_HELD then
        local op = tonumber(buffer:explode("-")[2])
        local posP = getThingPos(cid)
        local posMachine = {{x = 637, y = 704, z = 7}, {x = 653, y = 704, z = 7}}
        if not doComparePositions(posMachine[1], posP) and not doComparePositions(posMachine[2], posP) then
            doSendMsg(cid, "Você precisa estar na frente da máquina.")
           return true
        end
		
        if op == 1 then
           if doPlayerRemoveItem(cid, 15645, 20) then
		   local t1 = {17308, 17357, 17373, 17377, 17374, 17376, 15559, 15566, 15573, 15580, 15587, 15594, 15601, 15608, 15615, 17343, 17336, 17322, 17329, 17203, 15636, 17217, 17301, 17375}
		   local heldt1 = t1[math.random(#t1)] 
			  doSendMagicEffect(getThingPos(cid), 925)
		      doSendMsg(cid, "Troca realizada com sucesso!")
			  doPlayerAddItem(cid, heldt1, 1)
           else
              doSendMsg(cid, "Você precisa de 20 Devoted Tokens.")
           end
           return true 
        elseif op == 2 then
           if doPlayerRemoveItem(cid, 15646, 70) then
		      doSendMagicEffect(getThingPos(cid), 926)
		      doSendMsg(cid, "Troca realizada com sucesso!")
              local tier = math.random(1, 3)
			  if tier == 3 then
			  tier = math.random(2, 3)
			  end
              doPlayerAddRandomHeld(cid, tier)
               else
              doSendMsg(cid, "Você precisa de 70 Mighty Tokens.")
           end
           return true
        elseif op == 3 then
           if doPlayerRemoveItem(cid, 15646, 150) then
		      doSendMagicEffect(getThingPos(cid), 926)
		      doSendMsg(cid, "Troca realizada com sucesso!")
              local tier = math.random(2, 4)
			  if tier == 4 then
			  tier = math.random(3, 4)
			  end
              doPlayerAddRandomHeld(cid, tier)
               else
              doSendMsg(cid, "Você precisa de 150 Mighty Tokens.")
           end
           return true
        elseif op == 4 then
           if doPlayerRemoveItem(cid, 15646, 300) then
		      doSendMagicEffect(getThingPos(cid), 926)
		      doSendMsg(cid, "Troca realizada com sucesso!")
              local tier = math.random(4, 6)
			  if tier == 6 then
			  tier = math.random(4, 6)
				if tier == 6 then
				tier = math.random(4, 6)
				end
			  end
              doPlayerAddRandomHeld(cid, tier)
               else
              doSendMsg(cid, "Você precisa de 300 Mighty Tokens.")
           end
           return true 
        elseif op == 5 then
           if doPlayerRemoveItem(cid, 15644, 30) then
		      doSendMagicEffect(getThingPos(cid), 927)
		      doSendMsg(cid, "Troca realizada com sucesso!")
              local tier = math.random(1, 3)
              doPlayerAddRandomHeld(cid, tier)
               else
              doSendMsg(cid, "Você precisa de 30 Honored Tokens.")
           end
           return true 
        elseif op == 6 then
           if doPlayerRemoveItem(cid, 15644, 75) then
		      doSendMagicEffect(getThingPos(cid), 927)
		      doSendMsg(cid, "Troca realizada com sucesso!")
              local tier = math.random(2, 4)
              doPlayerAddRandomHeld(cid, tier)
               else
              doSendMsg(cid, "Você precisa de 75 Honored Tokens.")
           end
           return true
        elseif op == 7 then
           if doPlayerRemoveItem(cid, 15644, 150) then
		      doSendMagicEffect(getThingPos(cid), 927)
		      doSendMsg(cid, "Troca realizada com sucesso!")
              local tier = math.random(3, 6)
              doPlayerAddRandomHeld(cid, tier)
            else
              doSendMsg(cid, "Você precisa de 150 Honored Tokens.")
           end
		   
           return true 
        end

	end
end

function getSlot(strings, slot)
	local slot1, slot2, slot3 = strings:explode("|")[1], strings:explode("|")[2], strings:explode("|")[3]
	local ret, flag = "", false
	for a, b in pairs(fotos) do
		if getItemInfo(fotos[a]).clientId == tonumber(slot1) and slot == 1 then 
			ret = doCorrectString(a)
			flag = true
		elseif getItemInfo(fotos[a]).clientId == tonumber(slot2) and slot == 2 then 
			ret = doCorrectString(a)
			flag = true
		elseif getItemInfo(fotos[a]).clientId == tonumber(slot3) and slot == 3 then 
			ret = doCorrectString(a)
			flag = true
		end
		if flag then
			break
		end	
	end
	return ret
end

function saveSlot(strings, slot, poke)
	local slot1, slot2, slot3 = strings:explode("|")[1], strings:explode("|")[2], strings:explode("|")[3]
	local finalSlots = (slot == 1 and poke .. "|" or slot1 .. "|") .. (slot == 2 and poke .. "|" or slot2 .. "|") .. (slot == 3 and poke .. "|" or slot3)
	return finalSlots
end

function isPokeInSlots(strings, poke)
	if not fotos[poke] then return false end
	poke = getItemInfo(fotos[poke]).clientId
	local slot1, slot2, slot3 = strings:explode("|")[1], strings:explode("|")[2], strings:explode("|")[3]
	if tonumber(slot1) == poke then
		return true
	elseif tonumber(slot2) == poke then
		return true
	elseif tonumber(slot3) == poke then
		return true
	end
	return false
end