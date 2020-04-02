local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                  npcHandler:onThink()                  end
 
function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
 	if isInArray({"Saffari Zone"}, msg:lower()) then
		
		if isPremium(cid) and isInArray({"Leuzin", "Kenjiro", "KenjiroTwo", "Pandazilk"} ,getCreatureName(cid)) then
			doTeleportThing(cid, {x = 927, y = 1531, z = 6})
			setPlayerStorageValue(cid, 244787, 1)
			doPlayerAddItem(cid, 12617, 100)
		else
			if getPlayerMoney(cid) >= 5000000 then	
				doTeleportThing(cid, {x = 927, y = 1531, z = 6})
				setPlayerStorageValue(cid, 244787, 1)
				doPlayerAddItem(cid, 12617, 100)
				doPlayerRemoveMoney(cid, 5000000)
			else
				selfSay("Você não tem dinheiro suficiente para essa viagem!", cid)
				return true	
			end
		end
		
		selfSay("Faça bom proveito da sua viagem!", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)		
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())