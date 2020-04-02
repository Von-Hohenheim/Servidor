local prize, question, answer, globalSto, t, sto = {}, nil, nil, 11789, {}, nil
local model = "$question\nPrêmio: $itemcountx $itemname\nUse !responder [resposta]"
function checkAsks()
	local sto = getGlobalStorageValue(globalSto) and getGlobalStorageValue(globalSto) or "nothing"
	local haveAsk = (type(sto) == "string" and sto ~= "nothing")
	if haveAsk then
		local t = string.explode(sto, ":::")
		local question = t[1]
		local answer = t[2]
		local prizeItem = t[3]
		local prizeCount = t[4]
		local str = ""
		str = string.gsub(model, "$question", question)
		str = string.gsub(str, "$itemcount", prizeCount)
		str = string.gsub(str, "$itemname", (getItemInfo(prizeItem).name))
		doBroadcastMessage(str)
		addEvent(checkAsks, 1000 * 60)
	end
end

function onSay(cid, words, param, channel)
sto = getGlobalStorageValue(globalSto) and getGlobalStorageValue(globalSto) or "nothing"
	if words == "!perguntar" then
		if not param then
			doPlayerSendTextMessage(cid, 20, "Parâmetro errado.")
			return true
		end
		t = string.explode(param, ":::")
		if #t ~= 4 then
			doPlayerSendTextMessage(cid, 20, "Certifique-se que o parâmetro está nesse modelo: '!perguntar Quanto e 1+1:::2:::2160:::1'.")
			return true
		end
		question = t[1]
		answer = t[2]
		prize.i = t[3]
		prize.c = t[4]
		if setGlobalStorageValue(globalSto, question .. ":::".. answer .. ":::".. (prize.i) .. ":::" .. (prize.c)) then
			doPlayerSendTextMessage(cid, 20, "Questão ativa.")
			checkAsks()
		end
	elseif words == "!responder" then
		if (type(sto) == "number" or sto == "nothing") then
			doPlayerSendTextMessage(cid, 22, "Nenhuma questão agora.")
			return true
		end
		t = string.explode(sto, ":::")
		answer = t[2]
		prize.i = t[3]
		prize.c = t[4]
		if string.lower(param) == string.lower(answer) then
			doPlayerSendTextMessage(cid, 20, "Resposta correta!")
			doPlayerAddItem(cid, prize.i, prize.c)
			doBroadcastMessage(getCreatureName(cid) .. " foi o primeiro a responder a questão corretamente e recebeu ".. (prize.c) .. "x "..(getItemInfo(prize.i).name) .. "!")
			doBroadcastMessage("A resposta era: "..answer..".")
			doSendMagicEffect(getThingPos(cid), 14)
			setGlobalStorageValue(globalSto, "nothing")
		else
			doPlayerSendTextMessage(cid, 20, "Resposta errada!")
		end
	end

	return true
end 