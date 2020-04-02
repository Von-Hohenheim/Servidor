local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

local config = {
		["Luana"] = {
			need = {
					{id = 12161, qt = 500}, --water gem
					{id = 12170, qt = 30}, -- water pendant
					},
			rewards = {
					{id = 2152, qt = 20}, -- 2K
					{id = 12344, qt = 20}, -- 20 revive
					},
			storage = 431300,
			descryption = "{500 Water Gem, 30 Water Pendant}"
					},
		["Clara"] = {
			need = {
				  {id = 12163, qt = 500}, --seed  
				  {id = 12170, qt = 30}, --pairs of leaves  
			   },
			rewards = {
				  {id = 2152, qt = 20}, -- 2K
				  {id = 12344, qt = 20}, -- 20 revive
			   }, 
			storage = 431301,
			descryption = "{500 Seeds, 30 Pair Of Leaves}"
					}
	}
	
function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid	 
 	local cfg = config[getNpcName()]
	
 	if isInArray({"hi", "oi", "ola", "olá"}, msg:lower()) and getDistanceToCreature(cid) < 4 then	
		
		if getPlayerStorageValue(cid, cfg.storage) == 1 then
			selfSay("Olá! muito obrigado pelo que você fez!", cid)
			return true
		end
		
		selfSay("Olá você poderia me ajudar?", cid)
		talkState[talkUser] = 1
		
	elseif isInArray({"help", "ajuda"}, msg:lower()) and talkState[talkUser] == 1 then	
      
	  if getPlayerStorageValue(cid, cfg.storage) >= 1 then
		 selfSay("Você já concluio essa quest!", cid)
         talkState[talkUser] = 0
         return true
      end
	  
	  selfSay("Você poderia me trazer "..cfg.descryption.."?.", cid)
      talkState[talkUser] = 2
      return true 
   elseif isInArray({"yes", "sim"}, msg:lower()) and talkState[talkUser] == 2 then

	  if getPlayerItemCount(cid, cfg.need[1].id) < cfg.need[1].qt then
		 selfSay("Você não trouxe os itens necessários..", cid)
         selfSay("Lembre-se, os itens são "..cfg.descryption.."...", cid)
         talkState[talkUser] = 0
         return true
      end
	  
      for i = 1, #cfg.need do
          doPlayerRemoveItem(cid, cfg.need[i].id, cfg.need[i].qt)
      end
	  
      for i = 1, #cfg.rewards do
          doPlayerAddItem(cid, cfg.rewards[i].id, cfg.rewards[i].qt)
      end
	  
	  setPlayerStorageValue(cid, cfg.storage, 1)
	  selfSay("Pronto, aqui está sua recompensa por me ajudar!", cid)
      talkState[talkUser] = 0
   end	
	
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())