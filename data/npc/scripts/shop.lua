local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                  npcHandler:onThink()                  end
 
function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local premium = {
		["5"] = {itemid = 18837, cost = 3},
		["30"] = {itemid = 18838, cost = 10},
		["60"] = {itemid = 18839, cost = 18},
		["90"] = {itemid = 18840, cost = 25},
	}
	
	if isInArray({"oi", "hello"}, msg:lower()) then
		selfSay("Oi, ".. getCreatureName(cid) .."! Eu posso te vender {premium}, {items} e {bless}. Deseja comprar algo?", cid)
		return true
	end
	
	if isInArray({"premium", "vip"}, msg:lower()) then -- Premium
		selfSay("Eu tenho pacotes de {5} Dias (3 Rubys), {30} Dias(10 Rubys), {60} Dias (18 Rubys) e {90} Dias (25 Rubys).", cid)
		talkState[talkUser] = 1
		return true
	elseif isInArray({"5", "30", "60", "90"}, msg:lower()) and talkState[talkUser] == 1 then
		local item = premium[msg]
		if getPlayerItemCount(cid, 2145) > item.cost then
			doPlayerAddItem(cid, item.itemid, 1)
			selfSay("Aqui está seus "..msg.." dias premium.", cid)
			doPlayerRemoveItem(cid, 2145, item.cost)
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end
	end
	
	if isInArray({"bless"}, msg:lower()) then -- items
		if getPlayerLevel(cid) >= 200 then
			price1 = 3
			price2 = 4
			price3 = 6
			msg = "Lembrando que essa bless é para level superior ou igual a 200."
		else
			price1 = 2
			price2 = 3
			price3 = 5
			msg = "Lembrando que essa bless é para level inferior a 200."
		end
		selfSay("Eu posso lhe vender bless de {20}% ("..price1.."), {50}% ("..price2..") e {100}% ("..price3..")."..msg.." Você tem interesse?", cid)
		talkState[talkUser] = 2
	elseif isInArray({"20", "50", "100"}, msg:lower()) and talkState[talkUser] == 2 then
		
		local bless = {
			["20"] = {percent = 20, price = 500},
			["50"] = {percent = 50, price = 500},
			["100"] = {percent = 100, price = 500},
		}
		
		if getPlayerLevel(cid) >= 200 then
			bless["20"].price = 3
			bless["50"].price = 4
			bless["100"].price = 6
		else
			bless["20"].price = 2
			bless["50"].price = 3
			bless["100"].price = 5
		end
	
		if getPlayerItemCount(cid, 2145) > bless[msg].price then
			selfSay("Aqui está sua bless de "..msg.."%.", cid) --bless[msg].percent
			setPlayerStorageValue(cid, 50405, bless[msg].percent)
			doPlayerRemoveItem(cid, 2145, bless[msg].price) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end			
	end
	
	if isInArray({"item", "items", "itens"}, msg:lower()) then -- items
		selfSay("Eu vendo {Shiny Stone} (5 Rubys), {Kit Ski} (4 Rubys), {Kit Mergulho} (4 Rubys), {Snowboard} (4 Rubys), {Sandboard} (4 Rubys).", cid)
		selfSay("{Shiny Charm} com duração de 1 semana (20 Ruby), {Held Recovery} (10 Ruby) e {Bike} (6 Ruby).", cid)
		selfSay("Também vendo Experiences Boosters: ", cid)
		selfSay("{Experience Booster 1} - 10% por uma hora (2 Ruby),", cid)
		selfSay("{Experience Booster 2} - 20% por uma hora (4 Ruby),", cid)
		selfSay("{Experience Booster 3} - 10% por uma semana (10 Ruby),", cid)
		selfSay("{Experience Booster 4} - 20% por uma semana (15 Ruby),", cid)
		selfSay("{Experience Booster 5} - 15% por um mês (30 Ruby),", cid)
		selfSay("{Experience Booster 6} - 20% por um mês (40 Ruby).", cid)
		talkState[talkUser] = 3

	elseif isInArray({"experience booster 1"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 2 then
			doPlayerAddItem(cid, 19268, 1)
			selfSay("Faça bom proveito desse Experience Booster 1!", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 2) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end		
	elseif isInArray({"experience booster 2"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 4 then
			doPlayerAddItem(cid, 19269, 1)
			selfSay("Faça bom proveito desse Experience Booster 2!", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 4) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end				
	elseif isInArray({"experience booster 3"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 10 then
			doPlayerAddItem(cid, 19270, 1)
			selfSay("Faça bom proveito desse Experience Booster 3!", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 10) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end				
	elseif isInArray({"experience booster 4"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 15 then
			doPlayerAddItem(cid, 19271, 1)
			selfSay("Faça bom proveito desse Experience Booster 4!", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 15) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end				
	elseif isInArray({"experience booster 5"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 30 then
			doPlayerAddItem(cid, 19272, 1)
			selfSay("Faça bom proveito desse Experience Booster 5!", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 30) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end				
	elseif isInArray({"experience booster 6"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 40 then
			doPlayerAddItem(cid, 19273, 1)
			selfSay("Faça bom proveito desse Experience Booster 6!", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 40) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end			

	elseif isInArray({"shiny charm", "charm"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 20 then
			doPlayerAddItem(cid, 19274, 1)
			selfSay("Faça bom proveito deste Shiny Charm!", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 20) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end	
	elseif isInArray({"held recovery", "held", "recovery"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 10 then
			doPlayerAddItem(cid, 19276, 1)
			selfSay("Faça bom proveito deste Held Recovery!", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 10) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end	
	elseif isInArray({"shiny stone", "shiny", "stone"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 5 then
			doPlayerAddItem(cid, 19203, 1)
			selfSay("Aqui está sua shiny stone.", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 5) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end	
	elseif isInArray({"kit ski", "ski"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 4 then
			doPlayerAddItem(cid, 19212, 1) --19212, 19213, 19214
			doPlayerAddItem(cid, 19213, 1)
			doPlayerAddItem(cid, 19214, 1)
			selfSay("Aqui está seu kit ski.", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 4) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end	
	elseif isInArray({"kit mergulho", "mergulho"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 4 then
			doPlayerAddItem(cid, 19218, 1) --19218, 19217, 19216
			doPlayerAddItem(cid, 19217, 1)
			doPlayerAddItem(cid, 19216, 1)
			selfSay("Aqui está seu kit mergulho.", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 4) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end	
	elseif isInArray({"sandboard", "sand"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 4 then
			doPlayerAddItem(cid, 19215)
			selfSay("Aqui está seu sandboard.", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 4) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end		
	elseif isInArray({"snowboard", "snow"}, msg:lower()) and talkState[talkUser] == 3 then
		if getPlayerItemCount(cid, 2145) > 4 then
			doPlayerAddItem(cid, 19219) --19218, 19217, 19216
			selfSay("Aqui está seu snowboard.", cid) --bless[msg].percent
			doPlayerRemoveItem(cid, 2145, 4) 
			talkState[talkUser] = 0
			return true
		else
			selfSay("Você não tem rubys suficiente.", cid)
			talkState[talkUser] = 0
			npcHandler:releaseFocus(cid)
			return true
		end				
	end

	--talkState[talkUser] = 0
	--npcHandler:releaseFocus(cid)
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())