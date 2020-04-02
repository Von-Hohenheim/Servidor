local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

   local storage = 431303	
   
   local need = {
      {id = 19503, qt = 1500}, --piece of steel
      {id = 13868, qt = 250}, --steel wing  
   }
      
 	if isInArray({"hi", "oi", "ola", "ol�"}, msg:lower()) then	
		
		if getPlayerLevel(cid) < 180 then
			selfSay("Voc� precisa ser level 180 para poder me ajudar!", cid)
			talkState[talkUser] = 0
			return true
		end
		
		if getPlayerStorageValue(cid, storage) >= 1 then
			selfSay("Muito obrigado pelo que voc� fez!", cid)
			talkState[talkUser] = 0
		elseif getPlayerStorageValue(cid, storage+1) >= 1 then
			
			if getPlayerItemCount(cid, need[1].id) < need[1].qt then
				selfSay("Voc� n�o me trouxe os itens necess�rios, que s�o {250 Steel Wing, 1500 Piece of Steel}.", cid)
				talkState[talkUser] = 0	
				return true
			end		
			
			for i = 1, #need do
				doPlayerRemoveItem(cid, need[i].id, need[i].qt)
			end
				
			doPlayerAddItem(cid, 7590, 1)
			selfSay("Localize a base do meu mundo e com esse frasco colete a essencia dos porygons, quando estiver cheio use no portal para ser teleportado, boa sorte!", cid)
			setPlayerStorageValue(cid, storage, 1)				
			talkState[talkUser] = 0	
		else
			selfSay("Ol� onde estou? que lugar � esse? voc� pode me {ajudar}?", cid)
			talkState[talkUser] = 1
			return true
		end		
		
	elseif isInArray({"help", "ajudar", "ajuda"}, msg:lower()) and talkState[talkUser] == 1 then	

	  selfSay("O Big Porygon dominou todo o mundo porygon, tive que atravessar o portal dimensional e n�o sei onde estou, voc� precisa derrota-lo aceita essa miss�o?.", cid)
      talkState[talkUser] = 2
      return true 
	  
	elseif isInArray({"sim", "yes", "miss�o"}, msg:lower()) and talkState[talkUser] == 2 then	
	  
	  selfSay("Para um humano entrar no nosso mundo ser� necess�rio voc� fazer um frasco para coletar a essencia porygon, traga-me {250 Steel Wing, 1500 Piece of Steel}.", cid)
	  setPlayerStorageValue(cid, storage+1, 1)	  
      talkState[talkUser] = 3	  
      return true 	   	
	end
	return true
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())