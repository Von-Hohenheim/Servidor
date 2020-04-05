local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if isInArray({"hi", "oi", "hola", "olá"}, msg:lower()) then	
		if getPlayerStorageValue(cid, 62364) >= 1 then
			return doPlayerSendCancel(cid, "¡Cuanto tiempo! vuelve aquí siempre que puedas")
		end
		selfSay("Hola "..getCreatureName(cid)..", ¡sea bienvenido! Me gustaría que eligiera algun Pokémon, pero has llegado demaciado tarde, y solo me queda un pokemon. Parece que te quedastes dormido", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"yes", "si", "help"}, msg:lower()) then
		if getPlayerStorageValue(cid, 62364) >= 1 then
			return doPlayerSendCancel(cid, "¡Cuanto tiempo! vuelve aquí siempre que puedas")
		end
		local taskMode = getCatchMode(cid)
		local pokemonsToCatch = getPokemonsToCatch(cid)
		selfSay("Solo tengo conmigo un {Pikachu}, te gustaria tenerlo?", cid)
		talkState[talkUser] = 2
	elseif talkState[talkUser] == 2 and isInArray({"pikachu"}, doCorrectString(string.lower(msg))) then
		if getPlayerStorageValue(cid, 62364) >= 1 then
			return doPlayerSendCancel(cid, "¡Cuanto tiempo! vuelve aquí siempre que puedas")
		end
		selfSay("O "..doCorrectString(msg).." es oficialmente su primer pokemon.", cid)
		selfSay("Has recibido algunos artículos que te ayudarán en tu viaje.", cid)
		createBall(cid, doCorrectString(msg), 0, "true")
		doPlayerAddItem(cid, 19207,50) 
		doPlayerAddItem(cid, 2394, 75) 
		doPlayerAddItem(cid, 2393, 25)
		doPlayerAddItem(cid, 2391, 20)
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