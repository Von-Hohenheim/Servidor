local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end
		
function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local today = getNumberDay().."-"..getNumberMonth().."-"..getNumberYear()
	
	if today ~= getLastDailyItens(cid) then
		resetDailyItens(cid)
	end	

	if isInArray({"hi", "oi", "ola", "olá"}, msg:lower()) and getDistanceToCreature(cid) < 4 then

		if today == getLastDailyItens(cid) and getPlayerStorageValue(cid, 251479) >= 1 then
			selfSay("Não preciso mais de sua ajuda até mais!", cid)
			return true
		end
			
		if inDailyItens(cid) then
			selfSay("Você já trouxe os itens que lhe pedi?", cid)
			talkState[talkUser] = 3
			return true
		end

		selfSay("Olá "..getCreatureName(cid)..", procuro itens raros para fazer trocas mundo a fora, você deseja trabalhar para mim?", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"yes", "sim", "itens"}, msg:lower()) then
		sendMsgToItens(cid)
		talkState[talkUser] = 2
	elseif talkState[talkUser] == 2 and isInArray({"yes", "sim", "itens"}, msg:lower()) then
		setPlayerStorageValue(cid, 251480, 1)	
		selfSay("Beleza, quando tiver os itens entre em contato!", cid)
	elseif talkState[talkUser] == 3 then
		if isInArray({"yes", "sim", "itens"}, msg:lower()) then
			if getDailyItens(cid) then
			
				if getPlayerStorageValue(cid, 509001) >= 1 then
					if isPremium(cid) then
						setTowerChance(cid, 5)
						doSendMsg(cid, "Você acaba de ganhar [5] Tower Chance.")
					else
						setTowerChance(cid, 3)
						doSendMsg(cid, "Você acaba de ganhar [3] Tower Chance.")
					end
				end	   
				
				if getPlayerClanName(cid) ~= 'No Clan!' then
					if isPremium(cid) then
						addChaveToClan(cid)
						addChaveToClan(cid)
						addChaveToClan(cid)
					else
						addChaveToClan(cid)
						addChaveToClan(cid)
					end
				end		
			
				addCashToPlayer(cid)
				doPlayerRemoveDailyItens(cid)
				setPlayerStorageValue(cid, 251479, 1)	
				selfSay("Obrigado, você acaba de me ajudar na coleção de novos itens!", cid)			
				selfSay("Obrigado! Você terminou todas as missões por hoje!", cid)		
			else
				sendMsgCountToItens(cid)
			end
			
		elseif isInArray({"no", "não", "nao"}, msg:lower())	then
			sendMsgCountToItens(cid)
		end
		talkState[talkUser] = 0
		return true		
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())