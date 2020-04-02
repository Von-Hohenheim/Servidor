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

--//
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)

local moveis = {
["yellow present"] = {19265, 100}, -- stones
["blue present"] = {19266, 250}, -- balls
["addon box"] = {19244, 1500}, -- balls
["vip"] = {18837, 1500}, -- balls
["box4"] = {18837, 1000}, -- balls
["box5"] = {18837, 2500}, -- balls
["boost stone"] = {12618, 3500}, -- boost stone
["shiny stone"] = {12618, 5000}, -- boost stone
}

local package = 13824 --id do package aki

	if (msgcontains(msg, 'evento') or msgcontains(msg, 'pascoa')) then  
		selfSay("Nessa páscoa estaremos coletando cenouras para distribui-las mundo a fora. Você deseja {participar} ou {trocar}?", cid)
		talkState[talkUser] = 2
		return true
	elseif (msgcontains(msg, 'participar') or msgcontains(msg, 'Participar'))  and talkState[talkUser] == 2 then
		selfSay("Para participar você deve comprar uma Serra(Saw) no Max e cortar as gigantes cenouras que apareceram por volta das cidades do continente de kanto, podemos troca-las por alguns itens de sua preferencia.", cid)
		talkState[talkUser] = 0
		return true
	elseif (msgcontains(msg, 'trocar') or msgcontains(msg, 'trade'))  and talkState[talkUser] == 2 then
		selfSay("Temos os seguintes itens disponíveis para troca, {Yellow Present}, {Blue Present}, {Addon Box}, {Vip (5d)}, {Box4}, {Box5}, {Boost Stone}, {Shiny Stone}.", cid)
		talkState[talkUser] = 3 
		return true
	elseif moveis[msg] and talkState[talkUser] == 3 then
		TABLE = moveis[msg]
		selfSay("O "..TABLE.." custa "..TABLE[2].." cenouras, deseja trocar?.", cid)
		talkState[talkUser] = 4
		return true
	elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 4 then
		if getPlayerItemCount(cid, 2684) >= TABLE[2] then
			doPlayerRemoveItem(cid, 2684, TABLE[2])
			doPlayerAddItem(cid, TABLE[1], 1)
			selfSay("Obrigado e até mais!", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você não tem cenouras o suficiente para efetuar a troca.", cid)	
			talkState[talkUser] = 0		
		end
		return true
	elseif msgcontains(msg, 'no') then
		selfSay("Ok então até mais.", cid)
		talkState[talkUser] = 0
		return true 
	end 
	
	return true
end       
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())         