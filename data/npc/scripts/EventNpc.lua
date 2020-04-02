local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end
local talkState = {}

local function goToCity(cid)
	return doTeleportThing(cid, {x = 1011, y = 998, z = 7}) and true
end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if isInArray({"hi", "oi", "ola", "olá"}, msg:lower()) and getDistanceToCreature(cid) < 4 then	
		if getPlayerLevel(cid) < 60 then
			return doPlayerSendCancel(cid, "Opss, você precisa ser level 60+ para poder pegar essa recompensa.") and goToCity(cid)			
		elseif getPlayerStorageValue(cid, 62365) >= 4 or getGlobalStorageValue(getPlayerIp(cid)) == 4 then
			return doPlayerSendCancel(cid, "Opss, você já pegou sua recompensa em seu personagem.") and goToCity(cid)
		elseif ( getGlobalStorageValue(getPlayerAccountId(cid))+80000 ) == 4 then
			return doPlayerSendCancel(cid, "Opss, você já pegou sua recompensa em sua conta.") and goToCity(cid)
		end
		selfSay("Olá "..getCreatureName(cid)..", seja bem vindo de volta ao PokeMasterX, estou dando uma {recompensa} para todos os jogadores!", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"recompensa","recompensas"}, msg:lower()) and getDistanceToCreature(cid) < 4 then
		selfSay("Você tem certeza que quer pega a recompensa?!", cid)
		talkState[talkUser] = 2
	elseif talkState[talkUser] == 2 and isInArray({"yes", "sim", "quero"}, doCorrectString(string.lower(msg))) and getDistanceToCreature(cid) < 4 then
		selfSay("Você acaba de ganhar 1 Mewtwo Card [3] Chaances.", cid)
		--
		setChanceCard(doPlayerAddItem(cid, 19847, 1), 3)
		--
		doPlayerAddItem(cid, 18837, 1) -- 5 dias vip
		doPlayerAddItem(cid, 19581, 1) -- 3 dias shinycharm
		setPlayerStorageValue(cid, 62365, 4)
		setGlobalStorageValue(getPlayerIp(cid), 4)
		setGlobalStorageValue(getPlayerAccountId(cid)+80000, 4)
		goToCity(cid)
		talkState[talkUser] = 0
	elseif isInArray({"bye", "adeus"}, doCorrectString(string.lower(msg))) and getDistanceToCreature(cid) < 4 then
            selfSay('Adeus!',cid)
            talkState[talkUser] = 0
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())