local function checkTaskByDrazyn(cid, target)
	for a, b in pairs(taskStorages) do
		if getPlayerStorageValue(cid, b) ~= -1 and getPlayerStorageValue(cid, b) ~= 1 then
			local tab = string.explode(getPlayerStorageValue(cid, b), "|")
			
			local count = 0
			local cont = false
			local str = {}
			local str1 = {}
			local expe = {}
			
			for a, b in pairs(tab) do
				if b:find(target) then
					cont = true
					count = a
				end
			end
			
			if cont then
				cont = true
				for i = 2, #tab do
					expe = tab[i]:explode(",")
					if (tonumber(expe[2]) - 1) > 0 then
						if i == count then
							table.insert(str, {expe[1], tonumber(expe[2])- 1})
							if (tonumber(expe[2])- 1) > 0 then
								cont = false
							end
						else
							table.insert(str, {expe[1], tonumber(expe[2])})
							cont = false
						end
					end
					
					if i == count then
						if (expe[2] - 1) > 0 then
							table.insert(str1, (tonumber(expe[2]) - 1) .." "..expe[1]..((tonumber(expe[2]) - 1) > 1 and "s" or ""))
						end
					else
						if (expe[2] - 1) > 0 then
							table.insert(str1, expe[2].." "..expe[1]..(tonumber(expe[2]) > 1 and "s" or ""))
						end
					end
				end
				
				--[[local skills = string.explode(tab[2], "/")
				skills[1] = tonumber(skills[1]) + 1	]]
				if cont then
					doPlayerSendTextMessage(cid, 20, tab[1]..": Parabéns! Você terminou a minha task.")
				else
					doPlayerSendTextMessage(cid, 20, tab[1]..": Está faltando você matar "..doConcatTable(str1, ", ", " e ")..".")
				end
				local str2 = {}
				for a, b in pairs(str) do
					table.insert(str2, table.concat(b, ",").."|")
				end
				
				setPlayerStorageValue(cid, b, tab[1].."|"..table.concat(str2))
				
			end
			
		end
	end
end

local stoneEffect = {
	["fire stone"] = 268,
	["water stone"] = 269,
	["leaf stone"] = 270,
	["heart stone"] = 271,
	["thunder stone"] = 272,
	["venom stone"] = 273,
	["enigma stone"] = 962, -- 274 (shiny stone)
	["rock stone"] = 275,
	["earth stone"] = 276,
	["ice stone"] = 277,
	["darkness stone"] = 278,
	["punch stone"] = 279,
	["coccon stone"] = 280,
	["metal stone"] = 281,
	["ancient stone"] = 282,
	["crystal stone"] = 283, -- antiga crystal stone
	["feather stone"] = 284,
	["shiny stone"] = 285,
}

function doSendLootChannel(cid, itemid, poke)
	if isStone(itemid) or isFrag(itemid) or isRare(itemid) then
		for _, oid in ipairs(getPlayersOnline()) do
			doPlayerSendChannelMessage(oid, "Loot System", "O jogador [".. getCreatureName(cid) .."] matou um "..poke.." e dropou um ".. getItemNameById(itemid) ..".", TALKTYPE_CHANNEL_W, 12)
		end	
	end
end

local function doCorpseAddLoot(name, item, cid, target) -- essa func j?? vai ajudar em um held, luck.
	
	if cid == target then 
		doItemSetAttribute(item, "corpseowner", "asçdlkasçldkaçslkdçaskdçaslkdçlsakdçkaslç")
		return true 
	end
	
	local lootList = getMonsterLootList(name)
	local isStoneDroped = false
	name = doCorrectString(name)
	local pokeName = name
	local megaID, megaName = "", ""
	local lootListNow = {}
	local oldLootList = {}
	local oldChance = 0
	local stringLucky = ""
	local id, count, chance = 0,0,0
	local percent = 0
	local str, vir = string.format("Loot from %s: ", name), 0
	
	if isMega(target) then
		if name == "Charizard" then
			megaID = getPlayerStorageValue(target, storages.isMegaID)
		end
		megaName = "Mega " .. name .. (megaID ~= "" and " " .. megaID or "")
		str = "Loot from " .. megaName .. ": "
		pokeName = megaName
		local t = {id = megasConf[megaName].itemToDrop, count = 1, chance = 32} -- 32 oficial, 50 durante o beta. 50 = 10% ((chance*2)/10)
		table.insert(lootList, t)
	end
	
	local luckyItems, NormalItems = {}, {}
	
	for a, loot in pairs(lootList) do
		
		heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "xHeldItem") or ""	
		
		if isNpc(cid) then
			heldx = getItemAttribute(getPlayerSlotItem(getNpcMaster(cid), 8).uid, "xHeldItem") or ""
		elseif isSummon(cid) then
			heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "xHeldItem") or ""
		end
		
		local heldName = string.explode(heldx, "|")[1] or ""
		local heldTier = string.explode(heldx, "|")[2] or ""

		itemid = loot.id
		Itemchance = loot.chance * 2
		
		if isStone(itemid) then
			Itemchance = Itemchance * rateStone	
		elseif isFrag(itemid) then
			Itemchance = Itemchance * rateFrag
		else
			Itemchance = Itemchance * rateLoot
		end
		
			if heldx and heldName == "X-Lucky" then
				local chance = heldLucky[tonumber(heldTier)]
				if math.random(1, 100) <= chance then
					if Itemchance >= math.random(1, 1000) then
					lootCount = math.random(1, loot.count)
				
						if isStone(itemid) then
							isStoneDroped = true
							local posCorpse = getThingPos(item)
							posCorpse.x = posCorpse.x +1
							doSendMagicEffect(posCorpse, stoneEffect[getItemNameById(itemid):lower()])
							posCorpse.y = posCorpse.y +1
							addEvent(doSendMagicEffect, 2000, posCorpse, 285)	
							doSendLootChannel(cid, itemid, name)
						elseif isToken(itemid) then
							local posCorpse = getThingPos(item)
							posCorpse.x = posCorpse.x +1
							doSendMagicEffect(posCorpse, 963) -- token effect
							posCorpse.y = posCorpse.y +1
							addEvent(doSendMagicEffect, 2000, posCorpse, 285)	
							doSendLootChannel(cid, itemid, name)		
						elseif isFrag(itemid) then
							local posCorpse = getThingPos(item)
							posCorpse.x = posCorpse.x +1
							doSendMagicEffect(posCorpse, 964) -- frag effect
							posCorpse.y = posCorpse.y +1
							addEvent(doSendMagicEffect, 2000, posCorpse, 285)	
							doSendLootChannel(cid, itemid, name)	
						elseif isRare(itemid) then
							local posCorpse = getThingPos(item)
							posCorpse.x = posCorpse.x +1
							doSendMagicEffect(posCorpse, stoneEffect[getItemNameById(itemid):lower()])
							posCorpse.y = posCorpse.y +1
							addEvent(doSendMagicEffect, 2000, posCorpse, 285)		
							doSendLootChannel(cid, itemid, name)						
						end 
						
						if item then
							doAddContainerItem(item, itemid, lootCount)
						end
						
						local lootStringCount = ""
						
						if (lootCount > 1) then
							lootStringCount = string.format(" (%s)",lootCount)
						end	
						
						table.insert(luckyItems, string.format("%s%s", getItemNameById(itemid), lootStringCount))
					end
				end
			end

		
		if Itemchance >= math.random(1, 1000) then
			lootCount = math.random(1, loot.count)
			if isStone(itemid) then
				isStoneDroped = true
				local posCorpse = getThingPos(item)
				posCorpse.x = posCorpse.x +1
				doSendMagicEffect(posCorpse, stoneEffect[getItemNameById(itemid):lower()])
				posCorpse.y = posCorpse.y +1
				addEvent(doSendMagicEffect, 2000, posCorpse, 285)		
				doSendLootChannel(cid, itemid, name)				
			elseif isToken(itemid) then
				local posCorpse = getThingPos(item)
				posCorpse.x = posCorpse.x +1
				doSendMagicEffect(posCorpse, 963) -- token effect
				posCorpse.y = posCorpse.y +1
				addEvent(doSendMagicEffect, 2000, posCorpse, 285)	
				doSendLootChannel(cid, itemid, name)		
			elseif isFrag(itemid) then
				local posCorpse = getThingPos(item)
				posCorpse.x = posCorpse.x +1
				doSendMagicEffect(posCorpse, 964) -- frag effect
				posCorpse.y = posCorpse.y +1
				addEvent(doSendMagicEffect, 2000, posCorpse, 285)	
				doSendLootChannel(cid, itemid, name)	
			elseif isRare(itemid) then
				local posCorpse = getThingPos(item)
				posCorpse.x = posCorpse.x +1
				doSendMagicEffect(posCorpse, stoneEffect[getItemNameById(itemid):lower()])
				posCorpse.y = posCorpse.y +1
				addEvent(doSendMagicEffect, 2000, posCorpse, 285)		
				doSendLootChannel(cid, itemid, name)							
			end 
			
			if item then
				doAddContainerItem(item, itemid, lootCount)	
			end
			
			local lootStringCount = ""
			
			if (lootCount > 1) then
				lootStringCount = string.format(" (%s)", lootCount)
			end
			
			table.insert(NormalItems, getItemNameById(itemid)..lootStringCount)			
		end
	end
	
	if #NormalItems == 0 and #luckyItems == 0 then
		str = str .. "Nothing."
	else
		if #NormalItems > 0 then
			str = str.. doConcatTable(NormalItems, ", ", " and ")..". "
		end
		
		if #luckyItems > 0 then
			str = str.. "\nLucky Items: "..doConcatTable(luckyItems, ", ", " and ").."."
		end
	end			
	
	if getExpByMoreDano(target) == true then
		return true
	end
	
	local players = string.explode(getExpByMoreDano(target), "|")
	local xp = getPokemonExperienceD(name) * (isHoenn(name) and 1.30 or 1) / 2 -- 2 por causa da nova formula de xp.
	local maiorPercent = 0
	local playerWinner = ""
	
	if players ~= nil then	
		for i = 1, #players do
			local name = string.explode(players[i], "/")[1] or ""
			local percent = tonumber(string.explode(players[i], "/")[2]) or ""
			if percent > maiorPercent then
				playerWinner = name
				maiorPercent = percent
			end
		--	if #players > 1 and percent >= 1000 then
			--	percent = 100 / tonumber(#players)
		--	end
			if #players == 1 then -- caso so um player matou o bixo
				percent = 100
			end
			local player = getPlayerByName(name)
			playerAddExp1(player, math.ceil(percent * xp / 100))
		end
	end
	
	local pWinnerLoot = getPlayerByName(playerWinner)	
	if isCreature(pWinnerLoot) then
		--checkDirias(pWinnerLoot, pokeName)
		doItemSetAttribute(item, "corpseowner", playerWinner)
		doItemSetAttribute(item, "aid", 43242)
		
		local loot = str .. (str == "Loot from ".. name .. ": " and "Nothing." or "")
		doPlayerSendTextMessage(pWinnerLoot, MESSAGE_INFO_DESCR, loot)
		if isStoneDroped then
			doSendMagicEffect(getThingPos(pWinnerLoot), 173, pWinnerLoot)
		end
	end
end

function getPlayerStage(cid)
	local lvl = getPlayerLevel(cid)
	if lvl < 19 then
		mult = 10
	elseif lvl >= 20 and lvl < 25 then
		mult = 9.5
	elseif lvl >= 25 and lvl < 30 then
		mult = 9.0	
	elseif lvl >= 30 and lvl < 35 then
		mult = 8.5	
	elseif lvl >= 35 and lvl < 40 then
		mult = 8.0	
	elseif lvl >= 40 and lvl < 45 then 
		mult = 7.5	
	elseif lvl >= 45 and lvl < 50 then
		mult = 7 
	elseif lvl >= 50 and lvl < 55 then
		mult = 6.5 
	elseif lvl >= 55 and lvl < 60 then
		mult = 5.5 
	elseif lvl >= 60 and lvl < 65 then
		mult = 5
	elseif lvl >= 65 and lvl < 75 then
		mult = 4.5 
	elseif lvl >= 75 and lvl < 80 then
		mult = 3.5
	elseif lvl >= 80 and lvl < 120 then
		mult = 3.0
	elseif lvl >= 120 and lvl <= 150 then
		mult = 2.5 -- 0.45
	elseif lvl >= 151 and lvl <= 180 then
		mult = 2	
	elseif lvl >= 181 and lvl <= 225 then
		mult = 1
	elseif lvl >= 226 and lvl <= 275 then
		mult = 0.5	
	elseif lvl >= 276 and lvl <= 325 then
		mult = 0.3
	elseif lvl >= 326 and lvl < 380 then
		mult = 0.2									
	else 
		mult = 0.03
	end
	return mult
end

function getPlayerExperienceToThis(cid, exp, hasDamaged)
	local experience = exp * getPlayerStage(cid)
	experience = experience + (experience * getPlayerTotalExtraExperience(cid))
	if hasDamaged then
		local heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "xHeldItem")
		local heldExp = 0
		if heldx then
			local heldName, heldTier = string.explode(heldx, "|")[1] or "", string.explode(heldx, "|")[2] or ""
			if heldName == "X-Experience" then -- dar mais experiencia
				heldExp = heldExperience[tonumber(heldTier)]
			end
		end
		experience = experience + ((exp * getPlayerStage(cid)) * heldExp)
	end
	return math.floor(experience * rateExp) 
end
	
function playerAddExp1(cid, exp)
	
	if exp <= 0 then return true end
	
	local multiply = 1
	
	if not isCreature(cid) then return true end
	
	if isInParty(cid) and getPlayerStorageValue(cid, 4875498) == 1 then
		local partyPlayers = getPartyMembers(getPlayerParty(cid))
		
		local menor = 1000000000
		local maior = 1
		
		for a, player in pairs(partyPlayers) do
			if isPlayer(player) then
				if getPlayerLevel(player) > maior then
					maior = getPlayerLevel(player)
				end
				if getPlayerLevel(player) < menor then
					menor = getPlayerLevel(player)
				end			
			end
		end

		if #partyPlayers == 2 then
			multiply = 0.65
		elseif #partyPlayers == 4 then
			multiply = 0.40
		else
			multiply = 0.30
		end

		--	heldExp = 1
		for a, player in pairs(partyPlayers) do
			if isPlayer(player) then
				if player == cid then
					local exp1 = math.floor(getPlayerExperienceToThis(player, exp, true) * multiply)
					doPlayerAddExp(player, exp1)
					doPlayerSendCancel(player, "Você ganhou ".. exp1 .." de experiência.")
					doSendAnimatedText(getThingPos(player), exp1, 215)
				else
					if (maior - menor) <= 15 then
						local exp1 = math.floor(getPlayerExperienceToThis(player, exp, false) * multiply)
						doPlayerAddExp(player, exp1)
						doPlayerSendCancel(player, "Você acaba de ganhar ".. exp1 .." de experiência pela party.")
						doSendAnimatedText(getThingPos(player), exp1, 215)
					end	
				end
			end
		end	
		return true
	else
		exp = getPlayerExperienceToThis(cid, exp, true)
		doPlayerSendCancel(cid, "Você acaba de ganhar ".. exp .." de experiência.")
		doPlayerAddExp(cid, exp)
		doSendAnimatedText(getThingPos(cid), exp, 215)
	end
end

local function doSendMsgInParty(cid, loot)
	if isInPartyAndSharedExperience(cid) then
		local partyPlayers = getPartyMembers(getPlayerParty(cid))
		for i = 1, #partyPlayers do
			if isPlayer(partyPlayers[i]) then
				doSendMsgToPartyChannel(partyPlayers[i], loot)
			end
		end
		return true
	end
end

local function checkDirias(cid, nameDeath)
	
	local master = (isSummon(cid) and getCreatureMaster(cid) or isNpc(cid) and getNpcMaster(cid)) or cid
	local pokeTask1 = tostring(getPlayerStorageValue(master, 24001))
	local pokecount = tonumber(getPlayerStorageValue(master, 24003) <= 0 and 1 or getPlayerStorageValue(master, 24003))
	
	if pokeTask1 ~= -1 and pokeTask1 == nameDeath then
		setPlayerStorageValue(master, 24003, pokecount+1)
		if pokecount >= getKillCount(master) then
			doPlayerSendTextMessage(master, 20, "[Daily Kill]: Você concluiu minha task, venha pegar sua recompensa.")
			setKillCatched(master, true)
		else
			doPlayerSendTextMessage(master, 20, "[Daily Kill]: Faltam " .. getKillCount(master) - pokecount.. " " .. nameDeath .. (pokecount > 1 and "s" or "") .. ".")
		end
	end
	
end

function doKillWildPoke(cid, target)
	if isSummon(target) and isPlayer(getCreatureMaster(target)) then
		
		checkGiveUp(getCreatureMaster(target))
		doSendPlayerExtendedOpcode(getCreatureMaster(target), 95, '12//,hide')
		doUpdateMoves(getCreatureMaster(target))
		doKillPlayerPokemon(target)
		doSendPlayerExtendedOpcode(getCreatureMaster(target), opcodes.OPCODE_POKEMON_HEALTH, "0|0")
		doRemoveCreature(target)
		
	elseif isWild(target) then
	
	local Pokeboss = {
		["Milotic"] = {storage = 27201},
		["Magmortar"] = {storage = 27202},
		["Electivire"] = {storage = 27203},
		["Dusknoir"] = {storage = 27204},
		["Milotic"] = {storage = 27205},
		["Rhyperior"] = {storage = 27206},
		["Metagross"] = {storage = 27207},
		["Salamence"] = {storage = 27208},
		["Slaking"] = {storage = 27209},
		["Tangrowth"] = {storage = 27210}
	}
	
		if getPlayerStorageValue(target, 637500) >= 1 then -- sherdder team
			doRemoveCreature(target)
			return true
		end	
		
		local nameDeath = doCorrectString(getCreatureName(target))
		local pos = getThingPos(target)
		local corpseID = getPokemonCorpse(nameDeath)
		local bossName = Pokeboss[nameDeath]
		local posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+5 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
		if not isWalkable(posC1) then
			posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 	
		else
			posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+5 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
		end		
						
		if corpseID ~= 0 then
			local corpse = doCreateItem(corpseID, 1, pos)
			if isNpc(getCreatureMaster(target)) then
				doRemoveItem(corpse, 1)
				corpse = nil
			end
			
			if isSummon(cid) or isNpc(cid) then
				checkDirias(cid, nameDeath)
				if isNpc(cid) then
					checkTaskByDrazyn(getNpcMaster(cid), nameDeath)		
				else
					checkTaskByDrazyn(getCreatureMaster(cid), nameDeath)
				end
			end
			
			if isSummon(cid) then
				if isWild(target) and bossName then
					local contagem = getPlayerStorageValue(getCreatureMaster(cid), bossName.storage) <= 0 and 1 or getPlayerStorageValue(getCreatureMaster(cid), bossName.storage)
					setPlayerStorageValue(getCreatureMaster(cid), bossName.storage, contagem + 1)
					doPlayerSendTextMessage(getCreatureMaster(cid), 20, "Você já matou no total ["..contagem.."] "..getCreatureName(target)..".")
				end		
			end
			
			if getPlayerInGolden(getCreatureMaster(cid)) then
				local goldenpoints = math.random(100)
				addSurvivalPoints(getCreatureMaster(cid), goldenpoints)
				doPlayerSendTextMessage(getCreatureMaster(cid), 20, "Você ganhou "..goldenpoints.." Survival Points após derrotar o "..getCreatureName(target)..".")
			end
			
			if getPlayerStorageValue(getCreatureMaster(cid), 2154600) >= 1 then 
				if getPlayerStorageValue(getCreatureMaster(cid), 43144) - os.time() > 0 then
					doAddExpClan(getCreatureMaster(cid), 2, math.random(100)) 
				else
					doAddExpClan(getCreatureMaster(cid), 1, math.random(100)) 
				end
			end
				
			if isNpc(cid) then
				if getPlayerStorageValue(getNpcMaster(cid), 2154600) >= 1 then
					if getPlayerStorageValue(getNpcMaster(cid), 43144) - os.time() > 0 then
						doAddExpClan(getNpcMaster(cid), 2, math.random(100))
					else
						doAddExpClan(getNpcMaster(cid), 1, math.random(100))
					end
				end
			end

			if isNpc(cid) then
				doKillBossTower(getNpcMaster(cid), target)
			else
				doKillBossTower(getCreatureMaster(cid), target)
			end

			local function doShiny(pos, name, mode)
				if pos and name then
					name = "Shiny "..name
					
					if not pokes[name] then 
						return true 
					end	
					
					doSendMagicEffect(pos, 21) 
					doCreateMonsterNick(cid, name, retireShinyName(name), pos, false)
				end	
			end

			if isPokeTower(target) then
				if isNpc(cid) then
					doMsgKillTower(getNpcMaster(cid))
				else
					doMsgKillTower(getCreatureMaster(cid))
				end	
			end	
			
			doQuestMonster(target) -- MPV Quests
			setContractFinish(target, getCreatureMaster(cid)) -- Brotherhood
	
-- // Charm System // --
			
			local charmchance = 35
			
			if isNpc(cid) and not isSummon(target) and not getCreatureName(target):find("Shiny ") and isShinyCharm(getCreatureName(target)) then
				if getPlayerStorageValue(getNpcMaster(cid), 4125) - os.time() > 0 then
					if math.random(1, 1000) <= charmchance or isGod(getNpcMaster(cid)) then	
						addEvent(doShiny, 5 * 1000, posC1, nameDeath)
						doPlayerSendTextMessage(getNpcMaster(cid), 20, "[Shiny Charm]: Irá nascer em 5 segundos um Shiny "..getCreatureName(target)..".")		
					end
				end
			end
			
			if isWild(target) and not getCreatureName(target):find("Shiny ") and isShinyCharm(getCreatureName(target)) then
				if getPlayerStorageValue(getCreatureMaster(cid), 4125) - os.time() > 0 then
					if math.random(1, 1500) <= charmchance or isGod(getCreatureMaster(cid)) then	
						addEvent(doShiny, 5 * 1000, posC1, nameDeath)
						doPlayerSendTextMessage(getCreatureMaster(cid), 20, "[Shiny Charm]: Irá nascer em 5 segundos um Shiny "..getCreatureName(target)..".")		
					end
				end
			end	

-- // Charm System // --
					
			if corpse and not isSummon(target) then
				
				doItemSetAttribute(corpse, "pokeName", "fainted " .. nameDeath:lower())
				
				if nameDeath:find("Smeargle") then
					doItemSetAttribute(corpse, "smeargleID", getPlayerStorageValue(target, storages.SmeargleID))
				end
				
					doDecayItem(corpse)
				
				local name = getCreatureName(getCreatureMaster(cid))
				
				if isNpc(cid) then
					doCorpseAddLoot(getCreatureName(target), corpse, getNpcMaster(cid), target)
				else
					doCorpseAddLoot(getCreatureName(target), corpse, getCreatureMaster(cid), target)
				end
				
			end
		end
		
		if isSummon(cid) then
			doSendPlayerExtendedOpcode(getCreatureMaster(cid), 57,  "nothing|0|0")
		end	
			
		doRemoveCreature(target)	
	end	
end