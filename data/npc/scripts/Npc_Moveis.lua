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

--//
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)

local moveis = {
-- Ferramentas --
["rolling pin"] = {2570, 500},
["pot"] = {2562, 500},
["pan"] = {2563, 500},
["carpenter hammer"] = {2557, 500},
["saw"] = {2558, 2500},
["wooden spoon"] = {2567, 500},
["baking tray"] = {8848, 500},
["cutlery"] = {18829, 500},
["wooden hammer"] = {2556, 500},
-- Tapetes --
["purple tapestry"] = {1857, 1000},
["yellow tapestry"] = {1863, 1000},
["white tapestry"] = {11401, 1000},
["red tapestry"] = {1869, 1000},
["green tapestry"] = {1860, 1000},
["orange tapestry"] = {1866, 1000},
["blue tapestry"] = {1872, 1000},
-- Mesas --
["wooden table"] = {11481, 3500},
["stone table"] = {11480, 3500},
["red table"] = {11477, 3500},
["big stone table black"] = {11473, 6000},
["big stone table red"] = {11474, 6000},
["big stone table blue"] = {11475, 6000},
["big wooden table"] = {11476, 6000},
-- Espelhos --
["Wall Mirror"] = {11475, 1500},
-- Mobilias --
["drawer"] = {1716, 2500},
["clock"] = {1728, 1500},
["locker"] = {1728, 3000},
-- Plantas --
["big flowerpot"] = {2106, 5000},
["indoor plant"] = {2101, 3500},
["exotic flower"] = {2107, 2500},
["flower bowl"] = {2102, 1500},
}

local package = 13824 --id do package aki

if (msgcontains(msg, 'moveis') or msgcontains(msg, 'help')) then  
   selfSay("Olá, Eu estou vendendo moveis você está interessado em {comprar}?", cid)
   talkState[talkUser] = 2
   return true
elseif (msgcontains(msg, 'buy') or msgcontains(msg, 'comprar'))  and talkState[talkUser] == 2 then
   selfSay("Temos, Ferramentas {Rolling Pin, Pot, Pan, Carpenter Hammer, Saw, Wooden Spoon, Baking Tray, Cutlery, Wooden Hammer}, Tapetes {Purple Tapestry, Yello Tapestry, White Tapestry, Red Tapestry, Green Tapestry, Orange Tapestry, Blue Tapestry}, Mesas {Wooden Table, Stone Table, Red Table, Big Stone Table Black, Big Stone Table Red, Big Stoen Table Blue}, Espelhos {Wall Mirror}, Mobilias {Drawer, Clock, Locker}, Plantas {Big Flowerpot, Indoor Plant, Exotic Flower, Flower Bowl}", cid)
   talkState[talkUser] = 2
elseif moveis[msg] and talkState[talkUser] == 2 then
   TABLE = moveis[msg]
   selfSay("Você deseja realmente comprar?", cid)
   talkState[talkUser] = 3
elseif (msgcontains(msg, "yes") or msgcontains(msg, "sim")) and talkState[talkUser] == 3 then
   if doPlayerRemoveMoney(cid, TABLE[2]*100) then    
		if TABLE[1] == 2558 then
			doPlayerAddItem(cid, 2558, 1)
		else
          local pack = doPlayerAddItem(cid, package, 1)
          doSetItemAttribute(pack, "movel", TABLE[1])
		end
      selfSay("Muito obrigado e até mais.", cid)  
   else
      selfSay("Você não tem dinheiro.", cid)
   end
   talkState[talkUser] = 0
   return true
elseif msgcontains(msg, 'no') then
   selfSay("Ok então até mais.", cid)
   talkState[talkUser] = 0
   return true 
end 
return true
end       
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())         