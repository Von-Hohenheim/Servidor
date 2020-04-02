local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)

	if (not npcHandler:isFocused(cid)) then
		return false
	end

local config = {
["Easy"] = {kill = 150, cash = 100000000, rank = "Medium"},
["Medium"] = {kill = 350, cash = 200000000, rank = "Hard"},
["Hard"] = {kill = 500, cash = 300000000, rank = "Expert"},	
["Expert"] = {kill = 50, cash = 500000000, rank = "Legendary"}
}	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local cfg = config[getPlayerBrotherhoodRank(cid)]
   		   
        if (msgcontains(msg, 'brotherhood') or msgcontains(msg, 'Brotherhood')) then   --alterado v1.7   
	   
			selfSay("Olá, você deseja {entrar} na confederação brotherhood, {consultar} o andamento dos contratos, subir de {rank} ou checar as {quests}?", cid)
			talkState[talkUser] = 1
		   
        elseif (msgcontains(msg, 'entrar') or msgcontains(msg, 'Entrar')) then    --alterado v1.7
		
		  if isMemberBrotherhood(cid) then       --alterado v1.7
              selfSay("Você já é um de nossos membros!", cid)
              talkState[talkUser] = 0
              return true   
           end
		
           selfSay("Para você entrar na confederação brotherhood você precisa ser level 120+ e pagar uma taxa de 2kk, você deseja prosseguir?", cid)	
           talkState[talkUser] = 1
		   
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 1 then 

		  if getPlayerLevel(cid) < 120 then       --alterado v1.7
              selfSay("Desculpe, mas você precisa ser level 120+", cid)
              talkState[talkUser] = 0
              return true   
           end		
		   
		 if doPlayerRemoveMoney(cid, 200000000) == true then		
			  setMemberBrotherhood(cid)
			  selfSay("Pronto, agora você é um membro da confederação brotherhood.", cid)	
			  talkState[talkUser] = 0
			else
	          selfSay("Você não tem dinheiro!", cid)
	          talkState[talkUser] = 0
	        return true
         end			  
		   
        elseif (msgcontains(msg, 'consultar') or msgcontains(msg, 'Consultar')) then 
			
		   if not isMemberBrotherhood(cid) then       --alterado v1.7
              selfSay("Você não é um de nossos membros!", cid)
              talkState[talkUser] = 0
              return true   
           end
		   
			selfSay("Você já executou ["..getPlayerKillCount(cid, "easy").."] Easy, ["..getPlayerKillCount(cid, "medium").."] Medium, ["..getPlayerKillCount(cid, "hard").."], Hard, ["..getPlayerKillCount(cid, "expert").."], Expert, ["..getPlayerKillCount(cid, "legendary").."], Legendary.", cid)   
			talkState[talkUser] = 0	
		
        elseif (msgcontains(msg, 'quests') or msgcontains(msg, 'Quests')) then 
		 
		   if not isMemberBrotherhood(cid) then       --alterado v1.7
              selfSay("Você não é um de nossos membros!", cid)
              talkState[talkUser] = 0
	       elseif getPlayerLevel(cid) < 150 then
              selfSay("Você precisa ser level 150 para fazer essa quest.", cid)
              talkState[talkUser] = 0	
		   elseif getPlayerKillCount(cid, "Easy") < 75 then
              selfSay("Você precisa ter derrotado ao menos 75 fugitivos da Brotherhood.", cid)
              talkState[talkUser] = 0	
              return true   
           end
				
           selfSay("Alguns fugitivos se reuniram numa base junto com um amigo derrote-os, você deseja prosseguir?", cid)	
           talkState[talkUser] = 3	

		elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 3 then 
			
			selfSay("Junto com seu amigo elimine todos e recolha a recompensa, boa sorte guerreiro!", cid)
			doTeleportThing(cid, {x = 645, y = 722, z = 15}, true)
			talkState[talkUser] = 0				
		
        elseif (msgcontains(msg, 'rank') or msgcontains(msg, 'Rank')) then 
		 
		   if not isMemberBrotherhood(cid) then       --alterado v1.7
              selfSay("Você não é um de nossos membros!", cid)
              talkState[talkUser] = 0
	       elseif getPlayerBrotherhoodRank(cid) == "Expert" then
              selfSay("Você já está no rank máximo!", cid)
              talkState[talkUser] = 0			
              return true   
           end
				
           selfSay("Para você ir para o rank "..cfg.rank.." você precisa de "..tonumber(cfg.cash / 100000000).."kk's e ["..cfg.kill.."] contratos finalizados do rank "..getPlayerBrotherhoodRank(cid)..", deseja continuar?", cid)	
           talkState[talkUser] = 2		

		elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 2 then 
			if getPlayerKillCount(cid, getPlayerBrotherhoodRank(cid)) >= cfg.kill then
				if doPlayerRemoveMoney(cid, cfg.cash) == true then	
					setPlayerBrotherhoodRank(cid, cfg.rank)
					selfSay("Pronto você agora é do rank "..getPlayerBrotherhoodRank(cid)..".", cid)	
					talkState[talkUser] = 0 			
				else
					selfSay("Você não tem dinheiro!", cid)
					talkState[talkUser] = 0
					return true
				end
			else
				selfSay("Você precisa ter "..cfg.kill.." contratos do rank "..getPlayerBrotherhoodRank(cid)..".", cid)
				talkState[talkUser] = 0				
			end
        end		

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             