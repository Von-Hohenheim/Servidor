function getPokemonHealth(name) 
    if not pokes[string.lower(name)] then return false end
    return getMonsterInfo(string.lower(name)).healthMax
end

function adjustWildPoke(cid, optionalLevel)
    
    local BonusOffense = 1
    local BonusDefense = 0.8
    local BonusAgility = 1
    local Bonusvitality = 1
    local Bonusspecialattack = 0.6
	local Bonuslife = 1
    
    if not isCreature(cid) then return true end
    if isSummon(cid) then return true end
	
    if getPlayerStorageValue(cid, 154585) ~= 1 then
        doSendMagicEffect(getThingPos(cid), 21)
    end
    
    local nick = doCorrectString(getCreatureName(cid))
    local level = getPokemonLevelByName(nick)
    
    if not pokes[nick] then return false end
	
	if nick == "Smeargle" then
		 BonusOffense = 2.5 * 3
		 BonusDefense = 1.5
		 Bonusvitality = 3
		 Bonusspecialattack = 3	
	end	 

local spawn_arrs = {
    {frompos = {x = 1091, y = 354, z = 8}, topos = {x = 1193, y = 433, z = 8}, storage = 0, offense = 1, defense = 1, vitality = 2, specialattack = 1.3, life = 1},
    {frompos = {x = 1224, y = 363, z = 9}, topos = {x = 1244, y = 381, z = 9}, storage = 0, offense = 1, defense = 1.7, vitality = 2, specialattack = 2.2, life = 2},
-- Tower Level 1 --
    {frompos = {x = 1937, y =  52, z = 14}, topos = {x = 2152, y = 270, z = 14}, storage = 252520, offense = 1.5, defense = 1.8, vitality = 2, specialattack = 1.5, life = 1.5},
    {frompos = {x = 2169, y = 55, z = 14}, topos = {x = 2369, y = 266, z = 14}, storage = 252521, offense = 1.5, defense = 1.8, vitality = 2, specialattack = 1.5, life = 1.5},
    {frompos = {x = 2383, y = 53, z = 14}, topos = {x = 2590, y = 276, z = 14}, storage = 252522, offense = 1.5, defense = 1.8, vitality = 2, specialattack = 1.5, life = 1.5},
    {frompos = {x = 2616, y = 42, z = 14}, topos = {x = 2840, y = 260, z = 14}, storage = 252523, offense = 1.5, defense = 1.8, vitality = 2, specialattack = 1.5, life = 1.5},
-- Tower Level 2 --
    {frompos = {x = 1926, y = 288, z = 14}, topos = {x = 2143, y = 500, z = 14}, storage = 252525, offense = 2, defense = 2.5, vitality = 2.5, specialattack = 2.5, life = 2},	
    {frompos = {x = 2158, y = 286, z = 14}, topos = {x = 2360, y = 496, z = 14}, storage = 252526, offense = 2, defense = 2.5, vitality = 2.5, specialattack = 2.5, life = 2},	
    {frompos = {x = 2382, y = 277, z = 14}, topos = {x = 2581, y = 506, z = 14}, storage = 252527, offense = 2, defense = 2.5, vitality = 2.5, specialattack = 2.5, life = 2},	
    {frompos = {x = 2605, y = 269, z = 14}, topos = {x = 2824, y = 481, z = 14}, storage = 252528, offense = 2, defense = 2.5, vitality = 2.5, specialattack = 2.5, life = 2},	
-- Tower Level 3 --
    {frompos = {x = 1915, y = 501, z = 14}, topos = {x = 2144, y = 734, z = 14}, storage = 252529, offense = 2.5, defense = 3, vitality = 3, specialattack = 3, life = 2.5},	
    {frompos = {x = 2156, y = 491, z = 14}, topos = {x = 2361, y = 734, z = 14}, storage = 252530, offense = 2.5, defense = 3, vitality = 3, specialattack = 3, life = 2.5},	
    {frompos = {x = 2371, y = 504, z = 14}, topos = {x = 2582, y = 747, z = 14}, storage = 252531, offense = 2.5, defense = 3, vitality = 3, specialattack = 3, life = 1.5},	
    {frompos = {x = 2600, y = 479, z = 14}, topos = {x = 2820, y = 725, z = 14}, storage = 252532, offense = 2.5, defense = 3, vitality = 3, specialattack = 3, life = 1.5},	
-- Tower Level 4 --	
    {frompos = {x = 1883, y = 730, z = 14}, topos = {x = 2097, y = 1197, z = 14}, storage = 252533, offense = 2.5, defense = 3.5, vitality = 3.5, specialattack = 3.5, life = 3.5},
    {frompos = {x = 2128, y = 740, z = 14}, topos = {x = 2323, y = 1203, z = 14}, storage = 252534, offense = 2.5, defense = 3.5, vitality = 3.5, specialattack = 3.5, life = 3.5},
    {frompos = {x = 2336, y = 747, z = 14}, topos = {x = 2549, y = 1200, z = 14}, storage = 252535, offense = 2.5, defense = 3.5, vitality = 3.5, specialattack = 3.5, life = 3.5},
    {frompos = {x = 2554, y = 727, z = 14}, topos = {x = 2775, y = 1192, z = 14}, storage = 252536, offense = 2.5, defense = 3.5, vitality = 3.5, specialattack = 3.5, life = 3.5},
-- Clones Quest -- 
	{frompos = {x = 1712, y = 1001, z = 15}, topos = {x = 1966, y = 1097, z = 15}, storage = 0, offense = 3, defense = 3, vitality = 3.5, specialattack = 7, life = 5},
-- BH Quest --
	{frompos = {x = 563, y = 593, z = 15}, topos = {x = 919, y = 737, z = 15}, storage = 0, offense = 3, defense = 1.5, vitality = 1.5, specialattack = 5, life = 2.5},
-- Dungeons Clans --
    {frompos = {x = 4, y = 328, z = 12}, topos = {x = 1422, y = 1242, z = 12}, storage = 0, offense = 2.5, defense = 2.5, vitality = 2, specialattack = 2, life = 1.5},
    {frompos = {x = 616, y = 348, z = 11}, topos = {x = 999, y = 667, z = 11}, storage = 0, offense = 2.5, defense = 2.5, vitality = 2, specialattack = 2, life = 1.5},
}
	
    local poss = getCreaturePosition(cid)
    for _, arr in pairs(spawn_arrs) do
        if isInRange(poss, arr.frompos, arr.topos) and not string.find(nick, "Shiny") and not isInArray({"Aporygon", "Abporygon"}, nick) then
			BonusOffense = arr.offense
			BonusDefense = arr.defense
			Bonusvitality = arr.vitality
			Bonusspecialattack = arr.specialattack
			Bonuslife = arr.life
			setPlayerStorageValue(cid, arr.storage, 1) --alterado v1.8
			break
        end
    end		
	
    setPlayerStorageValue(cid, 1000, level) --alterado v1.8
    setPlayerStorageValue(cid, 1001, pokes[nick].offense * BonusOffense)
    setPlayerStorageValue(cid, 1002, pokes[nick].defense * BonusDefense * pokes[nick].wildLvl)
    setPlayerStorageValue(cid, 1003, pokes[nick].agility * BonusAgility) 
    setPlayerStorageValue(cid, 1004, pokes[nick].vitality + Bonusvitality * pokes[nick].wildLvl)
    setPlayerStorageValue(cid, 1005, pokes[nick].specialattack * Bonusspecialattack * pokes[nick].wildLvl)
    
    doRegainSpeed(cid)	 --alterado!
    
    local pokeLifeMax = pokes[nick].life * (Bonuslife or 1) * getVitality(cid) / 1.2
    
	if isBoss(nick) then
		pokeLifeMax = pokeLifeMax * 3
	end
	
    if string.find(nick, "Shiny") then
        pokeLifeMax = pokeLifeMax * 2 + (65 * pokes[nick].wildLvl)
    end

	if isPokeOutland(nick) then
		pokeLifeMax = pokeLifeMax * 0.86
	end
	
    setCreatureMaxHealth(cid, pokeLifeMax) -- perfeita formula, os pokemons "ruins" só precisam de ajustes no pokemonStatus, tabela vitality. 
    doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
    
end 

function adjustStatus(pk, item, health, dittoLife, conditions, isPassiva)
    
    if not isCreature(pk) then return true end
    
    -- Defense -- 
    local heldBonusAttack = 1
    local heldBonusDefense = 1
    local heldBonusSpeed = 1
    local heldBonusVitality = 1
    local heldx = getItemAttribute(item, "xHeldItem")
    if heldx then
        local heldName, heldTier = string.explode(heldx, "|")[1], string.explode(heldx, "|")[2]
        if heldName == "X-Attack" then
            heldBonusAttack = heldAttack[tonumber(heldTier)]
        end
        if heldName == "X-Defense" then
            heldBonusDefense = heldDefense[tonumber(heldTier)]
        end
        if heldName == "X-Haste" then
            heldBonusSpeed = heldHaste[tonumber(heldTier)]
        end
        if heldName == "X-Vitality" then
            heldBonusVitality = heldVitality[tonumber(heldTier)]
        end
    end
    
    local nick = getItemAttribute(item, "poke")
    
    if isInArray({"ditto", "shiny ditto"}, nick) then
        if getItemAttribute(item, "copyName") then
            nick = getItemAttribute(item, "copyName")
        end
    end
	
	local master = getCreatureMaster(pk)	
	local custOffense = pokes[nick].offense * heldBonusAttack
	local custDefense = pokes[nick].defense * heldBonusDefense
	local custAgility = pokes[nick].agility + heldBonusSpeed
	local custVit = pokes[nick].vitality * (getMasterLevel(pk) + getPokemonBoost(pk))
	local custSpecialAttack = pokes[nick].specialattack * heldBonusAttack
 
    local life_boost = 100 * getPokemonBoost(pk) 
    local pokeLifeMax = pokes[nick].life
    local boost = getPokemonBoost(pk)
    local masterLevel = getPlayerLevel(getCreatureMaster(pk))
  
    local life = ((pokeLifeMax * 8) + (pokes[nick].vitality * (masterLevel + boost)) * 7) * (heldBonusVitality / 100 + 1) * 1.15
	
	if getItemAttribute(item, "poke"):lower() == "ditto" then
		life = life * 0.75
	elseif getItemAttribute(item, "poke"):lower() == "shiny ditto" then
		life = life * 0.85
	end
	
	if string.find(nick, "Shiny") then
		life = life * 1.10
		custOffense = custOffense * 1.10
		custDefense = custDefense * 1.10
		custSpecialAttack = custSpecialAttack * 1.15
	end
 
    setPlayerStorageValue(pk, 1001, custOffense)
    setPlayerStorageValue(pk, 1002, custDefense)
    setPlayerStorageValue(pk, 1003, custAgility)
    setPlayerStorageValue(pk, 1004, custVit)
    setPlayerStorageValue(pk, 1005, custSpecialAttack) 
    setCreatureMaxHealth(pk, life)
	
    local hpToDraw = not isPassiva and getItemAttribute(item, "hpToDraw") or 0
	
    if(not hpToDraw)then
        doItemSetAttribute(item, "hpToDraw", 0)
    end
	
    if type(dittoLife) == "number" then 
        hpToDraw = dittoLife
    end
    
    doCreatureAddHealth(pk, getCreatureMaxHealth(pk))
	
    if hpToDraw > getCreatureHealth(pk) then
        hpToDraw = getCreatureHealth(pk)-1
    end
	
    doCreatureAddHealth(pk, -hpToDraw)
    setBallHealth(item, getCreatureHealth(pk), getCreatureMaxHealth(pk))
    
    local cid = getCreatureMaster(pk)
    doSendLifePokeToOTC(cid)
      
    doRegainSpeed(pk) 
    
    if isGhostPokemon(pk) then
        setPlayerStorageValue(pk, 8981, 1)
        updateGhostWalk(pk)
    end
    
    if getItemAttribute(item, "nick") then
        nick = getItemAttribute(item, "nick")
    end
    
    setPlayerStorageValue(pk, 1007, nick)
    
    if isSummon(pk) and conditions then
        local burn = tonumber(getItemAttribute(item, "burn"))
        if burn and burn >= 0 then
            local ret = {id = pk, cd = burn, check = false, damage = getItemAttribute(item, "burndmg"), cond = "Burn"}
            addEvent(doCondition2, 3500, ret)
        end
        
        local poison = tonumber(getItemAttribute(item, "poison"))
        if poison and poison >= 0 then
            local ret = {id = pk, cd = poison, check = false, damage = getItemAttribute(item, "poisondmg"), cond = "Poison"}
            addEvent(doCondition2, 1500, ret)
        end
        
        local confuse = tonumber(getItemAttribute(item, "confuse"))
        if confuse and confuse >= 0 then
            local ret = {id = pk, cd = confuse, check = false, cond = "Confusion"}
            addEvent(doCondition2, 1200, ret) 
        end
        
        local sleep = tonumber(getItemAttribute(item, "sleep"))
        if sleep and sleep >= 0 then
            local ret = {id = pk, cd = sleep, check = false, first = true, cond = "Sleep"}
            doCondition2(ret)
        end
        
        local miss = tonumber(getItemAttribute(item, "miss"))
        if miss and miss >= 0 then 
            local ret = {id = pk, cd = miss, eff = getItemAttribute(item, "missEff"), check = false, spell = getItemAttribute(item, "missSpell"), cond = "Miss"}
            doCondition2(ret)
        end
        
        local fear = tonumber(getItemAttribute(item, "fear"))
        if fear and fear >= 0 then
            local ret = {id = pk, cd = fear, check = false, skill = getItemAttribute(item, "fearSkill"), cond = "Fear"}
            doCondition2(ret)
        end
        
        local silence = tonumber(getItemAttribute(item, "silence"))
        if silence and silence >= 0 then 
            local ret = {id = pk, cd = silence, eff = getItemAttribute(item, "silenceEff"), check = false, cond = "Silence"}
            doCondition2(ret)
        end 
        
        local stun = tonumber(getItemAttribute(item, "stun"))
        if stun and stun >= 0 then
            local ret = {id = pk, cd = stun, eff = getItemAttribute(item, "stunEff"), check = false, spell = getItemAttribute(item, "stunSpell"), cond = "Stun"}
            doCondition2(ret)
        end 
        
        local paralyze = tonumber(getItemAttribute(item, "paralyze"))
        if paralyze and paralyze >= 0 then
            local ret = {id = pk, cd = paralyze, eff = getItemAttribute(item, "paralyzeEff"), check = false, first = true, cond = "Paralyze"}
            doCondition2(ret)
        end 
        
        local slow = tonumber(getItemAttribute(item, "slow"))
        if slow and slow >= 0 then
            local ret = {id = pk, cd = slow, eff = getItemAttribute(item, "slowEff"), check = false, first = true, cond = "Slow"}
            doCondition2(ret)
        end 
        
        local leech = tonumber(getItemAttribute(item, "leech"))
        if leech and leech >= 0 then
            local ret = {id = pk, cd = leech, attacker = 0, check = false, damage = getItemAttribute(item, "leechdmg"), cond = "Leech"}
            doCondition2(ret)
        end 
        
        for i = 1, 3 do
            local buff = tonumber(getItemAttribute(item, "Buff"..i))
            if buff and buff >= 0 then
                local ret = {id = pk, cd = buff, eff = getItemAttribute(item, "Buff"..i.."eff"), check = false, 
                buff = getItemAttribute(item, "Buff"..i.."skill"), first = true, attr = "Buff"..i}
                doCondition2(ret)
            end
        end
        
    end
    --alterado v1.9
    -- if getItemAttribute(item, "boost") and getItemAttribute(item, "boost") >= 50 and getItemAttribute(item, "aura") then
    if getItemAttribute(item, "aura") then
        sendAuraEffect(pk, auraSyst[getItemAttribute(item, "aura")]) 
    end
    
    --[[
    if getItemAttribute(item, "boost") and getItemAttribute(item, "boost") >= 50 and getItemAttribute(item, "aura") then
        sendAuraEffect(pk, auraSyst[getItemAttribute(item, "aura")])
    elseif getItemAttribute(item, "premierAura") then 
        sendAuraEffect(pk, auraSyst[getItemAttribute(item, "premierAura")]) 
    end
    --]]
    
    
    if getPlayerStorageValue(getCreatureMaster(pk), 6598754) >= 1 then
        setPlayerStorageValue(pk, 6598754, 1) 
    elseif getPlayerStorageValue(getCreatureMaster(pk), 6598755) >= 1 then
        setPlayerStorageValue(pk, 6598755, 1)
    end
    
    return true
end

function getPokemonXMLOutfit(name) --alterado v1.9 \/
    local path = "data/monster/pokes/Shiny/"..name..".xml"
    local tpw = io.type(io.open(path))
    
    if not tpw then
        path = "data/monster/pokes/geracao 2/"..name..".xml"
        tpw = io.type(io.open(path))
    end
    if not tpw then
        path = "data/monster/pokes/geracao 1/"..name..".xml"
        tpw = io.type(io.open(path))
    end
    if not tpw then
        path = "data/monster/pokes/"..name..".xml"
        tpw = io.type(io.open(path))
    end 
    if not tpw then
        return print("[getPokemonXMLOutfit] Poke with name: "..name.." ins't in any paste on monster/pokes/") and 2
    end
    local arq = io.open(path, "a+")
    local txt = arq:read("*all")
    arq:close()
    local a, b = txt:find('look type="(.-)"')
    txt = string.sub(txt, a + 11, b - 1)
    return tonumber(txt)
end 

function getNPCXMLLOOKDIR(name) --alterado v1.9 \/
    local path = name
    local tpw = io.type(io.open(path))
    if not tpw then
        return false
    end
    local arq = io.open(path, "a+")
    local txt = arq:read("*all")
    arq:close()
    local a, b = txt:find('lookdir="(.-)"')
    txt = string.sub(txt, a + 9, b - 1)
    return tonumber(txt)
end

function sendFinishEvolutionEffect(cid, alternate)
    if not isCreature(cid) then return true end
    local pos1 = getThingPos(cid)
    
    if alternate then
        local pos = {
            [1] = {-2, 0},
            [2] = {-1, -1},
            [3] = {0, -2},
            [4] = {1, -1},
            [5] = {2, 0},
            [6] = {1, 1},
            [7] = {0, 2},
        [8] = {-1, 1}}
        for a = 1, 8 do
            local pos2 = getThingPos(cid)
            pos2.x = pos2.x + pos[a][1]
            pos2.y = pos2.y + pos[a][2]
            local pos = getThingPos(cid)
            doSendDistanceShoot(pos2, pos, 37)
            addEvent(doSendDistanceShoot, 300, pos, pos2, 37)
        end
    else
        for a = 0, 3 do
            doSendDistanceShoot(pos1, getPosByDir(pos1, a), 37)
        end
        for a = 4, 7 do
            addEvent(doSendDistanceShoot, 600, pos1, getPosByDir(pos1, a), 37)
        end
    end
end

function doAdjustWithDelay(cid, pk, health, vit, status)
    if isCreature(cid) then 
        adjustStatus(pk, getPlayerSlotItem(cid, 8).uid, health, vir, status)
    end
end

function getOffense(cid)
    if not isCreature(cid) then return 0 end
    return tonumber(getPlayerStorageValue(cid, 1001))
end

function getDefense(cid)
    if not isCreature(cid) then return 0 end
    return tonumber(getPlayerStorageValue(cid, 1002)+0.5)
end

function getSpeed(cid)
    if not isCreature(cid) then return 0 end
    return tonumber(getPlayerStorageValue(cid, 1003))
end

function getVitality(cid)
    if not isCreature(cid) then return 0 end
    return tonumber(getPlayerStorageValue(cid, 1004)+1.2) -- 1
end

function getSpecialAttack(cid)
    if not isCreature(cid) then return 0 end
    return tonumber(getPlayerStorageValue(cid, 1005))
end

function getSpecialDefense(cid)
    if not isCreature(cid) then return 0 end
    return getSpecialAttack(cid) * 0.4 + getDefense(cid) * 0.8 -- 0.4, 0.7 
end

function getPokemonLevel(cid, dex)
    if not isCreature(cid) or not pokes[getCreatureName(cid)] then return 0 end 
    if not dex then --alterado v1.9
        if ehMonstro(cid) and getPlayerStorageValue(cid, 1000) > 0 then 
            return getPlayerStorageValue(cid, 1000)
        elseif ehMonstro(cid) then 
            return pokes[getCreatureName(cid)].wildLvl 
        end
    end 
    return pokes[getCreatureName(cid)].level
end

function getWildPokemonLevel(cid, dex)
    if not isCreature(cid) or not pokes[getCreatureName(cid)] then return 0 end 
    if not dex then --alterado v1.9
        if ehMonstro(cid) and getPlayerStorageValue(cid, 1000) > 0 then 
            return pokes[getCreatureName(cid)].wildLvl
        elseif ehMonstro(cid) then 
            return pokes[getCreatureName(cid)].wildLvl 
        end
    end 
    return pokes[getCreatureName(cid)].wildLvl
end

function getPokemonLevelByName(name)
    return pokes[name] and pokes[name].level or 0 --alterado v1.9
end

function getMasterLevel(poke)
    if not isSummon(poke) then return 0 end
    return getPlayerLevel(getCreatureMaster(poke))
end

function getPokemonBoost(poke)
    if not isSummon(poke) then return 0 end
    return getItemAttribute(getPlayerSlotItem(getCreatureMaster(poke), 8).uid, "boost") or 0
end

function getPokeballBoost(ball)
    if not isPokeball(ball.itemid) then return 0 end --alterado v1.8
    return getItemAttribute(ball.uid, "boost") or 0
end

function getPokeName(cid)
    if not isSummon(cid) then return getCreatureName(cid) end
    if getCreatureName(cid) == "Evolution" then return getPlayerStorageValue(cid, 1007) end
    local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
    if getItemAttribute(item.uid, "nick") then
        return getItemAttribute(item.uid, "nick")
    end
    if string.find(tostring(getCreatureName(cid)), "Shiny") then
        local newName = tostring(getCreatureName(cid)):match("Shiny (.*)")
        return newName
    end
    return getCreatureName(cid)
end

function getRealPokeballName(item)
    
    local pokeName = getItemAttribute(item, "poke")
    
    if isInArray({"ditto", "shiny ditto"}, pokeName) then
        if getItemAttribute(item, "copyName") then
            pokeName = getItemAttribute(item, "copyName")
        end
    end
    
    return pokeName
end 

function getPokeballName(item, truename)
    if not truename and getItemAttribute(item, "nick") then
        return getItemAttribute(item, "nick")
    end
    return getItemAttribute(item, "poke")
end

function getPokemonName(cid)
    return getCreatureName(cid)
end

function getPokemonGender(cid) --alterado v1.9
    return getCreatureSkullType(cid)
end

function setPokemonGender(cid, gender)
    if isCreature(cid) and gender then --alterado v1.8
        doCreatureSetSkullType(cid, gender)
        return true
    end
    return false
end

function getWildPokemonExp(cid)
    return pokes[getCreatureName(cid)].exp--getMonsterInfo(getCreatureName(cid)).experience
end