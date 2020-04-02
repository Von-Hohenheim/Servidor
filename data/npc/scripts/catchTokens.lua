local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end


function getBallsForTokens(tokens)
	local any = 5
	local value = 0
	repeat
		if (value + any) <= tokens then
			value = value + any
		else
			break
		end
	until(value >= tokens)
	
	return {token = value, numberBalls = (value/any) * 15}
end

local balls = {
	["heavy"] = 15672,
	["fast"] = 15682,
	["tinker"] = 15681,
	["dusk"] = 15680,
	["yume"] = 15678,
	["magu"] = 15677,
	["sora"] = 15676,
	["net"] = 15675,
	["moon"] = 15674,
	["tale"] = 15673,
}

function checkTokens(cid)
	local playerTokens = getPlayerItemCount(cid, 19221)
	local tokenTab = getBallsForTokens(playerTokens)
	return not (playerTokens < 1 or tokenTab.token < 5)
end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if isInArray({"hi", "oi", "ola", "olá"}, msg:lower()) then		
		selfSay("Olá "..getCreatureName(cid)..", eu troco {Catcher Tokens} por pokebolas especiais. Você está interessado? A cada 5x Catcher Tokens você tem direito a 15x pokebolas especiais.", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"yes", "sim", "catch", "token", "catch token", "ball", "special"}, msg:lower()) then
		if not checkTokens(cid) then
			selfSay("Pelo visto você não tem uma quantidade suficiente de Catcher Token!", cid)
			talkState[talkUser] = 0
			return true
		end
		local tokenTab = getBallsForTokens(getPlayerItemCount(cid, 19221))
		selfSay("Eu aceito ".. tokenTab.token .."x Catcher Tokens por ".. tokenTab.numberBalls .."x um tipo de pokebolas especiais da sua escolha! Está afim?" , cid)
		selfSay("Se você quiser comprar pokebola variada, guarde o suficiente no depot e depois fale comigo!" , cid)
		talkState[talkUser] = 2
	elseif talkState[talkUser] == 2 and isInArray({"yes", "sim"}, msg:lower()) then
		local pokebolas = {}
		for ball, itemid in pairs(balls) do
			table.insert(pokebolas, "{"..doCorrectString(ball).."} ball")
		end
		selfSay("Eu tenho "..doConcatTable(pokebolas, ", ", " e ")..". Qual você prefere?", cid)
		talkState[talkUser] = 3
	elseif talkState[talkUser] == 3 and balls[msg:lower()] then
		if not checkTokens(cid) then
			selfSay("Pelo visto você não tem uma quantidade suficiente de Catcher Token!", cid)
			talkState[talkUser] = 0
			return true
		end
		local ballItemid = balls[msg:lower()]
		selfSay("Aqui está suas ".. getBallsForTokens(getPlayerItemCount(cid, 19221)).numberBalls .."x "..doCorrectString(getItemNameById(ballItemid)).."s. Faça bom proveito delas.", cid)
		doPlayerAddItem(cid, ballItemid, getBallsForTokens(getPlayerItemCount(cid, 19221)).numberBalls)
		doPlayerRemoveItem(cid, 19221, getBallsForTokens(getPlayerItemCount(cid, 19221)).token)
		talkState[talkUser] = 0
		return true
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())