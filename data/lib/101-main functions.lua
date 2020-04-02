--// Edicioes DarkXPoke \\- 
farwayPos = {x = 2, y = 1, z = 15}

function isCastform(cid)
	if not isCreature(cid) then return true end
	if isInArray("Castform", "Castform Fire", "Castform Ice", "Castform Water", doCorrectString(getCreatureName(cid))) then
		return true
	end
	return false
end

function doTransformCastform(cid, castType)

local config = {
["Fire"] = {outfit = {looktype = 1012}, name = "Castform Fire"},
["Water"] = {outfit = {looktype = 1013}, name = "Castform Water"},
["Ice"] = {outfit = {looktype = 1014}, name = "Castform Ice"}
}

local cfg = config[castType]
local sid = getCreatureMaster(cid)

if not cfg then return true end
if not isPlayer(sid) then return true end

if isSummon(cid) then
	doRemoveCreature(cid)
	doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "poke", cfg.name)	
	pokesource = doCreateMonsterNick(sid, cfg.name, "Castform", getThingPos(sid), true) 
	adjustStatus(pokesource, getPlayerSlotItem(sid, 8).uid, true, true, true)
	doUpdateMoves(sid)	
end

	return true
end

function getExpByMoreDano(cid)
	if not isCreature(cid) then return "" end
	local listPlayers = ""
	local life = getCreatureMaxHealth(cid)
	local str = getPlayerStorageValue(cid, storages.damageKillExp)
	if str == -1 then return true end -- self destruct
	--if isNpc(cid) then return true end -- npc
	local players = string.explode(str, "|")
	
	local strEnd, mairDano = "", 0
	if players ~= nil then
		for i = 1, #players do
			local name = string.explode(players[i], "/")[1]
			local dano = string.explode(players[i], "/")[2]
			listPlayers = listPlayers .. name .. "/" .. (dano * 100 / life) .. "|"
		end
	end
	return listPlayers
end

function isCollectAll(cid)
   return getPlayerStorageValue(cid, storages.AutoLootCollectAll):find("all") and true or false
end

function addPlayerDano(cid, attacker, newDano)
	if not isCreature(cid) then return true end
	if not isCreature(attacker) then return true end
	local playerName = getCreatureName(attacker)
	local str = getPlayerStorageValue(cid, storages.damageKillExp)
	if str == -1 then
		setPlayerStorageValue(cid, storages.damageKillExp, playerName .. "/" .. newDano .. "|")	
		return true
	end
	local players = string.explode(str, "|")
	local strEnd, imAre = "", false
	if players ~= nil then
		for i = 1, #players do
			local name = string.explode(players[i], "/")[1]
			local dano = string.explode(players[i], "/")[2]
			
			if name == playerName then
				strEnd = strEnd .. name .. "/" .. dano + newDano .. "|"
				imAre = true
			else
				strEnd = strEnd .. name .. "/" .. dano .. "|"
			end
			
		end
		if not imAre then
			strEnd = strEnd .. playerName .. "/" .. newDano .. "|"
		end
		setPlayerStorageValue(cid, storages.damageKillExp, strEnd)
	end		
	
end

function removeSpellInXML(name, spell)
	if isInArray({"Big Porygon", "Castform", "Castform Fire", "Castform Water", "Castform Ice", "Absol", "Electivire", "Dusknoir", "Magmortar", "Milotic", "Slaking", "Tangrowth", "Salamence", "Metagross", "Rhyperior", "Smeargle", "Charizard", "Blastoise", "Venusaur", "Pinsir", "Alakazam", "Gyarados", "Gengar", "Slowbro", "Kangaskhan", "Pidgeot", "Aerodactyl", "Beedrill"}, name) then return false end -- megas 
	local path = "data/monster/pokes/geracao 1/"..name..".xml"
	local tpw = io.type(io.open(path))
	if not tpw then
		path = "data/monster/pokes/geracao 2/"..name..".xml"
		tpw = io.type(io.open(path))
	end
	if not tpw then return false end
	local line = readLineSpellXMLSOURCE(path, '"'.. spell ..'"')
	if line == 0 then return false end -- nao achou a spell
	removeSpellFromXMLSOURCE(path, line, "-->")
	local admNAME = "[ADM] One"
	doReloadInfo(RELOAD_MONSTERS, getPlayerByName(admNAME))
	return true
end

function removeSpellFromXMLSOURCE(filename, linha, texto)
	
	local hFile = io.open(filename, "r") --Reading.
	local lines = {}
	local restOfFile
	local lineCt = 1
	for line in hFile:lines() do
		if(lineCt == linha) then --Is this the line to modify?
			lines[#lines + 1] = "<!-- Magina nao pertence a esse pokemon " .. line .. " " .. texto --Modify line by appending a string to the end.
			restOfFile = hFile:read("*a")
			break
		else
			lineCt = lineCt + 1
			lines[#lines + 1] = line
		end
	end
	hFile:close()
	
	hFile = io.open(filename, "w") --Write the file.
	for i, line in ipairs(lines) do
		hFile:write(line, "\n")
	end
	hFile:write(restOfFile)
	hFile:close()
	
end
function readLineSpellXMLSOURCE(filename, texto)
	
	local hFile = io.open(filename, "r") --Reading.
	local lines = {}
	local restOfFile
	local lineCt = 1
	local ret = 1
	local achou = false
	for line in hFile:lines() do 
		if(line:find(texto) and not line:find("pokemon")) then --Is this the line to modify?
			ret = ret 
			achou = true
			break
		else
			ret = ret + 1
		end
	end
	hFile:close()
	if not achou then
		return 0
	end
	return ret
	
end

function setPokemonGhost(cid)
	if not isCreature(cid) then return true end
	if isInArray(pokesGhosts, doCorrectString(getCreatureName(cid))) then
		-- doCreatureSetSkullType(cid, 5)
	end
	if isSummon(cid) then
		local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
		if getItemAttribute(item.uid, "yHeldItem") and getItemAttribute(item.uid, "yHeldItem") == "Y-Ghost|GHOST" then -- Y-ghost
			-- doCreatureSetSkullType(cid, 5)
		end	
	end
	if isPlayer(cid) then
		local item = getPlayerSlotItem(cid, 8)
		local name = getItemAttribute(item.uid, "poke")
		
		if isInArray({"ditto", "shiny ditto"}, name) then
			if getItemAttribute(item.uid, "copyName") then
				name = getItemAttribute(item.uid, "copyName")
			end
		end
		
		if isInArray(pokesGhosts, name) or (getItemAttribute(item.uid, "yHeldItem") and getItemAttribute(item.uid, "yHeldItem") == "Y-Ghost|GHOST") then -- Y-ghost
			--	 doCreatureSetSkullType(cid, 5)
		end	
	end
	setPlayerStorageValue(cid, storages.isPokemonGhost, 1)
end

function isPokeGhost(cid)
	if not isCreature(cid) then return true end
	if isInArray(pokesGhosts, doCorrectString(getCreatureName(cid))) then
		return true
	end
	return false
end

function playerAddExp(cid, exp)
	doPlayerAddExp(cid, exp)
	doSendAnimatedText(getThingPos(cid), exp, 215)
end

function getTableMove(name, moveName)
	local x = movestable[doCorrectString(name)]
	if not x then return "" end
	
	local z = "\n"
	local tables = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12}
	for i = 1, #tables do
		if tables[i].name == moveName then
			return tables[i]
		end
	end
end 

function getMoveForce(name, moveName)
	local x = movestable[doCorrectString(name)]
	if not x then return "" end
	
	local z = "\n"
	local tables = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12}
	for i = 1, #tables do
		if tables[i].name == moveName then
			return tables[i].f
		end
	end
end 

function retireShinyName(str)
	if string.find(str, "Shiny") then
		return str:match("Shiny (.*)") 
	end
	return str
end	 

function retireCastformName(str)
	if string.find(str, "Fire") or string.find(str, "Ice") or string.find(str, "Water") then
		return str:match("(.*) Fire") or str:match("(.*) Ice") or str:match("(.*) Water")
	end
	return str
end	 

function retireSmeargleNumber(str)
	if string.find(str, "1") or string.find(str, "2") or string.find(str, "3") or string.find(str, "4") or string.find(str, "5") or string.find(str, "6") or string.find(str, "7") or string.find(str, "8")then
		return str:match("(.*) 1") or str:match("(.*) 2") or str:match("(.*) 3") or str:match("(.*) 4") or str:match("(.*) 5") or str:match("(.*) 6") or str:match("(.*) 7") or str:match("(.*) 8")
	end
	return str
end	 

function isReflect(cid)
	return getPlayerStorageValue(cid, storages.reflect) >= 1
end

function removeReflect(cid)
	if not isCreature(cid) then return true end
	if getPlayerStorageValue(cid, storages.reflect) >= 1 then -- reflect system
		setPlayerStorageValue(cid, storages.reflect, getPlayerStorageValue(cid, storages.reflect) -1)
	end
end

function OutfitKecleon(cid, element)

local outfit = getCreatureOutfit(cid)

local config = {
[1] = {combat = FIREDAMAGE, skin = {lookType = outfit.lookType, lookHead = 75, lookBody = 37, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[2] = {combat = NORMALDAMAGE, skin = {lookType = outfit.lookType, lookHead = 43, lookBody = 60, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[3] = {combat = FIGHTINGDAMAGE, skin = {lookType = outfit.lookType, lookHead = 39, lookBody = 1, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[4] = {combat = WATERDAMAGE, skin = {lookType = outfit.lookType, lookHead = 49, lookBody = 11, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[5] = {combat = FLYINGDAMAGE, skin = {lookType = outfit.lookType, lookHead = 38, lookBody = 0, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[6] = {combat = GRASSDAMAGE, skin = {lookType = outfit.lookType, lookHead = 119, lookBody = 81, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[7] = {combat = POISONDAMAGE, skin = {lookType = outfit.lookType, lookHead = 72, lookBody = 34, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[8] = {combat = ELECTRICDAMAGE, skin = {lookType = outfit.lookType, lookHead = 79, lookBody = 41, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[9] = {combat = GROUNDDAMAGE, skin = {lookType = outfit.lookType, lookHead = 116, lookBody = 78, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[10] = {combat = PSYCHICDAMAGE, skin = {lookType = outfit.lookType, lookHead = 35, lookBody = 24, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[11] = {combat = ROCKDAMAGE, skin = {lookType = outfit.lookType, lookHead = 76, lookBody = 21, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[12] = {combat = ICEDAMAGE, skin = {lookType = outfit.lookType, lookHead = 85, lookBody = 0, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[13] = {combat = BUGDAMAGE, skin = {lookType = outfit.lookType, lookHead = 82, lookBody = 94, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[14] = {combat = DRAGONDAMAGE, skin = {lookType = outfit.lookType, lookHead = 41, lookBody = 3, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[15] = {combat = GHOSTDAMAGE, skin = {lookType = outfit.lookType, lookHead = 127, lookBody = 51, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[16] = {combat = DARKDAMAGE, skin = {lookType = outfit.lookType, lookHead = 114, lookBody = 89, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}},
[17] = {combat = STEELDAMAGE, skin = {lookType = outfit.lookType, lookHead = 7, lookBody = 38, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}}
}	

	for _, array in pairs(config) do
		if element == array.combat then
			doSetCreatureOutfit(cid, array.skin, -1)		
		end
	end
	
end

function getMoveType(name, moveName)
	local x = movestable[doCorrectString(name)]
	if not x then return "" end
	
	local z = "\n"
	local tables = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12}
	for i = 1, #tables do
		if tables[i].name == moveName then
			return tables[i].t
		end
	end
	return true
end 

function isGod(cid)
	if isPlayer(cid) then 
		if getPlayerGroupId(cid) >= 6 then
			return true 
		end
		return false
	end
end

function isADM(cid)
	if isPlayer(cid) then 
		if getPlayerGroupId(cid) >= 15 then
			return true 
		end
		return false
	end
end

function doKillPlayer(cid, attacker, hit)

	if not isCreature(cid) then return true end
	
	demountPokemon(cid, true)
	
	local myName, attackerName = getCreatureName(cid), getCreatureName(attacker) 
	
	if canWalkOnPos(getThingPos(cid), false, true, true, true, true) then
		if getPlayerSex(cid) == 1 then
			local corpse = doCreateItem(3058, 1, getThingPos(cid))
			doDecayItem(corpse)
			doItemSetAttribute(corpse, "iname", "\nYou recognize ".. myName ..". He was killed by a ".. attackerName .."")
		elseif getPlayerSex(cid) == 0 then	 
			local corpse = doCreateItem(3065, 1, getThingPos(cid))
			doDecayItem(corpse)
			doItemSetAttribute(corpse, "iname", "\nYou recognize ".. myName ..". She was killed by a ".. attackerName .."")
		end
	end
	
	local exp = math.ceil(-(getPlayerExperience(cid) * 0.025))
	
	if isPremium(cid) then
		exp = exp * 0.20
		doPlayerSendTextMessage(cid, 20, "Solo perdió el 20% de la experiencia que habría perdido si no fuera Premium.")
	end
	
	if getPlayerInGolden(cid) then
		exp = exp * 0
		removeConditionArena(cid)
		doPlayerSendTextMessage(cid, 20, "[Survival Arena]: Você resistiu bastante, mas infelizmente fracassou em sobreviver a Survival Arena!")	
	end
	
	if getPlayerStorageValue(cid, 244787) >= 1 then
		exp = exp * 0
		doTeleportThing(cid, {x = 925, y = 1535, z = 6})
		setPlayerStorageValue(cid, 244787, -1) 
	end

	if getPlayerStorageValue(cid, 2154600) >= 1 then
		doTeleportFinish(cid)
	end
	
	if getPlayerInTower(cid) then		
		exp = exp * 0
		removeCondTower(cid)
		setPlayerStorageValue(cid, 252526, -1) -- travar revive
		setPlayerStorageValue(cid, 252525, -1)
		setPlayerStorageValue(cid, 21108, -1)
		doTeleportThing(cid, {x=2506, y=243, z=7})
		doPlayerSendTextMessage(cid, 20, "[Embedded Tower]: Você morreu e não foi capaz de concluir a tower, mas não perdeu XP no processo!")		
	end
	
	if getPlayerStorageValue(cid, 245678) >= 1 then	
		for _, oid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(oid, 245678) >= 1 then
				exp = exp * 1.15
				setGlobalStorageValue(254000, 0)
				setPlayerStorageValue(oid, 245678, -1)
				doTeleportThing(oid, {x = 606, y = 1172, z = 8}, true)
				doCreatureAddHealth(oid, getCreatureMaxHealth(cid))
				setPlayerStorageValue(oid, 245680, 2 * 24 * 60 * 60 + os.time())
				doPlayerSendTextMessage(oid, 20, "[Clones]: O player "..getCreatureName(cid).." morreu durante a quest tente novamente em 2 dias!")
			end
		end	
		return false
	end
		
	if getPlayerStorageValue(cid, 245681) >= 1 then	
		for _, oid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(oid, 245681) >= 1 then
				exp = exp * 1.15
				setPlayerStorageValue(oid, 245681, -1)
				doTeleportThing(oid, {x = 645, y = 722, z = 15}, true)
				setPlayerStorageValue(oid, 245682, 1 * 24 * 60 * 60 + os.time())
				doCreatureAddHealth(oid, getCreatureMaxHealth(cid))
				doPlayerSendTextMessage(oid, 20, "[Brotherhood]: O player "..getCreatureName(cid).." morreu durante a quest tente novamente em 1 dias!")
			end
		end	
		return false
	end
	
	local expBless = 0
	
	if getPlayerBlessPercent(cid) > 0 then
		expBless = exp * getPlayerBlessPercent(cid)
		doPlayerSendTextMessage(cid, 20, "Você usou sua Bless de "..getPlayerBlessPercent(cid) * 100 .."%. Recomendamos que compre outra para não perder mais experiência.")
	end

	if getPlayerStorageValue(cid, 2525252525) >= 1 then
		setPlayerStorageValue(cid, 2525252525, -1)
		setPlayerStorageValue(cid, 465456701, -1)
	end
	
	if getPlayerStorageValue(cid, 154585) >= 1 then 
		setPlayerStorageValue(cid, 154585, -1)
	end
	
	doPlayerAddExperience(cid, (exp - expBless) * (exp > 1 and -1 or 1))
	setPlayerStorageValue(cid, 50405, -1)
	setPlayerStorageValue(cid, 123124, -1)	
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doRegainSpeed(cid)
	setPlayerStorageValue(cid, orderTalks["ride"].storage, -1)
	setPlayerStorageValue(cid, orderTalks["fly"].storage, -1)
	
	local townName = getTownName(getPlayerTown(cid))
	
	if townName then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end

	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	doRemoveCondition(cid, CONDITION_INFIGHT)
	return false
end

function doRemoveCreatureWithS(cid)
	if not isCreature(cid) then return true end
	doRemoveCreature(cid)
end

function doKillPlayerPokemon(cid)
	local deathtexts = {"Oh no! POKENAME, come back!", "Come back, POKENAME!", "That's enough, POKENAME!", "You did well, POKENAME!", "You need to rest, POKENAME!", "Nice job, POKENAME!", "POKENAME, you are too hurt!"}
	local master = getCreatureMaster(cid)
	local thisball = getPlayerSlotItem(master, 8)
	local ballName = getItemAttribute(thisball.uid, "poke")
	
	if isShredTEAM(cid) then -- sherdder team
		doRemoveCreature(cid)
		return true
	end	
	
	if not isCreature(cid) or not isCreature(master) then return true end
	
	if isInArray({"Castform Water", "Castform Ice", "Castform Fire"}, ballName) then
		doSetItemAttribute(thisball.uid, "poke", "Castform")
		return true
	end	
	
	if #getCreatureSummons(master) > 1 then
		BackTeam(master, getCreatureSummons(master)) 
	end
	
	if getPlayerStorageValue(master, 55006) >= 1 then 
		doRemoveCountPokemon(master)
	end
	
	doSendMagicEffect(getThingPos(cid), pokeballs[getPokeballType(thisball.itemid)].effect) -- rever isso aqui
	doTransformItem(thisball.uid, pokeballs[getPokeballType(thisball.itemid)].off)
	
	local say = deathtexts[math.random(#deathtexts)]
	say = string.gsub(say, "POKENAME", getCreatureName(cid))
	doCreatureSay(master, say, TALKTYPE_ORANGE_1)
	
	doItemSetAttribute(thisball.uid, "hpToDraw", 0)
end

function getPokemonType(cid)
	if isPlayer(cid) then return false end -- seguranca do player nao atacar
	local name = doCorrectString(getCreatureName(cid))
	if not pokes[name] then return print("getPokemonType(cid): O pokemon " .. name .. " nao tem um tipo efetivo.") end
	local types = {}
	types.type1 = pokes[name].type
	types.type2 = pokes[name].type2	
	return types
end

function getElementByCombat(combat)
	local element = "normal"
	for a, b in pairs(typeTable) do
		if(b.damageID == combat)then
			element = a
			break
		end
	end
	return element
end

------ Funcoes de efetividades ----------

function getPokemonOutfitToSkill(pokeName)
	if flys[pokeName] then
		return flys[pokeName][1]
	elseif rides[pokeName] then
		return rides[pokeName][1]
	else 
		return surfs[pokeName].lookType
	end
end

function getPokemonSpeedToSkill(pokeName)
	if flys[pokeName] then
		return flys[pokeName][2]
	elseif rides[pokeName] then
		return rides[pokeName][2]
	else 
		return surfs[pokeName].speed
	end
end

function getPokemonSkills(pokeName) 
	local str = ""
	for a, b in pairs(specialabilities) do
		for i = 1, #b do
			if(b[i] == pokeName) then
				str = str .. (str == "" and "" or ", ") .. a
			end
		end 
	end
	return str
end

function demountPokemon(cid, kill)
	if not isCreature(cid) then return false end
	if not isRiderOrFlyOrSurf(cid) then return false end
	local ball = getPlayerSlotItem(cid, 8)
	doEreasPlayerOrder(cid)
	if kill == true then
		doTransformItem(ball.uid, pokeballs[getPokeballType(ball.itemid)].off)
	else	
		doGoPokemon(cid, ball, false)
		doRemoveCondition(cid, CONDITION_OUTFIT)
		doCreatureSay(cid, getCreatureNick(getCreatureSummons(cid)[1]) .. orderTalks["downability"].talks[math.random(#orderTalks["downability"].talks)], 20)	
		setPlayerStorageValue(cid, orderTalks["ride"].storage, -1)
		setPlayerStorageValue(cid, orderTalks["fly"].storage, -1)
		doChangeSpeed(cid, -getCreatureSpeed(cid))			
		doChangeSpeed(cid, 325)		
		doPlayerSendCancel(cid, '12//,show')	
	end
end

function getCreatureDirectionToTarget(cid, target)
	if not isCreature(cid) then return true end
	if not isCreature(target) then return getCreatureLookDir(cid) end
	
	local dirs = {
		[NORTHEAST] = {NORTH, EAST},
		[SOUTHEAST] = {SOUTH, EAST},
		[NORTHWEST] = {NORTH, WEST},
		[SOUTHWEST] = {SOUTH, WEST}
	}
	
	local direction = getDirectionTo(getThingPos(cid), getThingPos(target), false)
	if direction <= 3 then
		return direction
	else
		local xdistance = math.abs(getThingPos(cid).x - getThingPos(target).x)
		local ydistance = math.abs(getThingPos(cid).y - getThingPos(target).y)
		if xdistance > ydistance then
			return dirs[direction][2]
		elseif ydistance > xdistance then
			return dirs[direction][1]
		elseif isInArray(dirs[direction], getCreatureLookDir(cid)) then
			return getCreatureLookDir(cid)
		else
			return dirs[direction][math.random(1, 2)]
		end
	end
end

function doOTCSendPokemonHealth(cid)
	local ball = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local pokemon = getCreatureSummons(cid)
	if not ball.uid or ball.uid <= 1 then
		return doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_POKEMON_HEALTH, "0|0")
	end
	if #pokemon >= 1 then
		return doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_POKEMON_HEALTH, getCreatureHealth(pokemon[1]).."|"..getCreatureMaxHealth(pokemon[1]))
	end
	return doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_POKEMON_HEALTH, getBallHealth(cid, ball).."|"..getBallMaxHealth(cid, ball))
end

function portraitSendLifeOTC(cid, ball)
	if not isCreature(cid) then return true end
	if ball.uid and ball.uid ~= 0 then 
		return doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_POKEMON_HEALTH, getBallHealth(cid, ball).."|"..getBallMaxHealth(cid, ball))
	else
		return doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_POKEMON_HEALTH, "0|0")
	end
end

function doTransformPokeballIcon(cid, item, isGoingToGround)	
	----------------- Icon system -----------------
	if isGoingToGround then -- jogando no chao	
		if isContainer(item.uid) then
			local bag = item.uid
			for i = 1, #getPokeballsInContainer(bag) do
				local ballNow = getPokeballsInContainer(bag)[i]
				local ids = getPokeballs_ITEMS_ID_InContainer(bag)[i]
				
				if getItemAttributeWithSecurity(ballNow, "unique") == 'true' then
					return true
				end
				
				if not getItemAttribute(ballNow, "reverseIcon")	then -- bug fix
					doItemSetAttribute(ballNow, "reverseIcon", "poke")
				end
				if isPokeballOn(ids) then 
					doTransformItem(ballNow, pokeballs[getItemAttributeWithSecurity(ballNow, "reverseIcon")].on)
				elseif isPokeballOff(ids) then
					doTransformItem(ballNow, pokeballs[getItemAttributeWithSecurity(ballNow, "reverseIcon")].off)
				end
				
				doItemSetAttribute(ballNow, "ehDoChao", true)
			end
		elseif isPokeball(item.itemid) then
			
			if getItemAttributeWithSecurity(item.uid, "unique") == 'true' then
				return true
			end
			
			if not getItemAttribute(item.uid, "reverseIcon") then -- bug fix
				doItemSetAttribute(item.uid, "reverseIcon", "poke")
			end
			
			local pokeNamesBall = ""
			if not pokeballs[getItemAttributeWithSecurity(item.uid, "reverseIcon") or "poke"] then	
				print("Icon bugou: main function.lua [524]")	
				return true
			end
			
			if isPokeballOn(item) then 
				doTransformItem(item.uid, pokeballs[getItemAttributeWithSecurity(item.uid, "reverseIcon") or "poke"].on)
			elseif isPokeballOff(item) then
				doTransformItem(item.uid, pokeballs[getItemAttributeWithSecurity(item.uid, "reverseIcon") or "poke"].off)
			end
			
			doItemSetAttribute(item.uid, "ehDoChao", true)
		end
	else
		if item and item.uid and isContainer(item.uid) then
			local bag = item.uid
			for i = 1, #getPokeballsInContainer(bag) do
				local ballNow = getPokeballsInContainer(bag)[i]
				local pokeName = string.lower(getItemAttributeWithSecurity(ballNow, "poke"))
				local ids = getPokeballs_ITEMS_ID_InContainer(bag)[i]
				
				if isPokeballOn(ids) then 
					doTransformItem(ballNow, pokeballs[pokeName].on)
				elseif isPokeballOff(ids) then
					doTransformItem(ballNow, pokeballs[pokeName].off)
				end
				doItemSetAttribute(ballNow, "ehDoChao", false)
			end
		elseif isPokeball(item.itemid) then
			local pokeName = string.lower(getItemAttributeWithSecurity(item.uid, "poke"))
			if isPokeballOn(item) then 
				doTransformItem(item.uid, pokeballs[pokeName].on)
			elseif isPokeballOff(item) then
				doTransformItem(item.uid, pokeballs[pokeName].off)
			end
		end
	end
	----------------- Icon system ----------------- 
end

function doSetAttributesBallsByPokeName(cid, ball, name)
	name = doCorrectString(name)
	local bTypeName = getItemAttribute(ball, "ball")
	if string.find(name, "Shiny") then
		bTypeName = "shiny" .. bTypeName
	end
	
	doItemSetAttribute(ball, "poke", name)
	doItemSetAttribute(ball, "ballEffe", bTypeName)
	doItemSetAttribute(ball, "hpToDraw", 0)
	doItemSetAttribute(ball, "Icon", name:lower())
	doItemSetAttribute(ball, "reverseIcon", bTypeName)
	doItemSetAttribute(ball, "pokeDeath", false)
	doItemSetAttribute(ball, "initialKit", true)
	
	if not pokes[name] then
		print("Pokemon nao existe: " .. name)
		return true
	end
	local pokeLifeMax = pokes[name].life 
	local masterLevel = getPlayerLevel(cid)
	local lifePercentByLevel = 100 * masterLevel + (pokes[name].vitality * masterLevel)
	if(pokes[name].level < 60) then
		lifePercentByLevel = pokes[name].vitality * masterLevel * ( masterLevel > 60 and 1.5 or 1 )
	end
	local life = pokeLifeMax + lifePercentByLevel
	setBallHealth(ball, life, life)
end


function getPokeName(cid)
	if not isCreature(cid) then return "" end
	return getPlayerStorageValue(cid, 510) or getCreatureName(cid)
end

function isFight(cid)
	if getCreatureCondition(cid, CONDITION_INFIGHT) then
		return true
	end
	return false
end

function setBallHealth(ball, health, maxHealth)
	doItemSetAttribute(ball, "hpNow", health)
	doItemSetAttribute(ball, "hpMax", maxHealth)
end

function getBallHealth(cid, ball)
	for a, b in pairs (pokeballs) do
		if ball.itemid == b.off then
			return 0
		end
	end
	if not getItemAttribute(ball.uid, "hpNow") then
		doSetAttributesBallsByPokeName(cid, ball.uid, getItemAttribute(ball.uid, "poke"))
	end
	local healthNow = getItemAttribute(ball.uid, "hpNow")
	return math.floor(healthNow)
end

function getBallHealthProtect(cid, ball) -- sam, pra segurança no revive caso bug a ball
	for a, b in pairs (pokeballs) do
		if ball.itemid == b.off then
			return 0
		end
	end
	for a, b in pairs (pokeballs) do
		if (ball.itemid == b.use and #getCreatureSummons(cid) <= 0) and ( getItemAttribute(ball.uid, "hpNow") > 0 ) and ( getItemAttribute(ball, "hpMax") ~= getItemAttribute(ball.uid, "hpNow") ) then
			return 0
		end
	end
	
	local healthNow = getItemAttribute(ball.uid, "hpNow")
	return math.floor(healthNow)
end


function getBallMaxHealthUnique(cid, ball)
	if not getItemAttribute(ball, "hpMax") then
		doSetAttributesBallsByPokeName(cid, ball, getItemAttribute(ball, "poke"))
	end
	local healthNow = getItemAttribute(ball, "hpMax")
	return math.floor(healthNow)
end

function getBallMaxHealth(cid, ball)
	if not getItemAttribute(ball.uid, "hpMax") then
		doSetAttributesBallsByPokeName(cid, ball.uid, getItemAttribute(ball.uid, "poke"))
	end
	local healthNow = getItemAttribute(ball.uid, "hpMax")
	return math.floor(healthNow)
end

function doSetPokeballLifeStatus(item, health, maxHealth)
	doItemSetAttribute(item.uid, "hpNow", health)
	doItemSetAttribute(item.uid, "hpMax", maxHealth)
end

function doSendLifePokeToOTC(cid)
	local ball = getPlayerSlotItem(cid, 8)
	local pk = getCreatureSummons(cid)
	if #pk <= 0 then return true end
	if ball.uid ~= 0 then
		doSetPokeballLifeStatus(ball, getCreatureHealth(pk[1]), getCreatureMaxHealth(pk[1]))
		doOTCSendPokemonHealth(cid)
	end
end

------------------------------------------ Skill Bar OTC
function doOTCSendPlayerSkills(cid)
	local str = {}
	table.insert(str, 0)--getPlayerClan(cid))
	table.insert(str, "|"..0)--getPlayerCasinoCoins(cid))
	table.insert(str, "|"..getPlayerKantoCatches(cid).."|"..getPlayerTotalCatches(cid))
	table.insert(str, "|"..getPlayerWins(cid).."|"..getPlayerLoses(cid).."|"..getPlayerOfficialWins(cid).."|"..getPlayerOfficialLoses(cid).."|"..getPlayerPVPScore(cid))
	table.insert(str, "|"..getPlayerBadgeOfLeader(cid, "Brock"))
	table.insert(str, ";"..getPlayerBadgeOfLeader(cid, "Misty"))
	table.insert(str, ";"..getPlayerBadgeOfLeader(cid, "Surge"))
	table.insert(str, ";"..getPlayerBadgeOfLeader(cid, "Erika"))
	table.insert(str, ";"..getPlayerBadgeOfLeader(cid, "Sabrina"))
	table.insert(str, ";"..getPlayerBadgeOfLeader(cid, "Koga"))
	table.insert(str, ";"..getPlayerBadgeOfLeader(cid, "Blaine"))
	table.insert(str, ";"..getPlayerBadgeOfLeader(cid, "Giovanni"))
	return doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_SKILL_BAR, table.concat(str))
end

------------------------------------------ Catches
function doPlayerAddInKantoCatchs(cid, value)
	return setPlayerStorageValue(cid, storages.playerKantoCatches, getPlayerKantoCatches(cid) + value)
end

function getPlayerKantoCatches(cid)
	return getPlayerStorageValue(cid, storages.playerKantoCatches) == -1 and 0 or getPlayerStorageValue(cid, storages.playerKantoCatches)
end

function doPlayerAddInTotalCatchs(cid, value)
	return setPlayerStorageValue(cid, storages.playerTotalCatches, getPlayerTotalCatches(cid) + value) and doOTCSendPlayerSkills(cid)
end

function getPlayerTotalCatches(cid)
	return getPlayerStorageValue(cid, storages.playerTotalCatches) == -1 and 0 or getPlayerStorageValue(cid, storages.playerTotalCatches)
end

------------------------------------------ Duels and PVP
function doPlayerAddInWins(cid, value)
	return setPlayerStorageValue(cid, storages.playerWins, getPlayerWins(cid) + value) and doOTCSendPlayerSkills(cid)
end

function getPlayerWins(cid)
	return getPlayerStorageValue(cid, storages.playerWins) == -1 and 0 or getPlayerStorageValue(cid, storages.playerWins)
end

function doPlayerAddInLoses(cid, value)
	return setPlayerStorageValue(cid, storages.playerLoses, getPlayerLoses(cid) + value) and doOTCSendPlayerSkills(cid)
end

function getPlayerLoses(cid)
	return getPlayerStorageValue(cid, storages.playerLoses) == -1 and 0 or getPlayerStorageValue(cid, storages.playerLoses)
end

function doPlayerAddInOfficialWins(cid, value)
	return setPlayerStorageValue(cid, storages.playerOfficialWins, getPlayerOfficialWins(cid) + value) and doOTCSendPlayerSkills(cid)
end

function getPlayerOfficialWins(cid)
	return getPlayerStorageValue(cid, storages.playerOfficialWins) == -1 and 0 or getPlayerStorageValue(cid, storages.playerOfficialWins)
end

function doPlayerAddInOfficialLoses(cid, value)
	return setPlayerStorageValue(cid, storages.playerOfficialLoses, getPlayerOfficialLoses(cid) + value) and doOTCSendPlayerSkills(cid)
end

function getPlayerOfficialLoses(cid)
	return getPlayerStorageValue(cid, storages.playerOfficialLoses) == -1 and 0 or getPlayerStorageValue(cid, storages.playerOfficialLoses)
end

function doPlayerAddInPVPScore(cid, value)
	return setPlayerStorageValue(cid, storages.playerPVPScore, getPlayerPVPScore(cid) + value) and doOTCSendPlayerSkills(cid)
end

function getPlayerPVPScore(cid)
	return getPlayerStorageValue(cid, storages.playerPVPScore) == -1 and 0 or getPlayerStorageValue(cid, storages.playerPVPScore)
end

------------------------------------------ Badges
function doPlayerAddBadgeOfLeader(cid, leader)
	return setPlayerStorageValue(cid, storages.gynLeaders[leader], 1)
end

function getPlayerBadgeOfLeader(cid, leader)
	return getPlayerStorageValue(cid, storages.gynLeaders[leader]) == -1 and 0 or getPlayerStorageValue(cid, storages.gynLeaders[leader])
end


function getPokeUniqueStorToCatch(poke)
	return pokeballs[string.lower(poke)].on
end

function getPokeUniqueStorToDex(poke)
	return pokeballs[string.lower(poke)].off
end

function isWild(cid)
	if not isCreature(cid) then return false end
	if not isSummon(cid) and isMonster(cid) then
		return true 
	end
	return false
end

function setMoveSummon(cid, canMove)
	if not isCreature(cid) then return true end
	return canMove == true and setPlayerStorageValue(cid, 500, -1) or setPlayerStorageValue(cid, 500, 1) 
end 

function getPokeballs_ITEMS_ID_InContainer(container) -- Function By Kydrai
	if not isContainer(container) then return {} end
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
			if isContainer(item.uid) then
				local itemsbag = getPokeballsInContainer(item.uid)
				for i=0, #itemsbag do
					table.insert(items, itemsbag[i])
				end
			elseif isPokeball(item.itemid) then
				table.insert(items, item)
			end
		end
	end
	return items
end

function getBallNickName(ball)
	return getItemAttribute(ball.uid, "nick") or 0
end

function doCreatureSetNick(cid, nick)
	
	local nid = getCreatureName(cid)
	local master = getCreatureMaster(cid)
	local newPoke = doCreateMonster(nid, farwayPos)
	local oldPos = getThingPos(cid)
	doRemoveCreature(cid)
	setCreatureName(newPoke, nick, nick) 
	doTeleportThing(newPoke, oldPos, false) 
	doConvinceCreature(master, newPoke) 
	registerCreatureEvent(newPoke, "SummonDeath")
	
end
--------------------- Icon system ---------------------

function isItemPokeball(item) --alterado v1.9 \/
	if not item then return false end
	for a, b in pairs (pokeballs) do
		if b.on == item or b.off == item or b.use == item then return true end
	end
	return false
end

function isPokeball(item)
	return isItemPokeball(item)
end 

function getItensUniquesInContainer(container) --alterado v1.6
	if not isContainer(container) then return {} end
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
			if isContainer(item.uid) then
				local itemsbag = getItensUniquesInContainer(item.uid)
				for i=0, #itemsbag do
					table.insert(items, itemsbag[i])
				end
			elseif getItemAttribute(item.uid, "unique") or getItemAttribute(item.uid, "torneio") then
				table.insert(items, item)
			end
		end
	end
	return items
end

function getPokeballsInContainer(container) -- Function By Kydrai
	if not isContainer(container) then return {} end
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
			if isContainer(item.uid) then
				local itemsbag = getPokeballsInContainer(item.uid)
				for i=0, #itemsbag do
					table.insert(items, itemsbag[i])
				end
			elseif isPokeball(item.itemid) then
				table.insert(items, item.uid)
			end
		end
	end
	return items
end

function isWaterTile(id)
	return tonumber(id) and id >= 4608 and id <= 4613 --alterado v1.9
end

function isVenomTile(id)
	return tonumber(id) and (id >= 4691 and id <= 4712 or id >= 4713 and id <= 4736 or id >= 4749 and id <= 4755 or id >= 4876 and id <= 4882) --alterado v1.9
end

function isUseIconSystem(cid)
	if tonumber(getPlayerStorageValueWithSecurity(cid, storages.iconSys)) and getPlayerStorageValueWithSecurity(cid, storages.iconSys) == 1 then
		return true
	end
	return false 
end

function getPlayerStorageValueWithSecurity(cid, stor)
	if not isCreature(cid) then return true end
	return getPlayerStorageValue(cid, stor) 
end

function getItemAttributeWithSecurity(item, attr)
	if not item == 0 or item == nil then return true end
	return getItemAttribute(item, attr) or 0
end

function unLock(ball) 
	if not ball or ball <= 0 then return false end
	if getItemAttribute(ball, "lock") and getItemAttribute(ball, "lock") > 0 then
		local vipTime = getItemAttribute(ball, "lock")
		local timeNow = os.time()
		local days = math.ceil((vipTime - timeNow)/(24 * 60 * 60))
		if days <= 0 then
			doItemEraseAttribute(ball, "lock") 
			doItemEraseAttribute(ball, "unique")
			return true
		end
	end
	return false
end

function getPlayerPokeballs(cid) --alterado v1.9 \/
	local ret = {}
	local container = 0

	if isCreature(cid) then
		container = getPlayerSlotItem(cid, 3).uid
		for i = CONST_SLOT_FIRST, CONST_SLOT_LAST do
		local myball = getPlayerSlotItem(cid, i)
			if isPokeball(myball.itemid) then
				table.insert(ret, myball)
			end
		end
	else
		container = cid
	end
	
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot = 0, (getContainerSize(container) - 1) do
			local item = getContainerItem(container, slot)
			if isContainer(item.uid) then
				local itemsbag = getPlayerPokeballs(item.uid)
				if itemsbag and #itemsbag > 0 then
					for i = 0, #itemsbag do
						table.insert(ret, itemsbag[i])
					end
				end
			elseif isPokeball(item.itemid) then
				table.insert(ret, item)
			end
		end
	end

	container = getPlayerSlotItem(cid, 10).uid
	
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot = 0, (getContainerSize(container) - 1) do
			local item = getContainerItem(container, slot)
			if isContainer(item.uid) then
				local itemsbag = getPlayerPokeballs(item.uid)
				if itemsbag and #itemsbag > 0 then
					for i = 0, #itemsbag do
						table.insert(ret, itemsbag[i])
					end
				end
			elseif isPokeball(item.itemid) then
				table.insert(ret, item)
			end
		end
	end
	
	return ret
end

function isPokeballOn(ball)
	for a, b in pairs(pokeballs) do 
		if b.on == ball.itemid then
			return true
		end
	end
	return false
end

function isPokeballOff(ball)
	for a, b in pairs(pokeballs) do 
		if b.off == ball.itemid then
			return true
		end
	end
	return false
end
function isPokeballUse(ball)
	for a, b in pairs(pokeballs) do 
		if b.use == ball.itemid then
			return true
		end
	end
	return false
end

---- PDA functions
function isPlayerSummon(cid, uid)
	return getCreatureMaster(uid) == cid --alterado v1.9
end

function isSummon(sid)
	return isCreature(sid) and getCreatureMaster(sid) ~= sid and isPlayer(getCreatureMaster(sid)) --alterado v1.9
end 

function ehNPC(cid) --alterado v1.9
	return isCreature(cid) and not isPlayer(cid) and not isSummon(cid) and not isMonster(cid)
end

function ehMonstro(cid) --alterado v1.9
	return cid and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS
end

function isCard(cid)
	if not isSummon(cid) and not isPlayer(cid) and not isWild(cid) then 
		return true
	end
	return false
end

function isPosEqual(pos1, pos2)
	if pos1.x == pos2.x and pos1.y == pos2.y and pos1.z == pos2.z then
		return true
	end	
	return false
end

function isPosInArray(array, pos)
	if not next(array) then return false end
	for i = 1, #array do
		if isPosEqual(pos, array[i]) then
			return true
		end
	end
	return false
end

function canWalkOnPos(pos, creature, pz, water, sqm, proj)
	if not pos then return false end
	if not pos.x then return false end
	if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid <= 1 and sqm then return false end
	if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 919 then return false end
	if isInArray({4820, 4821, 4822, 4823, 4824, 4825}, getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) and water then return false end
	if getTopCreature(pos).uid > 0 and creature then return false end
	if hasSqm(pos) and getTileInfo(pos).protection and pz then return false end
	local n = not proj and 3 or 2 --alterado v1.6
	for i = 0, 255 do
		pos.stackpos = i 
		local tile = getTileThingByPos(pos) 
		if tile.itemid ~= 0 and i ~= 253 and not isCreature(tile.uid) then --edited
			if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
				return false
			end
		end
	end 
	return true
end

function isWalkable(pos, creature, proj, pz, water)-- by Nord
	if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
	if isWater(getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) and water then return false end
	if getTopCreature(pos).uid > 0 and creature then return false end
	if getTileInfo(pos).protection and pz then return false, true end
	local n = not proj and 3 or 2
	for i = 0, 255 do
		pos.stackpos = i
		local tile = getTileThingByPos(pos)
		if tile.itemid ~= 0 and not isCreature(tile.uid) then
			if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
				return false
			end
		end
	end
	return true
end


conds = {
	["Slow"] = 3890,
	["Confusion"] = 3891, 
	["Burn"] = 3892,
	["Poison"] = 3893,
	["Fear"] = 3894,
	["Stun"] = 3895,
	["Paralyze"] = 3896, 
	["Leech"] = 3897,
	["Buff1"] = 3898,
	["Buff2"] = 3899,
	["Buff3"] = 3900,
	["Miss"] = 32659, 
	["Silence"] = 32698, 
	["Sleep"] = 98271,
}
function isSilence(cid)
	if not isCreature(cid) then return false end
	if getPlayerStorageValue(cid, conds["Silence"]) >= 0 then return true end
	return false
end

function isParalyze(cid) 
	if not isCreature(cid) then return false end
	if getPlayerStorageValue(cid, conds["Paralyze"]) >= 0 then return true end
	return false
end

function isSleeping(cid)
	if not isCreature(cid) then return false end
	if getPlayerStorageValue(cid, conds["Sleep"]) >= 0 then return true end
	return false
end

function isBiking(cid)
	return getPlayerStorageValue(cid, 32001) == 1
end

function cancelBike(cid, NotOutfit)
	if not NotOutfit then
		doRemoveCondition(cid, CONDITION_OUTFIT)
	end
	setPlayerStorageValue(cid, 32001, -1)
end

function doRegainSpeed(cid) --alterado v1.9 \/
	if not isCreature(cid) then return true end
	
	local speed = playerSpeed
	if isMonster(cid) then
		speed = getCreatureBaseSpeed(cid)
	else
		local playerLevel = getPlayerLevel(cid)
		if isValueBetween(playerLevel, 1, 50) then
			speed = 275
		elseif isValueBetween(playerLevel, 50, 100) then
			speed = 250
		elseif isValueBetween(playerLevel, 100, 200) then
			speed = 220
		elseif isValueBetween(playerLevel, 200, 300) then
			speed = 180
		else
			speed = 130
		end
		speed = math.ceil(speed + playerLevel * 0.75)
		
		if isRiderOrFlyOrSurf(cid) and isBiking(cid) then
			cancelBike(cid, true)
		end
		
		if getPlayerStorageValue(cid, 192903123) - os.time() > 0 and not isRiderOrFlyOrSurf(cid) then -- Comando correr
			if not isBiking(cid) then
				speed = 250 + speed
			else
				speed = 100 + speed
			end
		end
		
		if isBiking(cid) then
			speed = speed + 300
		end
		
	end
	
	if not isRiderOrFlyOrSurf(cid) then
		doChangeSpeed(cid, -getCreatureSpeed(cid))
	end
	
	if getCreatureCondition(cid, CONDITION_PARALYZE) == true then
		doRemoveCondition(cid, CONDITION_PARALYZE)
		addEvent(doAddCondition, 10, cid, paralizeArea2) 
	end
	
	if isSummon(cid) then
		speed = getSpeed(cid) * 1.20
	elseif ehMonstro(cid) and pokes[getCreatureName(cid)] then
		speed = pokes[getCreatureName(cid)].agility * 1.20
	end

	if not isRiderOrFlyOrSurf(cid) then
		doChangeSpeed(cid, speed)
	end
	return speed
end

function doPlayerAddExp_2(cid, exp)
	if not isCreature(cid) then return true end
	doPlayerAddExp(cid, exp)
	doSendAnimatedText(getThingPos(cid), exp, 215)
end

function doWalkAgain(cid)
	if not isCreature(cid) then return true end
	local master = getCreatureMaster(cid)
	local pox, poy = getPlayerStorageValue(cid, 505), getPlayerStorageValue(cid, 506)

	if pox == -1 and poy == -1 then 
		addEvent(doWalkAgain, 200, cid)
		return true
	end
	
	if getThingPos(master).x ~= pox or getThingPos(master).y ~= poy then
		setMoveSummon(master, true)
	end
	
	addEvent(doWalkAgain, 200, cid)	
	
	--[[addEvent(function()
		if getCreatureTarget(cid) >= 1 then
			setMoveSummon(master, true)
			return true
		end
	end, 200)]]--
	
end

function doMovePokeToPos(cid, pos)
	if not isCreature(cid) then return true end
	doMoveCreatureToPos(cid, pos)
end

function getSpeed(cid)
	if not isCreature(cid) then return 0 end
	return tonumber(getPlayerStorageValue(cid, 1003))
end

function isGhost(cid)
	
end

function isGhostPokemon(cid)
	if not isCreature(cid) then return false end
	local ghosts = {"Gastly", "Haunter", "Gengar", "Shiny Gengar", "Misdreavus", "Shiny Abra"}
	return isInArray(ghosts, getCreatureName(cid))
end

function updateGhostWalk(cid)
	if not isCreature(cid) then return false end
	local pos = getThingPos(cid)
	pos.x = pos.x + 1
	pos.y = pos.y + 1
	local ret = getThingPos(cid)
	doTeleportThing(cid, pos, false)
	doTeleportThing(cid, ret, false)
	return true
end

--- funcs
function getTopCorpse(position)
	local pos = position
	for n = 1, 255 do
		pos.stackpos = n
		local item = getTileThingByPos(pos)
		if (string.find(getItemNameById(item.itemid), "fainted") or string.find(getItemNameById(item.itemid), "defeated ")) then
			return getTileThingByPos(pos)
		end
	end
	return null
end


function doCorrectPokemonName(poke)
	return doCorrectString(poke)
end

---------------------------------------- Order (Não mexer) ----------------------------------------
function getPokemonName(cid)
	return getCreatureName(cid)
end

function isRiderOrFlyOrSurf(cid)
	if getPlayerStorageValue(cid, orderTalks["surf"].storage) == 1 or getPlayerStorageValue(cid, orderTalks["ride"].storage) == 1 or getPlayerStorageValue(cid, orderTalks["fly"].storage) == 1 then
		return true 
	end
	return false
end

function doEreasPlayerOrder(cid)
	setPlayerStorageValue(cid, orderTalks["surf"].storage, -1)
	setPlayerStorageValue(cid, orderTalks["ride"].storage, -1)
	setPlayerStorageValue(cid, orderTalks["fly"].storage, -1)
end

function isRider(cid)
	if getPlayerStorageValue(cid, orderTalks["ride"].storage) == 1 then
		return true 
	end
	return false
end

function isFly(cid)
	if getPlayerStorageValue(cid, orderTalks["fly"].storage) == 1 then
		return true 
	end
	return false
end

function isSurf(cid)
	if getPlayerStorageValue(cid, orderTalks["surf"].storage) == 1 then
		return true 
	end
	return false
end

function isUsingOrder(cid)
	if getPlayerStorageValue(cid, orderTalks["headbutt"].storage) == 1 or getPlayerStorageValue(cid, orderTalks["dig"].storage) == 1 or getPlayerStorageValue(cid, orderTalks["cut"].storage) == 1 or getPlayerStorageValue(cid, orderTalks["rock"].storage) == 1 then
		return true 
	end
	return false
end

function doEreaseUsingOrder(cid)
	setPlayerStorageValue(cid, orderTalks["dig"].storage, -1)
	setPlayerStorageValue(cid, orderTalks["cut"].storage, -1)
	setPlayerStorageValue(cid, orderTalks["rock"].storage, -1)
	setPlayerStorageValue(cid, orderTalks["headbutt"].storage, -1)
end

function doSendMsg(cid, msg)
	if not isPlayer(cid) then return true end
	doPlayerSendTextMessage(cid, 27, msg)
end

function doCopyPokemon(cid, copy, eff)
	local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
	local sid = getCreatureMaster(cid)
	local pos, dir = getThingPos(cid), getPlayerLookDir(cid)
	
	--	 local blockToDitto = {"Ancient Meganium","Ancient Nidoking","Ancient Nidoqueen","Aviator Pidgeot","Banshee Misdreavus","Bone Marowak","Boxer Hitmonchan","Brave Blastoise","Brave Charizard","Brave Nidoking","Brave Nidoqueen","Brave Noctowl","Brave Pidgeot","Brave Venusaur","Brute Rhydon","Brute Ursaring","Capoeira Hitmontop","Charged Raichu","Dark Crobat","Dragon Machamp","Elder Arcanine","Elder Blastoise","Elder Charizard","Elder Dragonite","Elder Electabuzz","Elder Gengar","Elder Jynx","Elder Marowak","Elder Muk","Elder Pidgeot","Elder Pinsir","Elder Raichu","Elder Tangela","Elder Tentacruel","Elder Tyranitar","Elder Venusaur","Enigmatic Girafarig","Enraged Typhlosion","Evil Cloyster","Freezing Dewgong","Furious Ampharos","Furious Mantine","Furious Noctowl","Furious Sandslash","Furious Scyther","Hard Golem","Heavy Piloswine","Hungry Snorlax","Iron Steelix","Lava Magmar","Magnet Electabuzz","Master Alakazam","Master Jynx","Metal Scizor","Metal Skarmory","Milch-Miltank","Moon Clefable","Octopus Octillery","Psy Jynx","Roll Donphan","Singer Wigglytuff","Taekwondo Hitmonlee","Tribal Feraligatr","Tribal Scyther","Tribal Xatu","Trickmaster Gengar","Undefeated Machamp","War Farfetch'd","War Granbull","War Gyarados","War Heracross","Wardog Arcanine","Ancient Alakazam","Ancient Dragonite", "Ancient Kingdra", "Shiny Snorlax", "Unown", "Shiny Abra", "Castform", "Smeargle", "Articuno", "Moltres", "Zapdos", "suicune", "Raikou", "Entei", "Minun And Plusle", "Metagross", "Magmortar", "Milotic", "Tangrowth", "Rhyperior", "Dusknoir", "Slaking", "Salamence", "Electivire", "Kecleon", "Rotom", "Froslass"}	
	
	local blockToDitto = {"Abporygon", "Aporygon", "Big Porygon", "Shiny Salamence", "Shiny Scizor", "Shiny Electivire", "Shiny Magmortar", "Unown", "Shiny Abra", "Castform", "Castform Fire", "Castform Water", "Castform Ice", "Smeargle", "Smeargle 1", "Smeargle 2", "Smeargle 3", "Smeargle 4", "Smeargle 5", "Smeargle 6", "Smeargle 7", "Smeargle 8", "Mew", "Mewtwo", "Articuno", "Moltres", "Zapdos", "Suicune", "Raikou", "Entei", "Minun And Plusle", "Metagross", "Magmortar", "Milotic", "Tangrowth", "Rhyperior", "Dusknoir", "Slaking", "Salamence", "Electivire", "Kecleon", "Rotom", "Froslass"}	
	
	if isInArray(blockToDitto, copy) then
		doSendMsg(sid, "Impossivel copiar este pokemon.")
		return true
	end
	
	if getPlayerStorageValue(sid, 55006) >= 1 then 
		doSendMsg(sid, "Você não pode transformar seu ditto estando duelo.")
		return true
	end
	
	local nick = retireShinyName(getItemAttribute(item.uid, "poke"))
	if getItemAttribute(item.uid, "poke") == "Ditto" and isShinyName(copy) then
		doSendMsg(sid, "So um Shiny Ditto pode se transformar em pokemons do tipo Shiny.")
		return true 
	end
	
	if getItemAttribute(item.uid, "nick") then 
		nick = getItemAttribute(item.uid, "nick") 
	end
	
	if getItemAttribute(item.uid, "copyName") == copy then
		doSendMsg(sid, "Seu ditto já é uma copia do " .. copy)
		return true
	end
	
	if not pokes[copy] then
		doSendMsg(cid, "Isso não é um pokemon.")
		print(">>>>>DittoBUG: " .. copy)
		return true
	end
	
	doPlayerSay(sid, nick..", copie o "..retireShinyName(copy)..".")
	
	local heath_toDrawPercent = getCreatureMaxHealth(cid) - getCreatureHealth(cid)
	doRemoveCreature(cid)
	local poke = doCreateMonsterNick(sid, copy, nick, pos, true)
	doTeleportThing(poke, pos)
	
	setPlayerStorageValue(poke, 510, copy)
	doCreatureSetLookDir(poke, dir)
	doItemSetAttribute(item.uid, "copyName", copy)
	doSendPlayerExtendedOpcode(sid, opcodes.OPCODE_BATTLE_POKEMON, tostring(poke))
	doUpdateMoves(sid)
	adjustStatus(poke, item.uid, true, heath_toDrawPercent, true)
	setPokemonGhost(poke)
	if eff then
		doSendMagicEffect(pos, 184) 
	end
	
	-- doOTCSendPokemonHealth(sid)
end

function round(num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function doUp(cid, summon, move)

	local pokeName = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")
	local ditto = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "copyName")
	
	if ditto and ditto ~= "" then
		pokeName = ditto
	end
	
	local outfit = getPokemonOutfitToSkill(pokeName)
	local heldy = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "yHeldItem")
	
	if heldy then
		local heldName, heldTier = string.explode(heldy, "|")[1], string.explode(heldy, "|")[2]
		if heldName == "Y-Wing" then -- do Wing
			speed = getPokemonSpeedToSkill(pokeName) + heldWing[tonumber(heldTier)] * 1.5
		end
	else
		speed = getPokemonSpeedToSkill(pokeName)		
	end		
	
	doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "hpToDraw", getCreatureMaxHealth(summon) - getCreatureHealth(summon))
	addEvent(doRemoveCreature, 10, summon)
	
	if flys[pokeName] then
		doSetCreatureOutfit(cid, {lookType = outfit}, -1)
	else
		doSetCreatureOutfit(cid, {lookType = outfit + 351}, -1)
	end
	
	local addon = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "addon")
	
	if addon and PokeAddons[pokeName][addon].fly then
		doSetCreatureOutfit(cid, {lookType = PokeAddons[pokeName][addon].fly}, -1)
	elseif addon and PokeAddons[pokeName][addon].ride then
		doSetCreatureOutfit(cid, {lookType = PokeAddons[pokeName][addon].ride}, -1)
	end
	
	doChangeSpeed(cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, speed)
	if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then --alterado v1.6
		if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then 
			BackTeam(cid) 
		end
	end
	
	if move == "ride" then 
		setPlayerStorageValue(cid, orderTalks["ride"].storage, 1)
	elseif move == "fly" then
		setPlayerStorageValue(cid, orderTalks["fly"].storage, 1)
	end
	
	setPokemonGhost(cid)
	
	doSendPlayerExtendedOpcode(cid, 95, '12//,hide')
end


function getCylinderTiles(pos, cilinderSize) -- By SmiX
	local position = pos
	local c = cilinderSize
	local pos = {}
	for i=-c, c do
		for j=-c, c do
			local posEffect = {x=position.x+i,y=position.y+j,z=position.z}
			table.insert(pos, posEffect)
		end
	end
	return pos
end

function recheck(sid, skill, pos)
	if not isCreature(sid) or not isCreature(getCreatureMaster(sid)) then return end
	if not isUsingOrder(sid) then return true end
	local cid = getCreatureMaster(sid)
	
	if skill == "dig" then	
		
		pos.stackpos = 0
		local item = getThingFromPos(pos)
		if not item or item.uid <= 0 then
			return true
		end
		local itemid = item.itemid
		
		doCreatureSay(sid, "DIG!", TALKTYPE_MONSTER)
		doSendMagicEffect(getThingPos(item.uid), EFFECT_DIG)
		doTransformItem(item.uid, 469)
		local function growRock()
			doTransformItem(getTileItemById(pos, 469).uid, itemid)
		end
		addEvent(growRock, tempoPraVoltarAoNormal * 1000)
		
	elseif skill == "cut" then
		
		pos.stackpos = 1
		local item = getThingFromPos(pos)
		if not item or item.uid <= 0 then
			return true
		end
		local itemid = item.itemid
		doCreatureSay(sid, "CUT!", TALKTYPE_MONSTER)
		doSendMagicEffect(getThingPos(item.uid), EFFECT_CUT)
		doTransformItem(item.uid, 6216)
		local function growRock()
			doTransformItem(getTileItemById(pos, 6216).uid, itemid)
		end
		addEvent(growRock, tempoPraVoltarAoNormal * 1000)
		
	elseif skill == "rock" then
		
		pos.stackpos = 1
		local item = getThingFromPos(pos)
		if not item or item.uid <= 0 then
			return true
		end
		local itemid = item.itemid
		doCreatureSay(sid, "ROCK SMASH!", TALKTYPE_MONSTER)
		doSendMagicEffect(getThingPos(item.uid), EFFECT_ROCK)
		doTransformItem(item.uid, 3610)
		local function growRock()
			doTransformItem(getTileItemById(pos, 3610).uid, itemid)
		end
		addEvent(growRock, tempoPraVoltarAoNormal * 1000)
		
	elseif skill == "headbutt" then --alterado v1.6
		
		local item = getTileItemById(pos, 2707) --id do item arvore normal
		if not item or item.uid <= 0 then return true end
		
		local master = getCreatureMaster(sid)
		local array = {} 
		local lvl = {25, 30, 40, 55, 60, 70, 80, 90, 120, 150, 200, 250, 300, 1000} --lvls
		
		for i = 1, #lvl do
			if getPlayerLevel(master) <= lvl[i] then
				array = headbutt[lvl[i]]
				break
			end
		end 
		local rand = array[math.random(#array)]
		for j = 1, rand[2] do		
			local poke = doCreateMonster(rand[1] , getClosestFreeTile(sid, pos))
			--doCreatureSay(sid, rand[1], TALKTYPE_MONSTER)
		end
		doCreatureSay(sid, "HEADBUTT!", TALKTYPE_MONSTER)
		doSendMagicEffect(getThingPos(item.uid), EFFECT_DIG)
		doTransformItem(item.uid, 2702) --id do item arvore quebrada
		local function growHead()
			doTransformItem(getTileItemById(pos, 2702).uid, 2707) --id do item arvore quebrada, arvore normal
		end
		addEvent(growHead, choose(5, 8, 10, 15) * 60 * 1000) --o tempo pra arvore voltar ao normal varia de 5~30min
	end 
	doEreaseUsingOrder(sid) 
end

function choose(...) -- by mock
	local arg = {...}
	return arg[math.random(1,#arg)]
end


function getFreeTile(pos)
	if canWalkOnPos(pos, true, false, false, false, false) then
		return pos
	end
	local tmp
	for dir = 0, 7 do
		tmp = getPosByDir(pos, dir)
		if canWalkOnPos(tmp, true, false, false, false, false) then
			return tmp
		end 
	end
	return farWayPos
end

------------------------ marcar a pos do spawn do poke e retornar ela
function doMarkedSpawnPos(cid)
	local pos = getThingPos(cid)
	setPlayerStorageValue(cid, storages.markedPosPoke, "x = "..pos.x..", y = "..pos.y..", z = "..pos.z..";")
end

function doMarkedPos(cid, pos)
	setPlayerStorageValue(cid, storages.markedPosPoke, "x = "..pos.x..", y = "..pos.y..", z = "..pos.z..";")
end

function isInPartyAndSharedExperience(cid)
	if isInParty(cid) and isPartyEnabledExp(cid) then
		return true
	end
	return false
end

function getMarkedSpawnPos(cid)
	local l = {}
	local pos = getPlayerStorageValue(cid, storages.markedPosPoke)
	local strPos = "x = (.-), y = (.-), z = (.-);"
	for a, b, c in pos:gmatch(strPos) do
		l = {x = tonumber(a), y = tonumber(b), z = tonumber(c)}
	end
	return l
end

------------------------ marcar a pos do spawn do poke e retornar ela

function doPlayerAddPoke(cid, pokeName, ball, unique)
	local ballid = pokeballs[ball]
	local send = false
	
	if not ballid then
		return print("doPlayerAddPoke: Não foi encontrada a pokebola: "..ball)
	end
	
	if isUseIconSystem(cid) then
		id = pokeballs[string.lower(pokeName)].on
	else
		id = ballid.on
	end
	
	if (getPlayerFreeCap(cid) <= 1 and not isInArray({5, 6}, getPlayerGroupId(cid))) or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then
		item = doCreateItemEx(id)
		send = true
	else
		item = addItemInFreeBag(getPlayerSlotItem(cid, 3).uid, id, 1)
	end
	
	doItemSetAttribute(item, "health", getPokemonHealth(pokeName))
	doItemSetAttribute(item, "maxHealth", getPokemonHealth(pokeName))
	doItemSetAttribute(item, "pokeName", doCorrectString(pokeName))
	doItemSetAttribute(item, "ballEffe", ball)
	
	if send then
		doPlayerSendMailByName(getCreatureName(cid), item, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você já está segurando seis pokebolas, o seu novo pokemon foi enviado para o CP.")
	end
end

function hasSpaceInContainer(container) --alterado v1.6
	if not isContainer(container) then return false end
	if getContainerSize(container) < getContainerCap(container) then return true end
	
	for slot = 0, (getContainerSize(container)-1) do
		local item = getContainerItem(container, slot)
		if isContainer(item.uid) then
			if hasSpaceInContainer(item.uid) then
				return true
			end
		end
	end
	return false
end

function doSendEffect(cid, effe)
	if not isCreature(cid) then return true end
	doSendMagicEffect(getThingPos(cid), effe) 
end

function doSendEffectAndText(cid, effe, text, color)
	if not isCreature(cid) then return true end
	if not color then color = 215 end
	doSendEffect(cid, effe)
	if text and text ~= "" then
		doSendAnimatedText(getThingPos(cid), text, color) 
	end
end

function setCreatureVisibility(cid, vis)
	if not isCreature(cid) then return true end
	if vis then
		doAddCondition(cid, invisiblecondition)
	else
		doRemoveCondition(cid, CONDITION_INVISIBLE)
	end
end

function setCreatureHick(cid, secs, i)
	if not isCreature(cid) then return true end
	i = i +1
	local pos2 = getThingPos(cid)
	pos2.x = pos2.x + math.random(1, 4)
	pos2.y = pos2.y + math.random(1, 4)
	if(i < secs) then
		local pos = getPosByDir(pos2, math.random(0, 7))
		local master = getCreatureMaster(cid)
		if(isPlayer(master)) then
			setMoveSummon(master, false)
		end
		doAddCondition(cid, bebo)
		doMovePokeToPos(cid, pos)
		pos = getThingPos(cid)
		pos.y = pos.y -1
		doSendMagicEffect(pos, 31)
		addEvent(setCreatureHick, 1000, cid, secs, i)
	else
		doRemoveCondition(cid, CONDITION_DRUNK)
	end
end

function doRemoveConditionWithSecurity(cid, cond)
	if not isCreature(cid) then return true end
	doRemoveCondition(cid, cond)
end

function doCanAttackOther(cid, target)
	
	setPlayerStorageValue(cid, storages.teamRed, 1)
	setPlayerStorageValue(target, storages.teamBlue, 1)
	
end

-------------- pokedex
function getPokemonVitalityD(name)
	if not pokes[name] then return false end
	return pokes[name].vitality
end

function getPokemonAttackD(name)
	if not pokes[name] then return false end
	return pokes[name].offense
end

function getPokemonDefenseD(name)
	if not pokes[name] then return false end
	return pokes[name].defense
end

function getPokemonSpAttackD(name)
	if not pokes[name] then return false end
	return pokes[name].specialattack
end

function getPokemonLevelD(name)
	if not pokes[name] then return false end
	if pokes[name].level <= 1 then
		return 5
	end
	return pokes[name].level
end

function getPokemonPortraitD(name)
	if not pokes[name] then return false end
	return pokes[name].portrait
end



function getPokemonType1D(name)
	if not pokes[name] then return "normal" end
	return pokes[name].type
end

function getPokemonType2D(name)
	if not pokes[name] or not pokes[name].type2 then return false end
	return pokes[name].type2
end

function getPokemonHealthD(name) 
	if not pokes[name] then return false end
	return getMonsterInfo(name).healthMax
end

--[[function getPokemonExperienceD(name)

local stats = {
	{min = 0, max = 20, multiply = 1},
	{min = 21, max = 40, multiply = 1.2},
	{min = 41, max = 60, multiply = 1.3},
	{min = 61, max = 81, multiply = 1.5},
	{min = 81, max = 100, multiply = 1.7},
	{min = 101, max = 150, multiply = 2.5},
	{min = 151, max = 5000, multiply = 3}
}

	if not pokes[name] then return false end	
	local poke = doCorrectPokemonName(name)
	local experience = pokes[doCorrectPokemonName(name)].exp
		for a, b in pairs(stats) do
			if getPokemonLevelD(poke) >= b.min and getPokemonLevelD(poke) <= b.max then
				return b.multiply * (experience or 1)
			end
		end
			
	return experience
end]]--

function getPokemonExperienceD(name)
	if not pokes[name] then return false end			
	return pokes[doCorrectPokemonName(name)].exp
end

function getPokemonCatchedStorage(name)
	if not pokes[name] then return false end
	return getMonsterInfo(name).lookCorpse
end

function getPokemonCorpse(name)
	if not pokes[name] then return false end
	return getMonsterInfo(name).lookCorpse
end