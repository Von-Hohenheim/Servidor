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
["box4"] = {11641, 50}, 
["xpboost"] = {19269, 120}, 
["boost stone"] = {12618, 200}, 
["bless"] = {100, 175, "bless"}, -- bless 100%
["key box"] = {19917, 100}, 
["charm 1d"] = {19582, 300}, 
["clan boost"] = {19914, 150}, 
["mewcard5"] = {19846, 400, "card"}, 
["mewtwocard5"] = {19847, 500, "card"}, 
["particle aura"] = {19918, 700}, 
["brasil azul backpack"] = {19963, 600}, 
["brasil verde backpack"] = {19962, 600}, 
["outfit"] = {19269, 350, "outfit"}, 
}

	if (msgcontains(msg, 'trocar') or msgcontains(msg, 'Trocar')) then
		selfSay("Temos os seguintes itens disponíveis para troca, {box4}, {xpboost}, {boost stone}, {bless}, {key box}, {charm 1d}, {clan boost}, {mewcard5}, {mewtwocard5}, {particle aura}, {outfit}, {brasil zul backpack}, {brasil verde backpack}.", cid)
		talkState[talkUser] = 1
		return true
	elseif moveis[msg] and talkState[talkUser] == 1 then
		TABLE = moveis[msg]
		selfSay("Você pode trocar "..msg.." por "..TABLE[2].." bandeiras, deseja trocar?", cid)
		talkState[talkUser] = 3
		return true
	elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 19961) >= TABLE[2] then
			if TABLE[3] == "bless" then
				setPlayerStorageValue(cid, 50405, TABLE[1])
				doSendMsg(cid, "Você acaba de receber 100% de bless!")
			elseif TABLE[3] == "outfit" then
				setPlayerStorageValue(cid, 181692, 1)
				doSendMsg(cid, "Você acaba de receber comprar a outfit exclusiva do evento!")		
			elseif TABLE[3] == "card" then
				setChanceCard(doPlayerAddItem(cid, TABLE[1], 1), 5)
			else
				doPlayerAddItem(cid, TABLE[1], 1)			
			end
			doPlayerRemoveItem(cid, 19961, TABLE[2])
			selfSay("Obrigado e até mais!", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você não tem Bandeiras o suficiente para efetuar a troca.", cid)	
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