local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if isInArray({"hi", "oi", "ola", "olá"}, msg:lower()) then	
		if getPlayerStorageValue(cid, 62364) >= 1 then
			return doPlayerSendCancel(cid, "Quanto tempo! volte aqui sempre que puder")
		end
		selfSay("Olá "..getCreatureName(cid)..", seja bem vindo! gostaria de escolher algum pokémon?", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"yes", "sim", "help"}, msg:lower()) then
		if getPlayerStorageValue(cid, 62364) >= 1 then
			return doPlayerSendCancel(cid, "Quanto tempo! volte aqui sempre que puder")
		end
		local taskMode = getCatchMode(cid)
		local pokemonsToCatch = getPokemonsToCatch(cid)
		selfSay("Eu tenho aqui comigo do tipo fogo {Charmander}, {Cyndaquil} e {Torchic}, do tipo água {Squirtle}, {Totodile}, {Mudkip} e do tipo planta {Bulbasaur}, {Chikorita}, {Treecko}. Você gostaria de ter qual?", cid)
		talkState[talkUser] = 2
	elseif talkState[talkUser] == 2 and isInArray({"charmander", "squirtle", "bulbasaur", "chikorita", "cyndaquil", "totodile", "torchic", "treecko", "mudkip"}, doCorrectString(string.lower(msg))) then
		if getPlayerStorageValue(cid, 62364) >= 1 then
			return doPlayerSendCancel(cid, "Quanto tempo! volte aqui sempre que puder")
		end
		selfSay("O "..doCorrectString(msg).." é oficialmente seu primeiro pokémon.", cid)
		selfSay("Você recebeu alguns itens que irá lhe ajudar em sua jornada.", cid)
		createBall(cid, doCorrectString(msg), 0, "true")
		doPlayerAddItem(cid, 19207,50) 
		doPlayerAddItem(cid, 2392, 15) 
		doPlayerAddItem(cid, 19197,100) 
		doPlayerAddItem(cid, 19198,50)
		doTeleportThing(cid, {x = 1011, y = 998, z = 7})
		setPlayerStorageValue(cid, 62364, 1)
		talkState[talkUser] = 1
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())