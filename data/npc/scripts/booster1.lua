local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if isInArray({"hi", "oi", "ola", "ol�"}, msg:lower()) then
		selfSay("Ol� "..getCreatureName(cid)..", eu posso {boostar} seu pok�mon!", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"boost", "boostar", "help"}, msg:lower()) then
		
		if #getCreatureSummons(cid) >= 1 then
			selfSay("Voc� tem que chamar o seu "..getCreatureName(getCreatureSummons(cid)[1]).." para dentro da pokebola!", cid)
			return true
		end
		
		if getPlayerSlotItem(cid, 8).uid == 0 then
			selfSay("Voc� tem que colocar a pokeball que ir� ser boostada no slot correto.", cid)
			return true
		end
		
		local cost = 0
		local percent = 0
		local ballBooost = getPlayerSlotItem(cid, 8)
		
		local boostHeld = 0
		local heldx = getItemAttribute(ballBooost.uid, "xHeldItem")
		local heldName, heldTier = string.explode((heldx or ""), "|")[1], string.explode((heldx or ""), "|")[2]
		if heldName == "X-Boost" then
			boostHeld = heldBoost[tonumber(heldTier)]
		end			
		
		local boostValue = ((getItemAttribute(ballBooost.uid, "boost") or 0) - boostHeld)
		local ballname = getItemAttribute(ballBooost.uid, "poke")
		
		if boostValue >= 50 then
			selfSay("Seu pok�mon ("..ballname..") est� com boost m�ximo.", cid)
			return true
		end
		
		if not boostStonePray[ballname] then
			selfSay("Seu pok�mon ("..ballname..") n�o pode ser boostado.", cid)
			return true
		end
		
		local differentStones = 0
		local stoneID = 0
		local str = {}
		for a, b in pairs(boostStonePray[ballname]) do
			if getPlayerItemCount(cid, b) > 0 then
				differentStones = differentStones + 1
				stoneID = b
			end
			table.insert(str, getItemNameById(b))
		end
		
		if differentStones > 1 then
			selfSay("Voc� tem mais de um tipo de stone na sua bag. Fique com apenas a stone que voc� pretende utilizar para boostar!", cid)
			return true
		elseif differentStones == 0 then
			selfSay("Voc� precisa deixar alguma "..doConcatTable(str, ", ", " ou ").." na sua bag para poder boostar.", cid)
			return true
		end

		local newBoosts = 0
		local usedStones = 0
		
		local totalStones = getPlayerItemCount(cid, stoneID)
		
		if isInArray({leaf, grass, water, venom, thunder, rock, punch, fire, coccon, dark, earth, enigma, ice, heart, feather, metal, ancient, crystal}, stoneID) then
			for i = 1, 50 do
				if i > boostValue then
					if totalStones >= needStone(ballname, i) then
						usedStones = usedStones + needStone(ballname, i)
						newBoosts = newBoosts + 1
						totalStones = totalStones - needStone(ballname, i)
					end
				end
			end
		else
			if (boostValue + getPlayerItemCount(cid, boostStone)) > 50 then
				newBoosts = 50 - boostValue
			else
				newBoosts = getPlayerItemCount(cid, boostStone)
			end
			usedStones = newBoosts
		end
		
		if newBoosts == 0 then
			selfSay("Voc� n�o tem stones suficientes para boostar novamente!", cid)
			return true
		end
		
		local pokePrice = math.floor(pokeboost[doCorrectString(ballname)].cash * 100)
		
		if ballname then
			cost = pokePrice * newBoosts
		end

		selfSay("Eu posso colocar seu pok�mon ("..ballname..") para +"..boostValue + newBoosts.." utilizando "..usedStones.." "..getItemNameById(stoneID)..(usedStones > 1 and "s" or "").." por $"..convertMoneyValue(cost)..". Voc� quer?", cid)
		talkState[talkUser] = 2
		setPlayerStorageValue(cid, 201, ballname.."|"..boostValue.."|"..newBoosts.."|"..usedStones.."|"..stoneID.."|"..cost)
	elseif talkState[talkUser] == 2 and isInArray({"yes", "sim", "claro"}, msg:lower()) then
		if getPlayerSlotItem(cid, 8).uid ~= 0 then
		
			local name = getPlayerStorageValue(cid, 201):explode("|")[1]
			local boost = tonumber(getPlayerStorageValue(cid, 201):explode("|")[2])
			local newBoost = tonumber(getPlayerStorageValue(cid, 201):explode("|")[3])
			local usedStones = tonumber(getPlayerStorageValue(cid, 201):explode("|")[4])
			local stoneID = tonumber(getPlayerStorageValue(cid, 201):explode("|")[5])
			local cost = tonumber(getPlayerStorageValue(cid, 201):explode("|")[6])
			local ball = getPlayerSlotItem(cid, 8)
			local heldx = getItemAttribute(ball.uid, "xHeldItem")
			local heldName, heldTier = string.explode((heldx or ""), "|")[1], string.explode((heldx or ""), "|")[2]
			local boostHeld = 0
			if heldName == "X-Boost" then
				boostHeld = heldBoost[tonumber(heldTier)]
			end	
			
			if name:lower() == getItemAttribute(ball.uid, "poke"):lower() and (boost + boostHeld) == (getItemAttribute(ball.uid, "boost") or 0) then			
				
				if getPlayerItemCount(cid, stoneID) >= usedStones then
					
					if getPlayerMoney(cid) >= cost then
						doItemSetAttribute(ball.uid, "boost", boost + newBoost + boostHeld)
						doPlayerRemoveItem(cid, stoneID, usedStones)
						doPlayerRemoveMoney(cid, cost)
						selfSay("Agora seu pok�mon ("..name..") est� +".. boost + newBoost .."!", cid)
					else
						selfSay("Voc� n�o tem dinheiro suficiente para isso!", cid)
						return true
					end
					
				else
					selfSay("Voc� deve repor as stones removidas!", cid)
					return true
				end
				
			else
				selfSay("Voc� precisa colocar aquele mesmo pok�mon de volta no slot correto.", cid)
			end	
			
		else		
			selfSay("Voc� precisa colocar aquele mesmo pok�mon de volta no slot correto.", cid)
		end
		talkState[talkUser] = 0
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())