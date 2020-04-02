local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

   local storage = 431300	
   local need = {
      {id = 12161, qt = 500}, --water gem  
      {id = 12170, qt = 30}, --water pendant  
   }
   
   local rewards = {
      {id = 2152, qt = 20}, -- 2K
      {id = 12344, qt = 20}, -- 20 revive
   } 
   
 	if isInArray({"hi", "oi", "ola", "olá"}, msg:lower()) then	
		
		if getPlayerStorageValue(cid, storage) == 1 then
			selfSay("Olá! muito obrigado pelo que você fez!", cid)
			return true
		end
		
		selfSay("Olá você poderia me ajudar?", cid)
		talkState[talkUser] = 1
		
	elseif isInArray({"help", "ajuda"}, msg:lower()) and talkState[talkUser] == 1 then	
      
	  if getPlayerStorageValue(cid, storage) >= 1 then
		 selfSay("Você já concluio essa quest!", cid)
         talkState[talkUser] = 0
         return true
      end
	  
	  selfSay("Você poderia me trazer {500 Water Gem, 30 Water Pendant}?.", cid)
      talkState[talkUser] = 2
      return true 
   elseif isInArray({"yes", "sim"}, msg:lower()) and talkState[talkUser] == 2 then

	  if getPlayerItemCount(cid, need[1].id) < need[1].qt then
		 selfSay("Você não trouxe os itens necessários..", cid)
         selfSay("Lembre-se, os itens são {500 Water Gem, 30 Water Pendant}...", cid)
         talkState[talkUser] = 0
         return true
      end
	  
      for i = 1, #need do
          doPlayerRemoveItem(cid, need[i].id, need[i].qt)
      end
	  
      for i = 1, #rewards do
          doPlayerAddItem(cid, rewards[i].id, rewards[i].qt)
      end
	  
	  setPlayerStorageValue(cid, storage, 1)
	  selfSay("Pronto, aqui está sua recompensa por me ajudar!", cid)
      talkState[talkUser] = 0
   end	
	
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())