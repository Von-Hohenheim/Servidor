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
	
	if isInArray({"Pacifidlog"}, msg:lower()) then		

		if getPlayerLevel(cid) < 180 then
			selfSay("Você precisa ser level 180 ou superior para essa viagem!", cid)
			return true
		end	
	
		if isRiderOrFlyOrSurf(cid) then
			selfSay("Você não pode entrar de fly ou ride.", cid)		
			return true
		end
		
		if isPremium(cid) then
			doTeleportThing(cid, {x = 2444, y = 300, z = 7})
			setPlayerStorageValue(cid, 123124, 1)
		else
			if getPlayerMoney(cid) >= 10000000 then	
				doTeleportThing(cid, {x = 2444, y = 300, z = 7})
				setPlayerStorageValue(cid, 123124, 1)
				doPlayerRemoveMoney(cid, 10000000)
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