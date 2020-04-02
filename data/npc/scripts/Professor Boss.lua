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
["tangrowth"] = {"Tangrowth", "10 Gaia Tentacles, 10kk e Tangela +20", "Tangela", 15076, 10}, 
["milotic"] = {"Milotic", "10 Prism Scale, 10kk, Feebas +20", "Feebas", 15074, 10},
["dusknoir"] = {"Dusknoir", "10 Reaper Cloth, 10kk, Dusclops +20", "Dusclops", 15073, 10},
["metagross"] = {"Metagross", "10 Metal Coat, 10kk, Metang +20", "Metang", 15075, 10},
["salamence"] = {"Salamence", "10 Blood Wings, 10kk, Shelgon +20", "Shelgon", 15079, 10},
["magmortar"] = {"Magmortar", "10 Magmarizer, 10kk, Magmar +20", "Magmar", 15071, 10},
["electivire"] = {"Electivire", "10 Electirizer, 10kk, Electabuzz +20", "Electabuzz", 15072, 10},
["slaking"] = {"Slaking", "10 Banana Power, 10kk, Vigoroth +20", "Vigoroth", 15078, 10},
["rhyperior"] = {"Rhyperior", "10 Protector, 10kk, Rhydon +20", "Rhydon", 15070, 10},
}

	if (msgcontains(msg, 'evolution') or msgcontains(msg, 'Evolution')) then
		selfSay("Você deseja evoluir {Milotic}, {Tangrowth}, {Dusknoir}, {Metagross}, {Salamence}, {Magmortar}, {Electivire}, {Slaking}, {Rhyperior}", cid)
		talkState[talkUser] = 1
		return true
	elseif moveis[msg] and talkState[talkUser] == 1 then
		TABLE = moveis[msg]
		selfSay("Para você evoluir o "..msg.." é necessário "..TABLE[2]..", deseja prosseguir?.", cid)
		talkState[talkUser] = 2
		return true
	elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 2 then
		if TABLE[1] then 
						          
			if getPlayerSlotItem(cid, 8).uid <= 0 then
				selfSay("Coloque o "..TABLE[3].." no slot principal!", cid)
				talkState[talkUser] = 0
				return true
			end
		   
	        if #getCreatureSummons(cid) >= 1 then
				selfSay("Seu pokémon precisa estar dentro da pokébola!", cid)
				talkState[talkUser] = 0
				return true
			end
	
			local pb = getPlayerSlotItem(cid, 8).uid    
			if getItemAttribute(pb, "poke") ~= TABLE[3] then
				selfSay("Você não tem um "..TABLE[3].." no slot principal!", cid)
				talkState[talkUser] = 0
				return true
			end
           
			if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 20 then
				selfSay("Você não tem um "..TABLE[3].." boosted +20!", cid)
				talkState[talkUser] = 0
				return true
			end
           
			if getPlayerMoney(cid) >= 2000000000 then
				selfSay("Você tem muito dinheiro na backpack fique apenas com a quantia de 10kk!", cid)
				talkState[talkUser] = 0
				return true
			end

			if getPlayerMoney(cid) >= 1000000000 and getPlayerItemCount(cid, TABLE[4]) >= TABLE[5] then
				selfSay("Parabéns você acaba de clonar um Kabuto.", cid)
				doPlayerRemoveMoney(cid, 1000000000)
				doPlayerRemoveItem(cid, TABLE[4], TABLE[5])
				doItemSetAttribute(pb, "hp", 1)
				doItemSetAttribute(pb, "poke", TABLE[1])
				doItemSetAttribute(pb, "description", "Contains a "..TABLE[1]..".")
				doItemEraseAttribute(pb, "boost")
				talkState[talkUser] = 0
			else
				selfSay("Você não tem dinheiro ou os itens necessários.", cid)	
				talkState[talkUser] = 0		
			end
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