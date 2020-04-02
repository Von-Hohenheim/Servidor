local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local baseprice = 0
local boost = 0

function onCreatureSay(cid, type, msg)
	
	local msg = string.lower(msg)

	if string.find(msg, "!") or string.find(msg, ",") then
		return true
	end
	
	if focus == cid then
		talk_start = os.clock()
	end
	
	if msgcontains(msg, 'hi') and focus == 0 and getDistanceToCreature(cid) <= 3 then
		selfSay('Bem-vindo a minha loja! Eu compro v�rias esp�cies de pok�mons, basta me dizer qual voc� gostaria de me vender.', cid)
		focus = cid
		conv = 1
		talk_start = os.clock()
		cost = 0
		pname = ""
		return true
	end
	
	if msgcontains(msg, 'bye') and focus == cid then
		selfSay('Vejo voc� por a�.')
		focus = 0
		return true
	end
		
	if msgcontains(msg, 'yes') and focus == cid and conv == 4 then
		selfSay('Me diga qual pok�mon voc� gostaria de me vender.', cid)
		conv = 1
		return true
	end
	
	if msgcontains(msg, 'no') and conv == 4 and focus == cid then
		selfSay('Ok, vejo voc� por a�.', cid)
		focus = 0
		return true
	end
		
	local common = {"rattata", "caterpie", "weedle", "magikarp"}
	
	if conv == 1 and focus == cid then
		for a = 1, #common do
			if msgcontains(msg, common[a]) then
				selfSay('Eu n�o compro pok�mons comuns.', cid)
				return true
			end
		end
	end
	
	if msgcontains(msg, 'no') and conv == 3 and focus == cid then
		selfSay('Bem, ent�o qual voc� gostaria de me vender?', cid)
		conv = 1
		return true
	end
		
	if (conv == 1 or conv == 4) and focus == cid then
		local name = doCorrectPokemonName(msg)
		local pokemon = pokes[name]
		
		if not pokemon then
			selfSay("Desculpe-me, mas eu n�o conhe�o este pok�mon que voc� est� falando! Voc� digitou seu nome corretamente?", cid)
			return true
		end
		
		if isShinyName(name) then
			selfSay("Desculpe-me, mas eu n�o compro pok�mons shinys.", cid)
			return true
		end
		
		cost = getPokeballPrice(getPlayerSlotItem(cid, 8))
		
		local ball = getPlayerSlotItem(cid, 8)
		boost = getItemAttribute(ball.uid, "boost") or 0
		
		if (not (ball.uid ~= 0 and getItemAttribute(ball.uid, "poke"))) or (getItemAttribute(ball.uid, "poke"):lower() ~= msg:lower()) then
			selfSay("Preciso que voc� coloque seu "..name.." no slot principal!", cid)
			return true
		end
		
		if cost == -1 then
			selfSay("Desculpe-me, mas eu n�o tenho um pre�o para este pok�mon.", cid)
			return true
		end
		
		pname = doCorrectPokemonName(msg)
		selfSay("Voc� tem certeza que gostaria de me vender seu "..name.." (+"..boost..") por $"..convertMoneyValue(cost * 100).."?", cid)
		conv = 3 
	end
	
	if isConfirmMsg(msg) and focus == cid and conv == 3 then
	
	
		if isRiderOrFlyOrSurf(cid) then
			selfSay("Voc� precisa sair de cima do seu pok�mon!", cid)
			return true
		end
		
		if #getCreatureSummons(cid) >= 1 then
			selfSay("Puxe seu pok�mon para podermos conversar.", cid)
			focus = 0
			return true
		end
		
		local ball = getPlayerSlotItem(cid, 8)
		if ball.uid ~= 0 then 
			if getItemAttribute(ball.uid, "poke"):lower() == pname:lower() and (getItemAttribute(ball.uid, "boost") or 0) == boost then
				if not getItemAttribute(ball.uid, "unique") then --alterado v1.6
					selfSay("Nossa, obrigado por este incr�vel "..pname.."! Pegue seus $".. convertMoneyValue(cost * 100) ..". Voc� gostaria de me vender algum outro pok�mon?", cid)
					doPlayerAddMoney(cid, (cost * 100))
					doRemoveItem(getPlayerSlotItem(cid, 8).uid, 1) --alterado v1.6
					conv = 1
					selfSay("Voc� tem algum outro pok�mon incr�vel que queira me vender?", cid)
					return true
				end
			end
		else
			selfSay("Preciso que voc� coloque seu "..pname.." no slot principal!", cid)
			return true
		end
		
		selfSay("Eu acho que voc� n�o tem um "..pname..". Tenha certeza que ele est� no slot principal e que n�o esteja desmaiado e que n�o seja unique.", cid)	
		conv = 1
		return true
	end	
end
		
local intervalmin = 38
local intervalmax = 70
local delay = 25
local number = 1
local messages = {"Compro alguns pok�mons incr�veis! Venha aqui me vender alguns!",
	"Gostaria de vender algum pok�mon? Aqui � o lugar ideal!",
	"Compro pok�mons! Ofertas excelentes!",
	"Cansado deste pok�mon? Eu compro ele de voc�!",
}
		
function onThink()
	
	if focus == 0 then
		selfTurn(1)
		delay = delay - 0.5
		if delay <= 0 then
			selfSay(messages[number])
			number = number + 1
			if number > #messages then
				number = 1
			end
			delay = math.random(intervalmin, intervalmax)
		end
		return true
	else
		
		if not isCreature(focus) then
			focus = 0
			return true
		end
		
		local npcpos = getThingPos(getThis())
		local focpos = getThingPos(focus)
		
		if npcpos.z ~= focpos.z then
			focus = 0
			return true
		end
		if (os.clock() - talk_start) > 70 then
			focus = 0
			selfSay("Eu tenho v�rios clientes, fale comigo quando decidir me vender algum pok�mon.")
		end
		
		if getDistanceToCreature(focus) > 3 then
			selfSay("Tchau e obrigado!")
			focus = 0
			return true
		end
		
		local dir = doDirectPos(npcpos, focpos)	
		selfTurn(dir)
	end
	
	
	return true
end