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

	if (msgcontains(msg, 'evento') or msgcontains(msg, 'pascoa')) then  
		selfSay("Um buneary fugiu de nossas acomodações, ela é muito travessa e espalhou ovos por todo continente você deseja se {ajudar} ou {entregar}?", cid)
		talkState[talkUser] = 2
		return true
	elseif (msgcontains(msg, 'ajudar') or msgcontains(msg, 'help'))  and talkState[talkUser] == 2 then
		selfSay("Para ajudar basta coletar os {150 ovos}, quanto mais encontrar melhor recompensas receberá.", cid)
		talkState[talkUser] = 0
		return true
	elseif (msgcontains(msg, 'entregar') or msgcontains(msg, 'trocar'))  and talkState[talkUser] == 2 then

		if getPlayerStorageValue(cid, 1616008) >= 15 and getPlayerStorageValue(cid, 1615000) < 1 then
			doPlayerAddItem(cid, 19265, 3)
			doPlayerAddItem(cid, 19266, 3)
			setPlayerStorageValue(cid, 1615000, 1)
			selfSay("Obrigado pela ajuda, você ganhou 3 Yellow Present, 3 Blue Present.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você precisa de 15+ Ovos Coletados.", cid)		
		end	
	
		if getPlayerStorageValue(cid, 1616008) >= 25 and getPlayerStorageValue(cid, 1615001) < 1 then
			doPlayerAddItem(cid, 19265, 5)
			doPlayerAddItem(cid, 19266, 5)
			setPlayerStorageValue(cid, 1615001, 1)
			selfSay("Obrigado pela ajuda, você ganhou 5 Yellow Present, 5 Blue Present.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você precisa de 25+ Ovos Coletados.", cid)		
		end

		if getPlayerStorageValue(cid, 1616008) >= 50 and getPlayerStorageValue(cid, 1615002) < 1 then
			doPlayerAddItem(cid, 19265, 15)
			doPlayerAddItem(cid, 19266, 15)
			doPlayerAddItem(cid, 12618, 1)
			setPlayerStorageValue(cid, 1615002, 1)
			selfSay("Obrigado pela ajuda, você ganhou 15 Yellow Present, 15 Blue Present, 1 Boost Stone.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você precisa de 50+ Ovos Coletados.", cid)		
		end
	
		if getPlayerStorageValue(cid, 1616008) >= 75 and getPlayerStorageValue(cid, 1615003) < 1 then
			doPlayerAddItem(cid, 19265, 25)
			doPlayerAddItem(cid, 19266, 25)
			doPlayerAddItem(cid, 12618, 2)
			doPlayerAddItem(cid, 19203, 1)
			setPlayerStorageValue(cid, 1615003, 1)
			selfSay("Obrigado pela ajuda, você ganhou 25 Yellow Present, 25 Blue Present, 2 Boost Stone, 1 Shiny Stone.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você precisa de 75+ Ovos Coletados.", cid)		
		end

		if getPlayerStorageValue(cid, 1616008) >= 100 and getPlayerStorageValue(cid, 1615004) < 1 then
			doPlayerAddItem(cid, 19265, 35)
			doPlayerAddItem(cid, 19266, 35)
			doPlayerAddItem(cid, 12618, 3)
			doPlayerAddItem(cid, 19203, 1)
			setPlayerStorageValue(cid, 1615004, 1)
			selfSay("Obrigado pela ajuda, você ganhou 35 Yellow Present, 35 Blue Present, 3 Boost Stone, 2 Shiny Stone.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você precisa de 100+ Ovos Coletados.", cid)		
		end

		if getPlayerStorageValue(cid, 1616008) >= 125 and getPlayerStorageValue(cid, 1615005) < 1 then
			doPlayerAddItem(cid, 19265, 45)
			doPlayerAddItem(cid, 19266, 45)
			doPlayerAddItem(cid, 12618, 5)
			doPlayerAddItem(cid, 19203, 2)
			doPlayerAddPremiumDays(cid, 15)			
			setPlayerStorageValue(cid, 1615005, 1)
			selfSay("Obrigado pela ajuda, você ganhou 45 Yellow Present, 45 Blue Present, 5 Boost Stone, 2 Shiny Stone, 7d Vip.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você precisa de 125+ Ovos Coletados.", cid)		
		end

		if getPlayerStorageValue(cid, 1616008) >= 150 and getPlayerStorageValue(cid, 1615006) < 1 then
			doPlayerAddItem(cid, 19265, 70)
			doPlayerAddItem(cid, 19266, 70)
			doPlayerAddItem(cid, 12618, 8)
			doPlayerAddItem(cid, 19203, 2)
			doPlayerAddPremiumDays(cid, 15)			
			setPlayerStorageValue(cid, 1615006, 1)
			setPlayerStorageValue(cid, 181661, 1)
			setPlayerStorageValue(cid, 4125, 10 * 24 * 60 * 60 + os.time())
			selfSay("Obrigado pela ajuda, você ganhou 70 Yellow Present, 70 Blue Present, 8 Boost Stone, 2 Shiny Stone, 10d Shiny Charm, Outfit Rabbit.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você precisa de 125+ Ovos Coletados.", cid)		
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