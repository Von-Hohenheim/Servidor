local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function getAllStones(cid)
	if getPlayerItemCount(cid, 11441) >= 25 and getPlayerItemCount(cid, 11442) >= 25 and getPlayerItemCount(cid, 11443) >= 25 and getPlayerItemCount(cid, 11444) >= 25 and getPlayerItemCount(cid, 11445) >= 25 and getPlayerItemCount(cid, 11446) >= 25 and getPlayerItemCount(cid, 11447) >= 25 and getPlayerItemCount(cid, 11448) >= 25 and getPlayerItemCount(cid, 19202) >= 25 and getPlayerItemCount(cid, 11449) >= 10 and getPlayerItemCount(cid, 12232) >= 10 and getPlayerItemCount(cid, 12244) >= 10 and getPlayerItemCount(cid, 11450) >= 25 and getPlayerItemCount(cid, 11451) >= 25 and getPlayerItemCount(cid, 11452) >= 25 and getPlayerItemCount(cid, 11453) >= 25 and getPlayerItemCount(cid, 11454) >= 25 then
		return true
	end
	return false
end

function doRemoveAllStones(cid)
	doPlayerRemoveItem(cid, 11441, 25)
	doPlayerRemoveItem(cid, 11442, 25)
	doPlayerRemoveItem(cid, 11443, 25)
	doPlayerRemoveItem(cid, 11444, 25)
	doPlayerRemoveItem(cid, 11445, 25)
	doPlayerRemoveItem(cid, 11446, 25)
	doPlayerRemoveItem(cid, 11447, 25)
	doPlayerRemoveItem(cid, 11448, 25)
	doPlayerRemoveItem(cid, 11449, 10)
	doPlayerRemoveItem(cid, 12232, 10)
	doPlayerRemoveItem(cid, 12244, 10)
	doPlayerRemoveItem(cid, 11450, 25)
	doPlayerRemoveItem(cid, 11451, 25)
	doPlayerRemoveItem(cid, 11452, 25)
	doPlayerRemoveItem(cid, 11453, 25)
	doPlayerRemoveItem(cid, 11454, 25)
	doPlayerRemoveItem(cid, 19202, 25)
	return true
end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

--//
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)

	if (msgcontains(msg, 'pesquisas') or msgcontains(msg, 'Pesquisas')) then
	
		if getPlayerLevel(cid) < 250 then
			selfSay("Voc� n�o � forte o suficiente para me ajudar.", cid)
			talkState[talkUser] = 0		
			return true	
		end

		if	getPlayerStorageValue(cid, 413702) >= 1 then
			selfSay("N�o preciso mais de sua ajuda!", cid)
			talkState[talkUser] = 0		
			return true	
		end
	
		if getPlayerStorageValue(cid, 413700) >= 1 then			
			selfSay("Voc� j� registrou os 225 pok�mons?", cid)
			talkState[talkUser] = 2
		elseif getPlayerStorageValue(cid, 413701) >= 1 then	
			selfSay("Voc� est� com as {25 Fire Stone}, {25 Water Stone}, {25 Leaf Stone}, {25 Venom Stone}, {25 Heart Stone}, {25 Punch Stone}, {25 Rock Stone}, {25 Enigma Stone}, {25 Ice Stone}, {25 Earth Stone}, {25 Thunder Stone}, {25 Feather Stone}, {25 Coccon Stone}, {25 Darkness Stone}, {10 Metal Stone}, {10 Crystal Stone}, {10 Ancient Stone}?", cid)
			talkState[talkUser] = 3			
		else
			selfSay("Estavamos trabalhando em um projeto bastante ambicioso, por�m algo deu errado e estou precisando de ajuda para eliminar todas as experi�ncias mau sucedidas, voc� poderia me ajudar?", cid)
			talkState[talkUser] = 1
			return true		
		end
		
	elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 1 then
		selfSay("Para voc� me ajudar nessa miss�o ser� necess�rio ter conhecimento sobre diversos tipos de pok�mons, tenha ao menos 225 pok�mons registrados em sua pokedex.", cid)
		setPlayerStorageValue(cid, 413700, 1)
		talkState[talkUser] = 2
		return true
	elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 2 then
		if getPlayerDexCount(cid) >= 15 then
			selfSay("Dever� tamb�m conhecer todos as ess�ncias elementais correspondentes aos pok�mons, traga-me {25 Fire Stone}, {25 Water Stone}, {25 Leaf Stone}, {25 Venom Stone}, {25 Heart Stone}, {25 Punch Stone}, {25 Rock Stone}, {25 Enigma Stone}, {25 Ice Stone}, {25 Earth Stone}, {25 Thunder Stone}, {25 Feather Stone}, {25 Coccon Stone}, {25 Darkness Stone}, {10 Metal Stone}, {10 Crystal Stone}, {10 Ancient Stone}.", cid)
			setPlayerStorageValue(cid, 413700, -1)
			setPlayerStorageValue(cid, 413701, 1)
			talkState[talkUser] = 3
			return true
		else
			selfSay("Voc� ainda n�o pesquisou 225 pok�mons.")
			talkState[talkUser] = 0
			return true
		end
	elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 3 then
		if getAllStones(cid) then
			selfSay("Voc� j� est� pronto, se reuna com mais 4 jogadores e elimine todas as experiencias fracassadas do nosso antigo laboratorio secreto, localizado nas pr�ximidades de pallet.", cid)
			doRemoveAllStones(cid)
			setPlayerStorageValue(cid, 413701, -1)
			setPlayerStorageValue(cid, 413702, 1)
			talkState[talkUser] = 0
			return true
		else
			selfSay("Voc� n�o trouxe os itens necess�rios.")
			talkState[talkUser] = 0
			return true
		end
	elseif msgcontains(msg, 'no') then
		selfSay("Ok ent�o at� mais.", cid)
		talkState[talkUser] = 0
		return true 
	end 
	
	return true
end       
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())         