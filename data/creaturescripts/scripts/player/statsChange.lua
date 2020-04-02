local damages = {GROUNDDAMAGE, ELECTRICDAMAGE, ROCKDAMAGE, FLYDAMAGE, BUGDAMAGE, FIGHTINGDAMAGE, DRAGONDAMAGE, POISONDAMAGE, DARKDAMAGE, STEELDAMAGE}
local fixdmgs = {PSYCHICDAMAGE, COMBAT_PHYSICALDAMAGE, GRASSDAMAGE, FIREDAMAGE, WATERDAMAGE, ICEDAMAGE, NORMALDAMAGE, GHOSTDAMAGE}
local ignored = {POISONEDDAMAGE, BURNEDDAMAGE} --alterado v1.6
local cannotkill = {BURNEDDAMAGE, POISONEDDAMAGE}

function onStatsChange(cid, attacker, type, combat, value)
	if isWatchingTv(cid) then return false end	

	if isWild(attacker) then
		if isPlayer(cid) and getPlayerStorageValue(cid, 2525252525) >= 1 then
			return true
		end
	end
	
	if type == STATSCHANGE_HEALTHGAIN then
		if cid == attacker then
			return true
		end
		if isSummon(cid) and isSummon(attacker) then
			if isInDuel(getCreatureMaster(cid)) then
				return false
			end
			if canAttackOther(cid, attacker) == "Cant" then
				return false
			end
		end
		if isWild(cid) and isWild(attacker) then -- monstros se curarem
			return true 
		end
		return true
	end
	
	if isSummon(cid) and isSummon(attacker) then -- Duel
		local p1, p2 = getCreatureMaster(cid), getCreatureMaster(attacker)
		if not CanAttackerInDuel(p1, p2) then
			return false
		end
	end

	if isSleeping(attacker) then return false end
	if isPlayer(cid) and isSummon(attacker) and canAttackOther(cid, attacker) == "Cant" then return false end
	
	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 201001) >= 1 then
			return false
		end
	end
	
	if isNpc(attacker) and isInArray({"Mew", "Mewtwo", "Moltres", "Articuno", "Zapdos", "Snorlax", "Big Porygon", "Aerodactyl", "Dragonite"}, getCreatureName(attacker)) then
		if isPlayer(cid) or isSummon(cid) then
			return false
		end
	end
	
	if isCard(attacker) then 
		if isSummon(cid) and getPlayerStorageValue(cid, 9658783) >= 1 then
			return false
		end
	end	
	
	if getPlayerStorageValue(cid, 9658783) == 1 then -- lenda causarem dano msm quando tiver com spell de imunidade
		if not ehLenda(attacker) then
			return false
		end 
		return true
	end	
	
	if combat == FLYSYSTEMDAMAGE then return false end
	if isPlayer(cid) and isWatchingTv(cid) then return false end -- TV
	if (isPlayer(cid) and #getCreatureSummons(cid) >= 1 and not getTileInfo(getThingPos(getCreatureSummons(cid)[1])).protection) or isPlayer(attacker) then return false end -- seguranca do player nao atacar
	if isGod(cid) then return false end -- god nao morrer o.O
	if isWild(cid) and isWild(attacker) then return false end -- monstro nao atacar monstro, mas deixar pokemons do shared team baterem
	if isSummon(cid) and getPlayerStorageValue(cid, 5000001) >= 1 then return false end -- ENQUANTO ESTIVER USANDO MEDITATE NÃO RECEBER DANO
	if getTileInfo(getThingPos(cid)).protection then return false end	

	if isSummon(attacker) and isPlayer(cid) then
		return false -- quandotiver pvp colocar storage do pvp aqui+++++++++++
	end	

	if not (isCreature(attacker)) then return true end
	
	-- player morte e ataques
	if isPlayer(cid) and (#getCreatureSummons(cid) <= 0 or #getCreatureSummons(cid) >= 1 and getTileInfo(getThingPos(getCreatureSummons(cid)[1])).protection) then
		
		local color = 180
		if (combat == 128 or combat == 1) then
			value = math.floor(getOffense(attacker) * 80) -- 100
		else
			if not combat then
				color = 180
			else
				color = typeTable[combat].color or 180
			end
		end
		
		if value >= getCreatureHealth(cid) then
			value = math.floor(getCreatureHealth(cid))
		end
		
		if (value) >= getCreatureHealth(cid) then
			doKillPlayer(cid, attacker, (value))
			return false
		end
				
		doSendAnimatedText(getThingPosWithDebug(cid), (math.floor(value) * -1), color) 
		doCreatureAddHealth(cid, math.floor(-value))
		return false
	end
	
	if not isPlayer(cid) then	
		
		local myName = doCorrectString(getCreatureName(cid))
		if isInArray(specialabilities["evasion"], myName) and isSummon(cid) then 
			local target = cid
			if getCreatureTarget(getCreatureMaster(cid)) == attacker then 
				if math.random(1, 100) <= passivesChances["Evasion"][myName] then 
					if isCreature(attacker) then --alterado v1.6 
						doSendMagicEffect(getThingPosWithDebug(target), 211)
						doSendAnimatedText(getThingPosWithDebug(target), "TOO BAD", 215) 
						doTeleportThing(target, getClosestFreeTile(target, getThingPosWithDebug(attacker)), false)
						doSendMagicEffect(getThingPosWithDebug(target), 211)
						doFaceCreature(target, getThingPosWithDebug(attacker)) 
						return false 
					end
				end 
			end
		end
		
		---- cor do dano
		local critical = false
		local returnDamage = false
		
		------------- Helds 
		if isSummon(cid) then
			local heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "xHeldItem")
			if heldx then
				local heldName, heldTier = string.explode(heldx, "|")[1] or "", string.explode(heldx, "|")[2] or ""
				
				if heldName == "X-Block" and isSummon(cid) then 	 -- bloquear alguns ataques
					local chance = heldBlockChance[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						doSendAnimatedText(getThingPos(cid), "BLOCKED", 215)
						return false
					end
				end
				
				if heldName == "X-Return" and isSummon(cid) then 	
					local chance = heldReturn[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						returnDamage = true
						returntype = false
						returnDamageValue = heldReturn[tonumber(heldTier)]
					end
				end
					
				if heldName == "X-Rage" and isSummon(cid) then 	
					local chance = heldRage[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						docastspell(cid, "Rage")
					end
				end
		
				if heldName == "X-Strafe" and isSummon(cid) then 	
					local chance = heldStrafe[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						docastspell(cid, "Strafe")
					end
				end
		
				if heldName == "X-Harden" and isSummon(cid) then 	 
					local chance = heldHarden[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						docastspell(cid, "Harden")
					end
				end
				
				if heldName == "X-Agility" and isSummon(cid) then 
					local chance = heldAgility[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						docastspell(cid, "Agility")					
					end
				end
		
				if heldName == "X-Elemental" then -- do elemental
					local chance = heldElemental[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						docastspell(cid, "Elemental")
					end
				end		
				
				if heldName == "X-Accuracy" then -- do ACCURACY
					local chance = heldAccuracy[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						local conds = {"Miss", "Slow", "Confusion", "Fear", "Silence", "Paralyze", "Stun", "Sleep"}
						local sorte = conds[math.random(1, #conds)]
						local ret = {id = attacker, cd = 7, check = false, first = true, cond = sorte}
						doCondition2(ret)
						doSendAnimatedText(getThingPos(cid), "ACCURACY", 215)
					end
				end
				
			end
		end

		if isNpc(attacker) then
			heldx = getItemAttribute(getPlayerSlotItem(getNpcMaster(attacker), 8).uid, "xHeldItem")
		elseif isSummon(attacker) then
			heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(attacker), 8).uid, "xHeldItem")
		end
		
		-- // REFLECT \\ --
		
		if isSummon(cid) and combat ~= 1 then
			if getPlayerStorageValue(cid, storages.reflect) >= 1 then
				returnDamage = true
				returntype = true
				returncombat = combat
				if isWild(attacker) and (isInArray({"Shiny Salamence", "Shiny Scizor", "Shiny Magmortar", "Shiny Electivire"}, getCreatureName(attacker)) or isBoss(getCreatureName(attacker)) or ehLenda(attacker)) then		
					returnDamageValue = 5
				else
					returnDamageValue = math.floor(math.random(1, 10) * 10)
				end
				removeReflect(cid)
			end
		end	
	
		if isSummon(attacker) then
			local heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(attacker), 8).uid, "xHeldItem")
			if heldx then
				local heldName, heldTier = string.explode(heldx, "|")[1], string.explode(heldx, "|")[2]
				
				if heldName == "X-Critical" then -- dar critico nos ataques
					local chance = heldCriticalChance[tonumber(heldTier)]
					if (math.random(1, 100) <= chance) then
						critical = true
					end
				end
				
			end
		end
		
		if isSummon(cid) and getCreatureName(cid) == "Castform" then
			
			local types = {"normal", "bug", "dark", "steel", "psychic", "fighting", "rock", "ghost", "ice", "electric", "grass", "fire"}
			
			for i = 1, #types do
				if getPokemonType1D(getCreatureName(attacker)) == types[i] or getPokemonType2D(getCreatureName(attacker)) == types[i] then
					docastspell(cid, "Sunny Day")
					break
				end
			end
			
			if getPokemonType1D(getCreatureName(attacker)) == "water" or getPokemonType2D(getCreatureName(attacker)) == "water" then
				docastspell(cid, "Rain Dance")			
			end
			
			if getPokemonType1D(getCreatureName(attacker)) == "ground" or getPokemonType1D(getCreatureName(attacker)) == "dragon" or getPokemonType2D(getCreatureName(attacker)) == "ground" or getPokemonType2D(getCreatureName(attacker)) == "dragon" then  
				docastspell(cid, "Blizzard")
			end		
			
		end		
		
		if isInArray({"Grimer", "Shiny Grimer", "Muk", "Shiny Muk", "Gulpin", "Swalot"}, doCorrectString(getCreatureName(cid))) and (combat == 128 or combat == 1) then 
			if isSummon(cid) and isWild(attacker) then
				doPoisonPoke(cid, attacker)
			end
		end
		
		if isSummon(cid) then
			if math.random(1, 100) < 20 and isInArray({"Whismur", "Loudred"}, doCorrectString(getCreatureName(cid))) and (combat == 128 or combat == 1) then 
				docastspell(cid, "Uproar") -- Passiva Loudred	
			end
		end
	
		if math.random(1, 100) < 40 and isInArray({"Jynx", "Shiny Jynx", "Glalie", "Shiny Glalie"}, doCorrectString(getCreatureName(cid))) and (combat == 128 or combat == 1) then 
			docastspell(cid, "Absolute Zero") -- Passiva Glalie
		end	

		if math.random(1, 100) < 40 and isInArray({"Banette", "Shiny Banette"}, doCorrectString(getCreatureName(cid))) and (combat == 128 or combat == 1) then 
			docastspell(cid, "Cursed Body") -- Passiva Banette
		end			
		
		if isSummon(cid) then
			if getPlayerStorageValue(cid, 173) >= 1 then -- Potions
				setPlayerStorageValue(cid, 173, -1) --alterado v1.6
				doSendAnimatedText(getThingPos(cid), "LOST HEAL", 144)
			end
		end
		
		local boost_def, boost_attk = (0.8 * getPokemonBoost(cid)) / 85, (1 * getPokemonBoost(attacker)) / 85
		
		local isMeele = false
		
		if(combat == 128 or combat == 1) then -- ataque basico
			if value == 0 then 
				return false
			else
				if isWild(attacker) then
					value = value * getOffense(attacker) -- buff ataque system 
					value = value * 0.6 -- 0.3
				elseif isSummon(attacker) then
				    value = value * getOffense(attacker)
					value = value * 1.6
				else
					value = value * getOffense(attacker) 
				end		
				
				local name = doCorrectString(getCreatureName(attacker))
				if pokes[name] and pokes[name].level <= 5 and value ~= 0 then 
					value = -math.random(pokes[name].offense, pokes[name].offense+5)
				end
			end
			
			if isInArray(getPokemonImunity(getCreatureName(cid)), "normal") or isInArray(getPokemonImunity(getCreatureName(cid)), "fighting") then
				--doSendAnimatedText(getThingPos(cid), "Absolute Zero", 35)
				return false
			end
			
			isMeele = true
			
		else -- magia
			
			if value == 0 then 
				return false
			else				
				if isMonster(cid) and isMonster(attacker) then
	
					value = value * (1.4 + getSpecialAttack(attacker) / 100)
					value = value / ((1.2 + getSpecialDefense(cid) / 100))
					local pokename = doCorrectPokemonName(attacker)
				
				if isWild(pokename) then
					if getPokemonLevelD(pokename) < 20 then
						value = value * (7 + getSpecialAttack(pokename) / 57) -- 7, /57
					elseif getPokemonLevelD(pokename) >= 20 and getPokemonLevelD(pokename) < 26 then
						value = value * (6 + getSpecialAttack(pokename) / 68)
					elseif getPokemonLevelD(pokename) >= 26 and getPokemonLevelD(pokename) < 60 then	
						value = value * (1.5 + getSpecialAttack(pokename) / 90)
					elseif getPokemonLevelD(pokename) >= 60 and getPokemonLevelD(pokename) < 70 then	
						value = value * (2.2 + getSpecialAttack(pokename) / 78) -- 2, 80
					elseif getPokemonLevelD(pokename) >= 70 and getPokemonLevelD(pokename) < 80 then	
						value = value * (2.2 + getSpecialAttack(pokename) / 75)	-- 2.1, 75
					elseif getPokemonLevelD(pokename) >= 80 and getPokemonLevelD(pokename) < 90 then	
						value = value * (2.5 + getSpecialAttack(pokename) / 66)  -- 2.5, 67
					elseif getPokemonLevelD(pokename) >= 90 and getPokemonLevelD(pokename) <= 100 then	
						value = value * (2.7 + getSpecialAttack(pokename) / 61)	 -- 2.7, 62
					elseif getPokemonLevelD(pokename) > 100	then
					    value = value * (3 + getSpecialAttack(pokename) / 55)	-- 2.8, 60
					else
						value = value * (1.2 + getSpecialAttack(pokename) / 100) -- 0.9, /102
					end
				end
			end	
		end
	end	

		if isInArray({"Shiny Magmortar", "Shiny Electivire", "Shiny Scizor", "Shiny Salamence"}, getCreatureName(cid)) and combat ~= 1 then
			combat = 1
		end	
	
		local spellType = combat or 'none'
		local multiply = 1
		
		if isInArray(getPokemonDisadvantage(getCreatureName(cid)), spellType) then
			multiply = 2
		end
						
		if isInArray(getPokemonAdvantage(getCreatureName(cid)), spellType) then
			multiply = 1
		end
					
		if isInArray(getPokemonImunity(getCreatureName(cid)), spellType) or isInArray(getPokemonImunity(getCreatureName(attacker)), spellType) then
			multiply = 0
		end			
				
		if isInArray(specialabilities["levitate"], getCreatureName(cid)) and spellType == GROUNDDAMAGE then
			return false
		end	
		
		if value == 0 then 
			value = -math.random(250, 1000)
		end
		
--[[		local master = getCreatureMaster(attacker)
		if isSummon(attacker) and getPlayerClanName(master) ~= 'No Clan!' then -- BONUS DE CLAN
		
			if getPlayerClanName(master) == "orebound" and (combat == ROCKDAMAGE or combat == GROUNDDAMAGE) then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 25))
			end
				
			if getPlayerClanName(master) == "naturia" and (combat == GRASSDAMAGE or combat == BUGDAMAGE) then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 25))
			end
				
			if getPlayerClanName(master) == "seavell" and (combat == WATERDAMAGE or combat == ICEDAMAGE) then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 25))
			end
				
			if getPlayerClanName(master) == "wingeon" and (combat == FLYINGDAMAGE or combat == DRAGONDAMAGE) then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 25))
			end
						
			if getPlayerClanName(master) == "malefic" and (combat == POISONDAMAGE or combat == DARKDAMAGE or combat == GHOSTDAMAGE) then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 25))
			end
							
			if getPlayerClanName(master) == "gardestrike" and (combat == NORMALDAMAGE or combat == FIGHTINGDAMAGE) then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 25))
			end
					
			if getPlayerClanName(master) == "psycraft" and combat == PSYCHICDAMAGE then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 35))
			end
						
			if getPlayerClanName(master) == "ironhard" and combat == STEEL then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 35))
			end
							
			if getPlayerClanName(master) == "volcanic" and combat == FIREDAMAGE then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 35))
			end
								
			if getPlayerClanName(master) == "raibolt" and combat == ELECTRICDAMAGE then
				value = value * tonumber(getPercentClan(master) + (getPlayerClanLevel(master) * 35))
			end
		
		end
	]]--			
		
		if value == 0 then 
			--value = -getEffectvineCombat(cid, attacker, getOffense(attacker)) 
		end -- rever isto.. colocar dano base do xml
		
		value = value - (value * (getDefense(cid) / 100)) -- buff deff system, defendendo por %
		
		-------- boost system
		value = (value) + (boost_def * (value * -1))
		value = (value - getMasterLevel(attacker)) - (boost_attk * (value * -1))
		-------- boost system
		
		value = math.ceil(value * -1)
		value = value * multiply
		
		if value >= getCreatureHealth(cid) then 
			value = getCreatureHealth(cid) 
		end
		
		if value < 0 then 
			value = value * -1
		end
		
		if ehLenda(attacker) then
			value = math.floor(value * rateDamageLegendary) -- 2.7
		elseif isPokeOutland(getCreatureName(attacker)) then
			value = math.floor(value * rateDamageOutland)
		end
		
		if isMeele then
			if getPlayerStorageValue(attacker, 463523) == "Rage" then
				value = value * 2
			end
		end
		
		if not isMeele then
			if string.find(doCorrectString(getCreatureName(attacker)), "Shiny") then
				value = value * rateDamageSpellShiny
			else
				value = value * rateDamageSpellNormal
			end
		end
		
		if isSummon(attacker) then
			value = math.floor(value * rateSummonDamage)
		elseif isWild(attacker) then
			value = math.floor(value * rateWildDamage)
		end

		-------- xp por dano
		if (isNpc(attacker) or isSummon(attacker)) and not isSummon(cid) then
			if isNpc(attacker) then
				addPlayerDano(cid, getNpcMaster(attacker), value)
			else
				addPlayerDano(cid, getCreatureMaster(attacker), value)
			end
		end
		-------- xp por dano
		
		if critical then -- X-Critical system
			value = value * 2
			doSendAnimatedText(getThingPos(cid), "CRITICAL", COLOR_BURN)
		end	
		
		value = math.floor(value)
			
		if isMeele then -- atk
			raceCombat = typeTable[combat]
			if raceCombat ~= nil and raceCombat ~= 0 then
				doSendAnimatedText(getThingPos(cid), (value == 0 and "" or value), (isMega(cid)) and 180 or raceCombat.color)
			else
				doSendAnimatedText(getThingPos(cid), (value == 0 and "" or value), 128)
			end
		else -- spells
			raceCombat = typeTable[combat]	
			if raceCombat ~= nil and raceCombat ~= 0 then
				doSendAnimatedText(getThingPos(cid), (value == 0 and "" or value), (isMega(cid)) and 180 or raceCombat.color)	
			else
				doSendAnimatedText(getThingPos(cid), (value == 0 and "" or value), 129) 
			end	
		end
			
		if returnDamage then
			local valueToReturn = math.ceil(value * (returnDamageValue / 100))
			if valueToReturn > getCreatureHealth(attacker) then 
				valueToReturn = getCreatureHealth(attacker) -1
			end
			
			if valueToReturn > 1 then
				value = value - valueToReturn
				if returntype then	
					local raceCombat = typeTable[combat]
					doSendAnimatedText(getThingPos(attacker), (valueToReturn == 0 and "" or valueToReturn), raceCombat.color)
					doSendAnimatedText(getThingPos(cid), "REFLECT", 31)
					doSendMagicEffect(getThingPos(attacker), 3)
				else
					doSendAnimatedText(getThingPos(attacker), (valueToReturn == 0 and "" or valueToReturn), 31)
					doSendMagicEffect(getThingPos(attacker), 3)
				end
				doCreatureAddHealth(attacker, -valueToReturn)
			end
		end
		
		local spellName = getPlayerStorageValue(attacker, 21102)
		--setPlayerStorageValue(attacker, 21102, -1) -- reseta a spellName do pokemon atacante
	
--		if getCreatureName(cid) == "Swellow" and isWithCondition(cid) then
--			setPlayerStorageValue(cid, 5000003, 1)
--			return true
--		end
		
		if isInArray({"Zigzagoon", "Linoone"}, getCreatureName(cid)) then 
			doRaiseStatus(cid, 0, 0, 400, 10)
		end
	
		if getCreatureName(cid) == "Spinda" and getPlayerStorageValue(cid, 5000010) - os.time() < 0  then			
			docastspell(cid, "Contrary Confusion")
			setPlayerStorageValue(cid, 5000010, os.time() + 8)		
		end
	
		if isSummon(cid) then
			if getCreatureName(cid) == "Exploud" and getPlayerStorageValue(cid, 5000010) - os.time() < 0  then			
				docastspell(cid, "Uproar")
				setPlayerStorageValue(cid, 5000010, os.time() + 10)		
			end
		end
	
		if getCreatureName(cid) == "Seviper" and getPlayerStorageValue(cid, 5000010) - os.time() < 0  then			
			docastspell(cid, "Shed Skin")
			setPlayerStorageValue(cid, 5000010, os.time() + 12)		
		end

		if getCreatureName(cid) == "Kangaskhan" and math.random(1, 100) < 25 and isMega(cid) then 
			docastspell(cid, "Groundshock", 0, 0) -- passiva mega kangaskhan Groundshock
		end
		
		if (combat == POISONEDDAMAGE or combat == BURNEDDAMAGE) and value >= getCreatureHealth(cid) then
			value = 0
		end	
		
--		
		if value >= getCreatureHealth(cid) then
			if isSummon(cid) then
				if isInArray({"Aggron", "Sudowoodo", "Shiny Sudowoodo", "Mega Aggron"}, getCreatureName(cid)) then
					doCreatureAddHealth(cid, -(getCreatureHealth(cid)-1))
					docastspell(cid, "Sturdy", 0, 0)
					if isSummon(cid) then doSendLifePokeToOTC(getCreatureMaster(cid)) end
					return false
				end
			end
			doKillWildPoke(attacker, cid)
			return false
		end
--		

	if isInArray({"Carvanha", "Sharpedo"}, getCreatureName(cid)) and getPlayerStorageValue(cid, 5000010) - os.time() < 0  then
		if getCreatureHealth(cid) <= 7500 then 
			docastspell(cid, "Rage")
			setPlayerStorageValue(cid, 5000010, os.time() + 5)	
		end
	end
	
	if isInArray({"zubat", "golbat", "crobat", "shiny zubat", "shiny golbat", "shiny crobat", "shiny crobat"}, getCreatureName(attacker):lower()) and (combat == 128 or combat == 1) then 
		if isWild(attacker) then
			value = math.floor(value*0.8)
		end
		
			value = math.floor(value*0.9)				
			doCreatureAddHealth(attacker, math.floor(value))
			doSendAnimatedText(getThingPos(attacker), "+ "..math.floor(value), 30)
		end	
--		
	local swim = {"Masquerain", "Lotad", "Lombre", "Ludicolo"}
	
		if isInArray(swim, getCreatureName(cid)) and combat == FIREDAMAGE then
			value = value * 0.5
		end			
--
	local solid = {"Camerupt"}
	
		if isInArray(solid, getCreatureName(cid)) and combat == WATERDAMAGE then
			value = value * 0.5
		end				
		
--		
		if isInArray({"Cacnea", "Cacturn", "Jolteon", "Shiny Jolteon"}, doCorrectString(getCreatureName(cid))) and (combat == 128 or combat == 1) then 
			if value > getCreatureHealth(attacker) then
				value = 0
			else
				doCreatureAddHealth(attacker, -value)				
				addEvent(doSendAnimatedText, 10, getThingPosWithDebug(attacker), "-"..value, 32)
			end
		end		
--			
		if getCreatureName(cid) == "Kecleon" then
			OutfitKecleon(cid, combat)
		end	
--		
		if isInArray({"Cacnea", "Cacturn"}, getCreatureName(cid)) and combat == WATERDAMAGE then
			if value > getCreatureHealth(attacker) then
				value = 0
			else
				value = value * 0.3
				doCreatureAddHealth(cid, value)		
				addEvent(doSendAnimatedText, 10, getThingPosWithDebug(cid), "+"..value, 32)	
			end
		end		

--
	local thick = {"Venusaur"}
	
		if isInArray(thick, getCreatureName(cid)) and (combat == FIREDAMAGE or combat == ICEDAMAGE) then
			value = value * 0.5
		end	
		
		if getCreatureName(cid) == "Masquerain" then
			value = value * 0.75
		end		
	
		if getCreatureName(cid) == "Big Porygon" and isWild(cid) then
			local posis = {{x = 1231, y = 368, z = 9}, {x = 1235, y = 371, z = 9}, {x = 1241, y = 377, z = 9}, {x = 1241, y = 368, z = 9}, {x = 1230, y = 376, z = 9}, {x = 1235, y = 379, z = 9}}		
			local posss = posis[math.random(#posis)]
			
			if math.random(1, 100) < 20 then
				doSendAnimatedText(getThingPos(cid), "TELEPORT", 32)
				addEvent(doTeleportThing, 1000, cid, posss)
			end
			
			if math.random(1, 100) <= 15 then
				doSendAnimatedText(getThingPos(cid), "HELP-ME", 32)
				addEvent(doCreateMonster, 1000, cid, "Porygon", posss, false)
			end
			
			if math.random(1, 100) <= 7 then
				if getCreatureHealth(cid) >= 25000 and getCreatureHealth(cid) <= 175000 then
					doSendAnimatedText(getThingPos(cid), "SECURITY", 32)
					addEvent(function()
						doTeleportThing(cid, {x = 1236, y = 367, z = 8})
						doCreatureAddHealth(cid, 15000)						
						addEvent(doTeleportThing, 15000, cid, {x = 1235, y = 373, z = 9})
						end, 1000)
				end
			end			
			
			if math.random(1, 100) <= 3 then
				if getCreatureHealth(cid) >= 1 and getCreatureHealth(cid) <= 75000 then				
					doSendAnimatedText(getThingPos(cid), "Finale", 32)	
						for i = 1, #posis do
							doCreateMonster(cid, "Porygon2", posis[i], false)
						end
				end
			end

		end
		
		--[[if getCreatureName(cid) == "Shedinja" then
			docastspell(cid, "Shadow Counter")
		end]]--		
-- end the passives		
			
		doCreatureAddHealth(cid, -value)
		doCastPassive(cid)	
	
		if isSummon(cid) then
			-- otclient life
			doSendLifePokeToOTC(getCreatureMaster(cid))
			-- otclient life
		end
	end	
	
	if isNpc(attacker) then
		if value >= getCreatureHealth(cid) then
			doKillWildPoke(attacker, cid)
			setNpcFollow(getNpcMaster(attacker), attacker)
			return false
		end
		return false
	end
	
	return false
end

function getMasterLevel(cid)
	if isSummon(cid) then
		return getPlayerLevel(getCreatureMaster(cid))
	end
	return 0
end