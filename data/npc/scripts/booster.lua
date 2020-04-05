local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if isInArray({"hi", "oi", "hola", "olá"}, msg:lower()) then
		selfSay("Hola "..getCreatureName(cid)..", yo puedo {boostear} su pokémon!", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"boost", "boostear", "help"}, msg:lower()) then
		
		if #getCreatureSummons(cid) >= 1 then
			selfSay("Tienes que llamar a tu "..getCreatureName(getCreatureSummons(cid)[1]).." para dentro de su pokebola!", cid)
			return true
		end
		
		if getPlayerSlotItem(cid, 8).uid == 0 then
			selfSay("Tienes que colocar la pokebola que se potenciará en la ranura correcta.", cid)
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
			selfSay("Su pokémon ("..ballname..") está boost al máximo.", cid)
			return true
		end
		
		if not boostStonePray[ballname] then
			selfSay("Su pokémon ("..ballname..") no puede ser bosteado.", cid)
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
			selfSay("Tienes más de un tipo de piedra en tu bolso. Conserva solo la piedra que pretendes usar para boostear!", cid)
			return true
		elseif differentStones == 0 then
			selfSay("Necesitas dejar"..doConcatTable(str, ", ", " ou ").." en tu bolso para que puedas boostear.", cid)
			return true
		end

		local newBoosts = 0
		local usedStones = 0
		
		local totalStones = getPlayerItemCount(cid, stoneID)
		
		if isInArray({leaf, grass, water, venom, thunder, rock, punch, fire, coccon, dark, earth, enigma, ice, heart, feather}, stoneID) then
			for i =1, 50 do
				if i > boostValue then
					if totalStones >= needStone(i) then
						usedStones = usedStones + needStone(i)
						newBoosts = newBoosts + 1
						totalStones = totalStones - needStone(i)
					end
				end
			end
		elseif isInArray({metal, ancient, crystal}, stoneID) then
			for i =1, 50 do
				if i > boostValue then
					if totalStones >= needStone(i) then
						usedStones = math.floor(usedStones + (needStone(i) / 2))
						newBoosts = newBoosts + 1
						totalStones = math.floor(totalStones - (needStone(i) / 2))
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
			selfSay("No tienes suficientes piedras para impulsar de nuevo!", cid)
			return true
		end
		
		if (boostValue + newBoosts) <= 10 then
			percent = 10
		elseif (boostValue + newBoosts) <= 20 then
			percent = 20
		elseif (boostValue + newBoosts) <= 30 then
			percent = 30
		elseif (boostValue + newBoosts) <= 40 then
			percent = 40
		elseif (boostValue + newBoosts) <= 50 then
			percent = 50
		end		
		
		   if ballname == "Ditto" then
		    cost = 5000000 -- 5 td
		   elseif ballname == "Shiny Ditto" then
		    cost = 7000000 -- 7 td
		   else
		    cost = 8000000 -- 8 td
		   end	     
		
		cost = cost + (percent * 100) * 2

		selfSay("Puedo poner tu pokémon ("..ballname..") para +"..boostValue + newBoosts.." utilizando "..usedStones.." "..getItemNameById(stoneID)..(usedStones > 1 and "s" or "").." por $"..convertMoneyValue(cost)..". Quieres?", cid)
		talkState[talkUser] = 2
		setPlayerStorageValue(cid, 201, ballname.."|"..boostValue.."|"..newBoosts.."|"..usedStones.."|"..stoneID.."|"..cost)
	elseif talkState[talkUser] == 2 and isInArray({"yes", "si", "claro"}, msg:lower()) then
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
						selfSay("Ahora su pokémon ("..name..") está +".. boost + newBoost .."!", cid)
					else
						selfSay("No tienes suficiente dinero para esto!", cid)
						return true
					end
					
				else
					selfSay("Debes reemplazar las piedras removidas!", cid)
					return true
				end
				
			else
				selfSay("Debes volver a poner el mismo Pokémon en la ranura correcta.", cid)
			end	
			
		else		
			selfSay("Debes volver a poner el mismo Pokémon en la ranura correcta.", cid)
		end
		talkState[talkUser] = 0
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())