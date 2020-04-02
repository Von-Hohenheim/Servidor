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
	
	local outland = {
		["norte"] = {x = 1104, y = 1252, z = 13},
		["sul"] = {x = 1115, y = 1634, z = 13},
		["oeste"] = {x = 1461, y = 1474, z = 13},
	}
	
	if getPlayerMoney(cid) < 2000000 then
		selfSay("Você não tem dinheiro suficiente para essa viagem!", cid)
		return true
	elseif getPlayerLevel(cid) < 150 then
		selfSay("Você precisa ser level 150 ou superior para essa viagem!", cid)
		return true
	end
	
	if outland[msg:lower()] then
		doTeleportThing(cid, outland[msg:lower()])
		doPlayerRemoveMoney(cid, 2000000)
		selfSay("Faça bom proveito da sua viagem!", cid)
	end

	--talkState[talkUser] = 0
	--npcHandler:releaseFocus(cid)
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())