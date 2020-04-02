local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)

local package = 13824 --id do package aki

	if (msgcontains(msg, 'evento') or msgcontains(msg, 'independencia')) then  
		selfSay("Olá você deseja saber como funciona o {evento} ou quer {entregar} as bandeiras encontradas?", cid)
		talkState[talkUser] = 2
		return true
	elseif (msgcontains(msg, 'evento') or msgcontains(msg, 'eventos'))  and talkState[talkUser] == 2 then
		selfSay("No dia 7 de setembro o Brasil se separou do Reino de Portugal, como forma de celebrar espalhamos bandeiras por todo mapa colete-as e ganhe recompensas!", cid)
		talkState[talkUser] = 0
		return true
	elseif (msgcontains(msg, 'entregar') or msgcontains(msg, 'entrega'))  and talkState[talkUser] == 2 then
	
		if getPlayerStorageValue(cid, 1614000) >= 1 and getPlayerStorageValue(cid, 1614001) >= 1 and getPlayerStorageValue(cid, 1614002) >= 1 and getPlayerStorageValue(cid, 1614003) >= 1 and getPlayerStorageValue(cid, 1614004) >= 1 and getPlayerStorageValue(cid, 1614005) >= 1 and getPlayerStorageValue(cid, 1614006) >= 1 and getPlayerStorageValue(cid, 1614007) >= 1 then  
			selfSay("Obrigado não preciso mais de você!", cid)		
			talkState[talkUser] = 0
		else
			if getPlayerStorageValue(cid, 809850) >= 15 and getPlayerStorageValue(cid, 1614000) ~= 1 then
				doPlayerAddItem(cid, 19265, 3)
				doPlayerAddItem(cid, 19266, 3)
				setPlayerStorageValue(cid, 1614000, 1)
				selfSay("Obrigado pela ajuda, você ganhou 3 Yellow Present, 3 Blue Present.", cid)
				talkState[talkUser] = 0
			else
				if getPlayerStorageValue(cid, 1614000) ~= 1 then
					selfSay("Você precisa de 15+ Bandeiras Coletadas.", cid)	
				end
			end	
		
			if getPlayerStorageValue(cid, 809850) >= 25 and getPlayerStorageValue(cid, 1614001) ~= 1 then
				doPlayerAddItem(cid, 19265, 5)
				doPlayerAddItem(cid, 19266, 5)
				setPlayerStorageValue(cid, 1614001, 1)
				selfSay("Obrigado pela ajuda, você ganhou 5 Yellow Present, 5 Blue Present.", cid)
				talkState[talkUser] = 0
			else
				if getPlayerStorageValue(cid, 1614001) ~= 1 then
					selfSay("Você precisa de 25+ Bandeiras Coletadas.", cid)
				end
			end

			if getPlayerStorageValue(cid, 809850) >= 50 and getPlayerStorageValue(cid, 1614002) ~= 1 then
				doPlayerAddItem(cid, 19265, 15)
				doPlayerAddItem(cid, 19266, 15)
				doPlayerAddItem(cid, 12618, 1)
				setPlayerStorageValue(cid, 1614002, 1)
				selfSay("Obrigado pela ajuda, você ganhou 15 Yellow Present, 15 Blue Present, 1 Boost Stone.", cid)
				talkState[talkUser] = 0
			else
				if getPlayerStorageValue(cid, 1614002) ~= 1 then
					selfSay("Você precisa de 50+ Bandeiras Coletadas.", cid)
				end
			end
		
			if getPlayerStorageValue(cid, 809850) >= 75 and getPlayerStorageValue(cid, 1614003) ~= 1 then
				doPlayerAddItem(cid, 19265, 25)
				doPlayerAddItem(cid, 19266, 25)
				doPlayerAddItem(cid, 12618, 2)
				setPlayerStorageValue(cid, 1614003, 1)
				selfSay("Obrigado pela ajuda, você ganhou 25 Yellow Present, 25 Blue Present, 2 Boost Stone.", cid)
				talkState[talkUser] = 0
			else
				if getPlayerStorageValue(cid, 1614003) ~= 1 then
					selfSay("Você precisa de 75+ Bandeiras Coletadas.", cid)	
				end
			end

			if getPlayerStorageValue(cid, 809850) >= 100 and getPlayerStorageValue(cid, 1614004) ~= 1 then
				doPlayerAddItem(cid, 19265, 35)
				doPlayerAddItem(cid, 19266, 35)
				doPlayerAddItem(cid, 12618, 3)
				setPlayerStorageValue(cid, 1614004, 1)
				selfSay("Obrigado pela ajuda, você ganhou 35 Yellow Present, 35 Blue Present, 3 Boost Stone", cid)
				talkState[talkUser] = 0
			else
				if getPlayerStorageValue(cid, 1614004) ~= 1 then
					selfSay("Você precisa de 100+ Bandeiras Coletadas.", cid)
				end
			end

			if getPlayerStorageValue(cid, 809850) >= 125 and getPlayerStorageValue(cid, 1614005) ~= 1 then
				doPlayerAddItem(cid, 19265, 45)
				doPlayerAddItem(cid, 19266, 45)
				doPlayerAddItem(cid, 12618, 8)
				doPlayerAddPremiumDays(cid, 3)			
				setPlayerStorageValue(cid, 1614005, 1)
				selfSay("Obrigado pela ajuda, você ganhou 45 Yellow Present, 45 Blue Present, 8 Boost Stone, 3d Vip.", cid)
				talkState[talkUser] = 0
			else
				if getPlayerStorageValue(cid, 1614005) ~= 1 then
					selfSay("Você precisa de 125+ Bandeiras Coletadas.", cid)
				end
			end

			if getPlayerStorageValue(cid, 809850) >= 150 and getPlayerStorageValue(cid, 1614006) ~= 1 then
				doPlayerAddItem(cid, 19265, 80)
				doPlayerAddItem(cid, 19266, 80)
				doPlayerAddItem(cid, 12618, 8)
				doPlayerAddItem(cid, 19203, 1)
				doPlayerAddItem(cid, 19582, 1)
				setPlayerStorageValue(cid, 1614006, 1)
				selfSay("Obrigado pela ajuda, você ganhou 80 Yellow Present, 80 Blue Present, 8 Boost Stone, 1 Shiny Stone, 1d Shiny Charm.", cid)
				talkState[talkUser] = 0
			else
				if getPlayerStorageValue(cid, 1614006) ~= 1 then
					selfSay("Você precisa de 150+ Bandeiras Coletadas.", cid)		
				end
			end
		
			if getPlayerStorageValue(cid, 809850) >= 210 and getPlayerStorageValue(cid, 1614007) ~= 1 then
				doPlayerAddItem(cid, 19265, 100)
				doPlayerAddItem(cid, 19266, 100)
				doPlayerAddItem(cid, 12618, 15)
				doPlayerAddItem(cid, 19203, 2)
				doPlayerAddItem(cid, 19581, 1)
				setPlayerStorageValue(cid, 1614007, 1)
				selfSay("Obrigado pela ajuda, você ganhou 100 Yellow Present, 100 Blue Present, 15 Boost Stone, 2 Shiny Stone, 3d Shiny Charm.", cid)
				talkState[talkUser] = 0
			else
				if getPlayerStorageValue(cid, 1614007) ~= 1 then
					selfSay("Você precisa de 210+ Bandeiras Coletadas.", cid)		
				end
			end
		end
		
	elseif msgcontains(msg, 'no') then
		selfSay("Ok então até mais.", cid)
		talkState[talkUser] = 0
		return true 
	end 
	
	return true
end       
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())         