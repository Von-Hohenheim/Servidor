local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
                                                  --alterado v1.8 \/ peguem ele todo!
local outs = {
["jamaican"] = {181601, 15000},
["rapper"] = {181602, 15000},
["oriental"] = {181603, 20000},
["adventurer"] = {181605, 25000},
["bussines"] = {181606, 40000},
["atletic"] = {181607, 30000},
["punk"] = {181608, 30000},
["mercenary"] = {181610, 25000},
["hiker"] = {181611, 35000},
}

msg = string.lower(msg)

        
        if (msgcontains(msg, 'outfit') or msgcontains(msg, 'outfits')) then
           selfSay("No momento eu tenho as seguintes outfits: {Jamaican, Rapper, Oriental, Adventurer, Bussines, Atletic, Punk, Mercenary e Hiker}, qual delas você vai querer?", cid)
           talkState[talkUser] = 2
        elseif outs[msg] and talkState[talkUser] == 2 then
           selfSay("Você deseja mesmo comprar essa outfit?", cid)
           outfit = outs[tostring(msg)]
           talkState[talkUser] = 3
        elseif msgcontains(msg, 'yes') and talkState[talkUser] == 3 then
           if getPlayerStorageValue(cid, outfit[1]) <= 0 then
                 if getPlayerMoney(cid) >= 300000 then
                    doPlayerRemoveMoney(cid, 300000)
                    setPlayerStorageValue(cid, outfit[1], 1)
                 else
                     selfSay("Você precisa de 30k. para comprar essa outfit.", cid)
                     talkState[talkUser] = 0
                     return false
                 end
           else
               selfSay("Você já tem essa outfit!", cid)
               talkState[talkUser] = 0
               return false
           end
           selfSay("Muito obrigado e até mais.", cid)   
           talkState[talkUser] = 0
           return true
        elseif msgcontains(msg, 'no') and talkState[talkUser] == 3 then
           selfSay("Ok então, até mais.", cid)
           talkState[talkUser] = 0                             
        end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             