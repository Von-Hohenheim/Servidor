local helds = {
	["X-Attack"] = {t1 = 15559, t2 = 15560, t3 = 15561, t4 = 15562, t5 = 15563, t6 = 15564, t7 = 15565},	
	["X-Block"] = {t1 = 15566, t2 = 15567, t3 = 15568, t4 = 15569, t5 = 15570, t6 = 15571, t7 = 15572},
	["X-Boost"] = {t1 = 15573, t2 = 15574, t3 = 15575, t4 = 15576, t5 = 15577, t6 = 15578, t7 = 15579}, 
	["X-Critical"] = {t1 = 15580, t2 = 15581, t3 = 15582, t4 = 15583, t5 = 15584, t6 = 15585, t7 = 15586}, 
	["X-Defense"] = {t1 = 15587, t2 = 15588, t3 = 15589, t4 = 15590, t5 = 15591, t6 = 15592, t7 = 15593}, 
	["X-Experience"] = {t1 = 15594, t2 = 15595, t3 = 15596, t4 = 15597, t5 = 15598, t6 = 15599, t7 = 15600}, 
	["X-Hellfire"] = {t1 = 15601, t2 = 15602, t3 = 15603, t4 = 15604, t5 = 15605, t6 = 15606, t7 = 15607}, 
	["X-Haste"] = {t1 = 15608, t2 = 15609, t3 = 15610, t4 = 15611, t5 = 15612, t6 = 15613, t7 = 15614}, 
	["X-Lucky"] = {t1 = 15615, t2 = 15616, t3 = 15617, t4 = 15618, t5 = 15619, t6 = 15620, t7 = 15621}, 
	["X-Poison"] = {t1 = 15622, t2 = 15623, t3 = 15624, t4 = 15625, t5 = 15626, t6 = 15627, t7 = 15628}, 
	["X-Return"] = {t1 = 15629, t2 = 15630, t3 = 15631, t4 = 15632, t5 = 15633, t6 = 15634, t7 = 15635}, 
	["X-Vitality"] = {t1 = 15636, t2 = 15637, t3 = 15638, t4 = 15639, t5 = 15640, t6 = 15641, t7 = 15642},
}

function onUse(cid, item, frompos, item2, topos) 
	
	if getPlayerStorageValue(cid, 55006) >= 1 then 
		doPlayerSendCancel(cid, "Você não pode tirar o held de seu pokémon enquanto está em duel.")
		return true
	end
	
	local nick = getPokeballName(item2.uid)
	local heldName = getItemNameById(item.itemid)
	if not isPokeball(item2.itemid) then
		return doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL)
	end
	
	if #getCreatureSummons(cid) > 0 or isRiderOrFlyOrSurf(cid) then
		doSendMsg(cid, "Retorne seu pokemon para recuperar seu held.")
		return true
	end
	
	if getItemAttribute(item2.uid, "xHeldItem") then
		local oldHeldBooster = string.explode(getItemAttribute(item2.uid, "xHeldItem"), "|")[1]
		local oldHeldBoosterTier = tonumber(string.explode(getItemAttribute(item2.uid, "xHeldItem"), "|")[2])
		
		if oldHeldBooster == "X-Boost" then
			local boostLevel = heldBoost[tonumber(string.explode(getItemAttribute(item2.uid, "xHeldItem"), "|")[2])]
			local ballBoost = getItemAttribute(item2.uid, "boost") or 0
			local boost = ballBoost - boostLevel 
			if (boost < 0) then boost = 0 end
			doItemSetAttribute(item2.uid, "boost", boost)
		end
		
		if oldHeldBooster == "X-Vitality" then
			local pokeLifeMax = pokes[nick].life 
			local boost = getItemAttribute(item2.uid, "boost") or 0
			local masterLevel = getPlayerLevel(cid)
			local life = pokeLifeMax + (pokes[nick].vitality * (masterLevel + boost)) * 12.2
			setBallHealth(item2.uid, life, life)
			portraitSendLifeOTC(cid, item2)
		end
		
		local itemid = 0
		if oldHeldBoosterTier == 1 then
			itemid = helds[oldHeldBooster].t1
		elseif oldHeldBoosterTier == 2 then
			itemid = helds[oldHeldBooster].t2
		elseif oldHeldBoosterTier == 3 then
			itemid = helds[oldHeldBooster].t3
		elseif oldHeldBoosterTier == 4 then
			itemid = helds[oldHeldBooster].t4
		elseif oldHeldBoosterTier == 5 then
			itemid = helds[oldHeldBooster].t5
		elseif oldHeldBoosterTier == 6 then
			itemid = helds[oldHeldBooster].t6
		elseif oldHeldBoosterTier == 7 then
			itemid = helds[oldHeldBooster].t7
		end
		print(itemid)
		doPlayerAddItem(cid, itemid, 1)
		doItemEraseAttribute(item2.uid, "xHeldItem")
		doSendMsg(cid, "O antigo " .. oldHeldBooster .. " (tier: " .. oldHeldBoosterTier .. ") foi recuperado.")
		if not isGod(cid) then
			doRemoveItem(item.uid, 1)
			doSendMagicEffect(getThingPos(cid), 13)
		end
		return true
	else
		doSendMsg(cid, "Este pokémon não possui nenhum held.")
		return true
	end
	
	return true
end