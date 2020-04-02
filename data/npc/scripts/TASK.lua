Taskstr = {}

local pokemonTable = {
	storages = {
		storeInformations = 432415,
	},
	NpcName = "Gabriel",
	reward = {{2160, 100}, {15645, 10}},
	exp = 2000,
	pokemons = {
		["Charizard"] = 2,
		["Blastoise"] = 3,
	},
	doOnlyOne = true,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if msg:lower() == "hi" then
		if getPlayerStorageValue(cid, pokemonTable.storages.storeInformations) == -1 then
			Taskstr[talkUser] = {}
			for a, b in pairs(pokemonTable.pokemons) do
				table.insert(Taskstr[talkUser], b.." "..a.."s")
			end
			local KAKAMESSAGE = doConcatTable(Taskstr[talkUser], ", ", " e ")
			selfSay("Olá, eu posso te dá task de "..KAKAMESSAGE..".", cid)
			talkState[talkUser] = 1
		elseif getPlayerStorageValue(cid, pokemonTable.storages.storeInformations) == 1 then
			selfSay("Não preciso mais da sua ajuda, obrigado!", cid)
		else
			local tab = string.explode(getPlayerStorageValue(cid, pokemonTable.storages.storeInformations), "|")
			selfSay("Você já terminou a minha task?", cid)
			talkState[talkUser] = 3				
		end
		
	elseif talkState[talkUser] == 1 and (pokemonTable.pokemons[doCorrectString(msg)] or isInArray({"yes", "sim"}, msg:lower())) then
		pName = doCorrectString(msg)
		selfSay("Você tem certeza disso?", cid)
		talkState[talkUser] = 2
		
	elseif talkState[talkUser] == 2 then
		if isInArray({"yes", "sim"}, msg:lower()) then
		
			Taskstr[talkUser] = {}
			for a, b in pairs(pokemonTable.pokemons) do
				table.insert(Taskstr[talkUser], a..","..b)
			end
			setPlayerStorageValue(cid, pokemonTable.storages.storeInformations,pokemonTable.NpcName.."|"..table.concat(Taskstr[talkUser], "|"))
			selfSay("Ok, vá terminar a task!", cid)
			
		elseif isInArray({"no", "não", "nao"}, msg:lower()) then
		
			selfSay("Você quem sabe.", cid)
			talkState[talkUser] = 0	
		end
	elseif talkState[talkUser] == 3 then
		if isInArray({"yes", "sim"}, msg:lower()) then
			local tab = string.explode(getPlayerStorageValue(cid, pokemonTable.storages.storeInformations), "|")
			if not tab[2] then
				doPlayerAddExperience(cid, pokemonTable.exp)
				doSendAnimatedText(getThingPos(cid), pokemonTable.exp, 215)
				for a, b in pairs(pokemonTable.reward) do
					doPlayerAddItem(cid, b[1], b[2])
				end
				if pokemonTable.doOnlyOne then
					setPlayerStorageValue(cid, pokemonTable.storages.storeInformations, 1)
				else
					setPlayerStorageValue(cid, pokemonTable.storages.storeInformations, -1)
				end
				-- setPlayerStorageValue(cid, stoNumber, Value)
				selfSay("Você finalizou a task! Pegue seus prêmios.", cid)
				talkState[talkUser] = 0
			else
				talkState[talkUser] = 0
				local str1 = {}
				local tab = string.explode(getPlayerStorageValue(cid, pokemonTable.storages.storeInformations), "|")
				for i = 2, #tab do
					expe = tab[i]:explode(",")				
					table.insert(str1, expe[2].." "..expe[1]..(tonumber(expe[2]) > 1 and "s" or ""))
				end			

				selfSay("Está faltando você matar ".. doConcatTable(str1, ", ", " e ") .." desta espécie!", cid)
			end
		elseif isInArray({"no", "não", "nao"}, msg:lower()) then
			selfSay("Ok, então vá terminar de matá-los!", cid)
			talkState[talkUser] = 0
		elseif isInArray({"left", "leave", "desistir"}, msg:lower()) then
			setPlayerStorageValue(cid, pokemonTable.storages.storeInformations, -1)	
			selfSay("Ok, pedirei ajuda a alguém mais corajoso!", cid)
			talkState[talkUser] = 0			
		end
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())