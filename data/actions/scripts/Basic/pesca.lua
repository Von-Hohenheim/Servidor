local fishing = {
	[-1] = { segs = 5, pokes = {{"Magikarp", 5}}, hoeen = {{"Magikarp", 1}}},
	
	[3976] = { segs = 5, pokes = {{"Horsea", 5}, {"Goldeen", 3}, {"Poliwag", 2}, {"Remoraid", 2}}, hoeen = {{"Carvanha", 3}, {"Surskit", 2}}}, 
	
	[12855] = { segs = 5, pokes = {{"Tentacool", 3}, {"Staryu", 2}, {"Krabby", 3}, {"Shellder", 2}}, hoeen = {{"Corphish", 2}, {"Barboach", 2}, {"Luvdisc", 2}}},
	
	[12854] = { segs = 5, pokes = {{"Seel", 2}, {"Squirtle", 2}, {"Seaking", 1}, {"Chinchou", 2}}, hoeen = {{"Spheal", 2}, {"Clamperl", 3}}},
	
	[12858] = { segs = 5, pokes = {{"Seaking", 2}, {"Seadra", 2}, {"Poliwhirl", 2}}, hoeen = {{"Marshtomp", 3}, {"Relicanth", 3}}},
	
	[12857] = { segs = 6, pokes = {{"Kingler", 2}, {"Wartortle", 2}, {"Slowbro", 2}, {"Corsola", 2}, {"Qwilfish", 2}}, hoeen = {{"Sealeo", 4}}},
	
	[12860] = { segs = 6, pokes = {{"Starmie", 1}, {"Dewgong", 2}, {"Cloyster", 2}, {"Lanturn", 2}}, hoeen = {{"Whiscash", 2}, {"Sharpedo", 3}}},
	
	[12859] = { segs = 7, pokes = {{"Cloyster", 2}, {"Poliwrath", 2}, {"Politoed", 2}, {"Octillery", 2}}, hoeen = {{"Huntail", 2}, {"Gorebyss", 2}}},
	
	[12856] = { segs = 7, pokes = {{"Dratini", 3}, {"Dragonair", 2}}, hoeen = {{"Wailmer", 1}}},
	
	[12853] = { segs = 7, pokes = {{"Gyarados", 1}, {"Kingdra", 1}, {"Mantine", 1}, {"Tentacruel", 1}, {"Giant Magikarp", 1}, {"Lapras", 1}}, hoeen = {{"Wailord", 1}, {"Wailrein", 1}, {"Swampert", 1}}},
}

local storageP = 154585
local sto_iscas = 5648454 --muda aki pra sto q ta no script da isca
local bonus = 30
local limite = 100
local storageTime = 174529

local function doFish(cid, pos, ppos, interval)
	
	if not isCreature(cid) then return false end
	
	if getPlayerStorageValue(cid, 55006) >= 1 then 
		doPlayerSendCancel(cid, "Você não pode pescar enquanto está em duel.")
		return true
	end
	
	if getThingPos(cid).x ~= ppos.x or getThingPos(cid).y ~= ppos.y then
		return false 
	end
	
	doSendMagicEffect(pos, CONST_ME_LOSEENERGY)
	
	if interval > 0 then
		addEvent(doFish, 1000, cid, pos, ppos, interval-1)
		return true
	end 
	
	local peixe = 0
	local playerpos = getClosestFreeTile(cid, getThingPos(cid))
	local fishes = fishing[getPlayerStorageValue(cid, sto_iscas)]
	local random = {} 
	
	if getPlayerSkillLevel(cid, 6) < limite then 
		local pesca = getPlayerSkillLevel(cid, 6)
		
		if pesca >= 1 and pesca <= 20 then
			doPlayerAddSkillTry(cid, 6, bonus * 15)
		elseif pesca >= 21 and pesca <= 26 then
			doPlayerAddSkillTry(cid, 6, bonus * 35)	
		elseif pesca >= 27 and pesca <= 30 then
			doPlayerAddSkillTry(cid, 6, bonus * 50)
		elseif pesca >= 31 and pesca <= 33 then
			doPlayerAddSkillTry(cid, 6, bonus * 186)	
		elseif pesca >= 34 and pesca <= 37 then
			doPlayerAddSkillTry(cid, 6, bonus * 266)	
		elseif pesca >= 38 and pesca <= 41 then
			doPlayerAddSkillTry(cid, 6, bonus * 380)	
		elseif pesca >= 42 and pesca <= 46 then
			doPlayerAddSkillTry(cid, 6, bonus * 413)	
		elseif pesca >= 47 and pesca <= 50 then
			doPlayerAddSkillTry(cid, 6, bonus * 555)			
		else	 
			doPlayerAddSkillTry(cid, 6, bonus * 290)
		end 
	end
	
	--[[if math.random(1, 100) <= chance then
	if getPlayerSkillLevel(cid, 6) < limite then
		doPlayerAddSkillTry(cid, 6, bonus * 5)
	end]]
	
	if getPlayerStorageValue(cid, 123124) >= 1 then
		random = fishes.hoeen[math.random(#fishes.hoeen)]
	else
		random = fishes.pokes[math.random(#fishes.pokes)]
	end
	
	for i = 1, math.random(random[2]) do
		peixe = doSummonCreature(random[1], playerpos)
		if not isCreature(peixe) then
			setPlayerStorageValue(cid, storageP, -1)
			setPlayerStorageValue(cid, storageTime, -1)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			mayNotMove(cid, false)		
			return true
		end
		
		setPlayerStorageValue(peixe, storageP, 1)
		setPlayerStorageValue(peixe, storageTime, 1)
		if #getCreatureSummons(cid) >= 1 then
			doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 0)
			doChallengeCreature(getCreatureSummons(cid)[1], peixe)
		else	
			doSendMagicEffect(getThingPos(cid), 0)
			doChallengeCreature(cid, peixe)
		end
	end
	
	addEvent(setPlayerStorageValue, 100, cid, storageP, -1)
	addEvent(setPlayerStorageValue, 200, cid, storageTime, -1) -- 800
	doRemoveCondition(cid, CONDITION_OUTFIT)
	mayNotMove(cid, false)		
	return true
end

local waters = {11756, 4821, 4820, 4822, 4825}

function onUse(cid, item, fromPos, itemEx, toPos)
	local time = getPlayerStorageValue(cid, 188728) - os.time()
	if time < 1 then
		setPlayerStorageValue(cid, 188728,os.time() + 3)
		
		if isWatchingTv(cid) then
			return true
		end
		
		local checkPos = toPos
		checkPos.stackpos = 0
		
		if getTileThingByPos(checkPos).itemid <= 0 then
			return true
		end
		
		if not isInArray(waters, getTileInfo(toPos).itemid) then
			return true
		end

		if isBiking(cid) then
			doSendMsg(cid, "Você não pode pescar enquanto estiver de bike.")
			return true
		end
		
		if getPlayerStorageValue(cid, storageP) == 1 then 
			doSendMsg(cid, "Aguarde! Você já está pescando.")
			return true
		end
		
		if getPlayerStorageValue(cid, storageTime) == 1 then 
			--if getPlayerStorageValue(cid, storageP) == 1 then
			doSendMsg(cid, "Aguarde! Espere alguns segundos antes de pescar novamente.")
			addEvent(setPlayerStorageValue, 100, cid, storageTime, -1) -- 400
			--else
			-- setPlayerStorageValue(cid, storageTime, -1)
			--end	
			return true
		end
		
		if isRiderOrFlyOrSurf(cid) then
			doPlayerSendCancel(cid, "You can't fish while surfing/flying.")
			return true
		end
		
		if getTileInfo(getThingPos(getCreatureSummons(cid)[1] or cid)).protection then
			doPlayerSendCancel(cid, "You can't fish pokémons if you or your pokémon is in protection zone.")
			return true
		end
		
		local delay = fishing[getPlayerStorageValue(cid, sto_iscas)].segs
		
		if getPlayerStorageValue(cid, sto_iscas) ~= -1 then
			if getPlayerItemCount(cid, getPlayerStorageValue(cid, sto_iscas)) >= 1 then
				doPlayerRemoveItem(cid, getPlayerStorageValue(cid, sto_iscas), 1)
			else
				setPlayerStorageValue(cid, sto_iscas, -1)
			end
		end
		
		local outfit = getCreatureOutfit(cid)
		local out = getPlayerSex(cid) == 0 and 1467 or 1468
		
		doSetCreatureOutfit(cid, {lookType = out, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
		setPlayerStorageValue(cid, storageP, 1) --alterei looktype
		setPlayerStorageValue(cid, storageTime, 1)
		mayNotMove(cid, true)		
		local pos2 = getThingPos(itemEx.uid)
		doCreatureSetLookDir(cid, getLookToFish(getThingPos(cid), pos2)) --alterado ver depois
		doFish(cid, toPos, getThingPos(cid), math.random(3, delay))
		
	end
	
	return true
end

function getLookToFish(pos, pos2)
	local x1, y1 = pos.x, pos.y
	local x2, y2 = pos2.x, pos2.y
	
	if x1-x2 <= 0 and y1-y2 > 0 then
		return NORTH
	elseif x1-x2 < 0 and y1-y2 == 0 then
		return EAST
	elseif x1-x2 < 0 and y1-y2 < 0 then
		return EAST
	elseif x1-x2 > 0 and y1-y2 < 0 then
		return SOUTH
	elseif x1-x2 > 0 and y1-y2 <= 0 then
		return WEST
	elseif x1-x2 > 0 and y1-y2 >= 0 then
		return WEST
	elseif x1-x2 < 0 and y1-y2 < 0 then
		return EAST
	elseif x1-x2 == 0 and y1-y2 < 0 then
		return SOUTH
	end
	return WEST
end