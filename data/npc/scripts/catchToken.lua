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
["fins"] = {19218, 2},
["diving mask"] = {19216, 2},
["air tank"] = {19217, 2},
["goggles"] = {19212, 2},
["snow skis"] = {19213, 2},
["ski poles"] = {19214, 2},
["sandboard"] = {19215, 25},
["snowboard"] = {19219, 25},
}

	if (msgcontains(msg, 'trocar') or msgcontains(msg, 'trade')) then
		selfSay("Temos os seguintes itens Underwater: {Fins}, {Diving Mask}, {Air Tank}, Snow: {Goggles}, {Snow Skis}, {Ski Poles}, Other: {Sandboard}, {Snowboard}.", cid)
		talkState[talkUser] = 1
		return true
	elseif moveis[msg] and talkState[talkUser] == 1 then
		TABLE = moveis[msg]
		selfSay("É necessário "..TABLE[2].." catcher tokens, você deseja trocar?.", cid)
		talkState[talkUser] = 2
		return true
	elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 2 then
		if getContainerSlotsFree(getPlayerSlotItem(cid, 3).uid) <= 7 then
			selfSay("Você precisa de 7 slots livres na bag.", cid)
			talkState[talkUser] = 0
			return true
		end	
		if getPlayerItemCount(cid, 19221) >= TABLE[2] then
			doPlayerRemoveItem(cid, 19221, TABLE[2])
			doPlayerAddItem(cid, TABLE[1], 1)
			selfSay("Obrigado e até a próxima.", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você não tem catcher token o suficiente para efetuar a troca.", cid)	
			talkState[talkUser] = 0		
		end
		return true
	elseif msgcontains(msg, 'no') then
		selfSay("Ok, então até mais.", cid)
		talkState[talkUser] = 0
		return true 
	end 
	
	return true
end       
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())         