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
["bless20"] = {20, 100, "bless20"}, -- bless 20%
["bless50"] = {50, 250, "bless50"}, -- bless 50%
["bless100"] = {100, 1500, "bless100"}, -- bless 100%
["xp10"] = {19268, 1500}, -- bless 100%
["xp20"] = {19269, 1500}, -- bless 100%
}

	if (msgcontains(msg, 'consultar') or msgcontains(msg, 'Consultar')) then  
		selfSay("Você tem {"..tonumber(getSurvivalPoints(cid)).."} Survival Points.", cid)
		talkState[talkUser] = 0
		return true
	elseif (msgcontains(msg, 'trocar') or msgcontains(msg, 'Trocar')) then
		selfSay("Temos os seguintes itens disponíveis para troca, {Bless20}, {Bless50}, {Bless100}, {Xp10}, {Xp20} ou {cash}.", cid)
		talkState[talkUser] = 1
		return true
	elseif (msgcontains(msg, 'cash') or msgcontains(msg, 'Cash')) and talkState[talkUser] == 1 then
		if getSurvivalPoints(cid) == tonumber(0) then
			selfSay("Você não tem {Survival Points}!", cid)		
			talkState[talkUser] = 0			
			return true
		end
		selfSay("Cada 1000 pontos é equivalente a 1k, seu montante atual resulta em "..(tonumber(getSurvivalPoints(cid)) / 1000).."k.", cid)
		selfSay("Você tem {"..tonumber(getSurvivalPoints(cid)).."} Survival Points, quanto você deseja trocar?", cid)
		talkState[talkUser] = 2
		return true
	elseif (tonumber(msg) and tonumber(msg) > 0) and talkState[talkUser] == 2 then
		if getSurvivalPoints(cid) < tonumber(msg) then
			selfSay("Você não tem Survival Points o suficiente!", cid)		
			talkState[talkUser] = 0			
			return true
		end
		removeSurvivalPoints(cid, (tonumber(msg)))
		doPlayerAddMoney(cid, (tonumber(msg) * 100))	
		selfSay("Você acaba de trocar {"..tonumber(msg).."} Survival Points em {"..(tonumber(msg) / 1000).."k}.", cid)	
		talkState[talkUser] = 0
	elseif moveis[msg] and talkState[talkUser] == 1 then
		TABLE = moveis[msg]
		selfSay("O "..msg.." custa "..TABLE[2].." Survival Points, deseja trocar?.", cid)
		talkState[talkUser] = 3
		return true
	elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 3 then
		if getSurvivalPoints(cid) >= TABLE[2] then
			if TABLE[3] == "bless20" then
				setPlayerStorageValue(cid, 50405, TABLE[1])
				doSendMsg(cid, "Você acaba de receber 20% de bless!")
			elseif TABLE[3] == "bless50" then 
				setPlayerStorageValue(cid, 50405, TABLE[1])		
				doSendMsg(cid, "Você acaba de receber 50% de bless!")
			elseif TABLE[3] == "bless100" then 
				setPlayerStorageValue(cid, 50405, TABLE[1])
				doSendMsg(cid, "Você acaba de receber 100% de bless!")
			else
				doPlayerAddItem(cid, TABLE[1], 1)			
			end
			removeSurvivalPoints(cid, TABLE[2])
			selfSay("Obrigado e até mais!", cid)
			talkState[talkUser] = 0
		else
			selfSay("Você não tem Survival Points o suficiente para efetuar a troca.", cid)	
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