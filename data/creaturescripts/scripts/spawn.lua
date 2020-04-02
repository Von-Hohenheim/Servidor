local respGrande = {"Pupitar", "Tyranitar", "Skarmory", "Magcargo", "Ampharos", "Xatu", "Crobat", "Typhlosion", "Magmar", "Electabuzz", "Cubone", "Marowak", "Electrode", "Charizard", "Oddish", "Paras", "Parasect"}

local respMedio = {"Lanturn", "Dratini", "Dragonair", "Snorlax", "Krabby", "Kingler", "Gengar", "Pidgeot", "Raichu", "Machamp"}

local respPequeno = {"Steelix", "Sudowoodo", "Feraligatr", "Meganium", "Dragonite", "Gyarados", "Pinsir", "Tauros", "Jynx", "Scyther", "Mr. mime", "Horsea", "Seadra", "Tangela", "Grimer", "Muk", "Tentacool", "Tentacruel", "Farfetch'd", "Growlithe", "Arcanine", "Alakazam", "Venusaur", "Blastoise", "Butterfree", "Beedrill", "Ratatta", "Raticate", "Golbat", "Venonat", "Venomoth"}

local shinykarp = {"Magikarp"}

function onSpawn(cid)

	if isSummon(cid) then
		return true
	end
	
	if not isCreature(cid) then 
		return true
	end
	
	if getCreatureName(cid) == "" or getCreatureName(cid) == nil then
		setPlayerStorageValue(cid, 510, getCreatureNick(cid))
	end
	
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "WildAttack")
	registerCreatureEvent(cid, "PokeWalk")
	 
	if not ehMonstro(cid) then
		setPokemonGhost(cid)
		if getCreatureName(cid):find("Shiny ") then
			setPlayerStorageValue(cid, storages.EhShiny, 1)
		end
		return true
	end
	
	local name = getCreatureName(cid)
	local pos = getThingPos(cid) 
	
	addEvent(function()
		if not isSummon(cid) and not isShinyName(name) then

			local chance = 0
			if isInArray(respGrande, doCorrectString(name)) then --alterado v1.9 \/
				chance = 20 
			elseif isInArray(respMedio, doCorrectString(name)) then
				chance = 25
			elseif isInArray(respPequeno, doCorrectString(name)) then
				chance = 30
			end 
		
			local function doShiny(cid, pos, name, mode)
				if pos and name then
					name = "Shiny "..name
				
					if not pokes[name] then 
						return true 
					end	
					
					doSendMagicEffect(pos, 18) 
					doCreateMonsterNick(cid, name, retireShinyName(name), pos, false)
				end	
			end	
		
			if math.random(1, 1000) <= chance then
				doRemoveCreature(cid)
				doShiny(cid, pos, name, 1)
				return true
			end
			
		local storages = {"Hoodeasy", "Hoodmedium", "Hoodhard", "Hoodexpert", "Hoodlendary"}		
		for i = 1, #storages do
			if isShinyName(name) and getPlayerStorageValue(cid, storages[i]) >= 1 then
				doRemoveCreature(cid)
			end
		end
		
	end

	local spawn_arrs = {
		{frompos = {x = 1922, y = 41, z = 14}, topos = {x = 2833, y = 1428, z = 14}},
	}		
		
		for _, arr in pairs(spawn_arrs) do
			if isInRange(pos, arr.frompos, arr.topos) then
				if isWild(cid) and string.find(name, "Shiny") and not isInArray({"Shiny Salamence", "Shiny Scizor", "Shiny Magmortar", "Shiny Electivire"}, name) then
					doRemoveCreature(cid)
				end
			end
		end
			
		if isInArray({"Abporygon", "Aporygon"}, name) then
			doCreatureSetHideHealth(cid, true)
		end
		
		if isWild(cid) and getCreatureName(cid) == "Magikarp" then
			if math.random(1, 5000) <= 25 then
				doRemoveCreature(cid)
				doCreateMonster("Feebas", pos, false)
			end
		end
		
		if isWild(cid) and isHoenn(getCreatureName(cid)) then
			if math.random(1, 5000) <= 25 then
				local sorte = bossName[math.random(#bossName)]
				doRemoveCreature(cid)	
				doCreateMonster(sorte, pos, false)				
			end
		end				
		
		if not isSummon(cid) then
			adjustWildPoke(cid)
		end

		if isPokePassive(cid) then
	      setPokemonPassive(cid, true)
	end
	
	end, 5)
	
	setPokemonGhost(cid)
	doMarkedPos(cid, getThingPos(cid))
	setSmeargle(cid)		
	addEvent(Camouflage, 5, cid)
	
	return true
end

function Camouflage(cid)
	if isWild(cid) and getCreatureName(cid) == "Kecleon" then
		doSetCreatureOutfit(cid, {lookType = 2057}, -1)	
		doCreatureSetHideHealth(cid, true)		
	end
end
	
function setSmeargle(cid)
	if isSummon(cid) then return true end
	if getCreatureName(cid):find("Smeargle") then
			local id = math.random(5, 6)
			if math.random(1, 500) <= 50 then id = math.random(7, 8) end
			setPlayerStorageValue(cid, storages.SmeargleID, "Smeargle " .. id)
	end
end
