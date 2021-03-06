function onCreatureTurn(creature)
end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

local talkState = {}
local focus = 0
local talk_start = 0
local lookNpcDir = getNPCXMLLOOKDIR(getNPCXMLNAME(getThis()))
local tchau = false

function onCreatureSay(cid, type, msg)
local msg = string.lower(msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if not (getDistanceToCreature(cid) <= 3) then
	return true
end

if msgcontains(string.lower(msg), 'hi') then
	if focus ~= 0 then
	   selfSay(getCreatureName(cid) .. ' aguarde...')
	   return true
	else
		focus = cid
		talk_start = os.clock()
	end
end

local storBro = getPlayerStorageValue(cid, storages.BrotherHoodMember)
local dif = {"easy", "medio", "hard", "expert"}

if((msgcontains(string.lower(msg), 'hi')) and (getDistanceToCreature(cid) <= 3)) then
   selfSay("Ol�! Tudo bem? Sou o Mestre do Duelist Brotherhood Club. O que deseja?") 
   talkState[talkUser] = 1
elseif((msgcontains(string.lower(msg), 'help')) and (getDistanceToCreature(cid) <= 3) and talkState[talkUser] == 1) then
	
	if storBro == -1 then -- nao participa do club
	   selfSay("Come�e falando com o membro Parachute.")
	   talkState[talkUser] = 0
	   tchau = true
	   focus = 0
	elseif storBro == 1 then
	   local contracts = getPlayerStorageValue(cid, storages.PLAYERCONTRACTSCOUNTS)
	   if tonumber(contracts) < 1000 then
	      selfSay("Voc� ainda n�o completou os 1000 contratos. Para ver quantos faltam digite '!brother'.")
	      talkState[talkUser] = 0
	      tchau = true
	      focus = 0
	   else
	      selfSay("Voc� tem certeza que deseja continuar? Preciso que mate 5 NPCs lendarios.")
	      talkState[talkUser] = 2	
	   end	
	elseif storBro == 2 then
	   local contracts = getPlayerStorageValue(cid, storages.PLAYERCONTRACTSCOUNTS)
	        if tonumber(contracts) < 5 then
		  selfSay("Voc� ainda n�o completou os 5 contratos lendarios. Para ver quantos faltam digite '!brother'.")
		  talkState[talkUser] = 0
	          tchau = true
	          focus = 0
		else
		  selfSay("Parab�ns! Voc� concluiu os 5 desafios. Aqui est� seus premios.")
		  doPlayerAddExp(cid, 10000000)
	          doSendAnimatedText(getThingPos(cid), 10000000, 215)
		  doPlayerAddRandomHeldQuest(cid)
		  setPlayerStorageValue(cid, storages.BrotherHoodMemberOUTFITMASTER, 1)
		  setPlayerStorageValue(cid, storages.BrotherHoodMember, 3)
		  talkState[talkUser] = 0
	          tchau = true
	          focus = 0
		end
	else
		selfSay("Voc� j� concluiu a Duelist Brotherhood Quest.")
		talkState[talkUser] = 0
	        tchau = true
	        focus = 0
	end
	
	
elseif((msgcontains(string.lower(msg), 'yes')) and (getDistanceToCreature(cid) <= 3) and talkState[talkUser] == 2) then
	
	selfSay("Boa sorte em sua ca�ada. Volte assim que derrotar 5 NPCs lendarios.")
	setPlayerStorageValue(cid, storages.BrotherHoodMember, 2)
	setPlayerStorageValue(cid, storages.PLAYERCONTRACTSCOUNTS, 0)
	setPlayerStorageValue(cid, storages.BrotherHoodMemberRANK, "Lendario")
	talkState[talkUser] = 2
	tchau = true
	focus = 0

elseif isInArray(dif, string.lower(msg)) and getDistanceToCreature(cid) <= 3 and talkState[talkUser] == 2 then

	if doPlayerRemoveMoney(cid, 100000) then
	   setPlayerStorageValue(cid, storages.BrotherHoodMemberRANK, doCorrectString(msg))
	   selfSay("A dificuldade do seu rank agora esta em '"..doCorrectString(msg).."'.")
	else
	   selfSay("Dinheiro insuficiente.")
	end	
	tchau = true
	focus = 0	

elseif msgcontains(string.lower(msg), 'bye') then
	tchau = true
	focus = 0
end

return true
end


function onThink()
	if focus  ~= 0 then
		if getDistanceToCreature(focus) > 3 then
			tchau = true
			focus = 0
		end

		if (os.clock() - talk_start) > 15 then
			if focus > 0 then
				tchau = true
				focus = 0
			end
		end
		doNpcSetCreatureFocus(focus)
	end

		if tchau then
			tchau = false
			doCreatureSetLookDir(getThis(), lookNpcDir)
			selfSay('Tchau.')
		end
end
