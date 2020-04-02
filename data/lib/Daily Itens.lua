local dailyItens = {
	itemQ = {19502, 19504, 12162, 12745, 19541, 12337, 12164, 12161, 19501, 19503, 12165, 12745, 12206, 13783, 13785},
	minCount = 1000,
	maxCount = 2000,
	ItemRare = {
		12159, 12177, 12176, 12153, 12179, 12181, 12194, 12196, 12188, 12171, 8309, 12334, 12170, 12282, 12200, 12155, 12157, 12173, 12152, 12201, 13789, 19526,
		19515, 12275, 19499, 12195, 19508, 19514, 19524, 19522, 19529, 19511, 19519, 19525, 19516, 19528, 13870, 19530, 19536, 19517, 13875, 12202, 19532, 19533, 
		19539, 19543, 13884, 19540, 13871, 19542, 12160, 13896, 12166, 13894, 19527, 13795, 12141, 19531, 13897, 13887, 19506, 19505, 19521, 13886, 19513, 19509, 
		19534, 12276, 12268, 12180, 12342, 12283, 12148, 12183, 12154, 12158, 12159, 12167, 12169, 12172, 12174, 12178, 12187, 12189, 12191, 12193, 12194, 12197, 
		12198, 12199, 12204, 12205, 12208, 12209, 13868, 12270, 12271, 12272, 12284, 12285, 12341, 12203, 12207, 13782, 12168,
		13862, 13863, 13864
	},
	minRcount = 100,
	maxRcount = 250
}
	
local cash = {
-- ItemQ
	{item = 19502, valor = 2000},
	{item = 19504, valor = 250},
	{item = 12162, valor = 250},
	{item = 12745, valor = 250},
	{item = 19541, valor = 250},
	{item = 12164, valor = 250},
	{item = 12161, valor = 250},
	{item = 19501, valor = 250},
	{item = 19503, valor = 250},
	{item = 12165, valor = 250},
	{item = 12206, valor = 250},
	{item = 13785, valor = 250},
-- ItemRare
	{item = 12159, valor = 121000},
	{item = 12177, valor = 6000},
	{item = 12176, valor = 6500},
	{item = 12153, valor = 8200},
	{item = 12179, valor = 20000},
	{item = 12181, valor = 26000},
	{item = 12194, valor = 32500},
	{item = 12196, valor = 32500},
	{item = 12188, valor = 20000},
	{item = 12171, valor = 14500},
	{item = 8309, valor = 20000},
	{item = 12334, valor = 6000},
	{item = 12170, valor = 2000},
	{item = 12282, valor = 2000},
	{item = 12200, valor = 3800},
	{item = 12155, valor = 16500},
	{item = 12157, valor = 18500},
	{item = 12152, valor = 2800},
	{item = 12201, valor = 62500},
	{item = 13789, valor = 5500},
	{item = 19526, valor = 24700},
	{item = 19515, valor = 40400},
	{item = 12275, valor = 100000},
	{item = 19499, valor = 10400},
	{item = 12195, valor = 200000},
	{item = 19508, valor = 60000},
	{item = 19514, valor = 24300},
	{item = 19524, valor = 32800},
	{item = 19522, valor = 4600},
	{item = 19511, valor = 28700},
	{item = 19519, valor = 36000},
	{item = 19525, valor = 24700},
	{item = 19516, valor = 26500},
	{item = 19528, valor = 22400},
	{item = 13870, valor = 1400},
	{item = 19530, valor = 36000},
	{item = 19536, valor = 40000},	
	{item = 19517, valor = 18000},
	{item = 13875, valor = 18000},
	{item = 12202, valor = 15000},
	{item = 19532, valor = 32800},
	{item = 19533, valor = 38000},
	{item = 19539, valor = 26200},
	{item = 19543, valor = 26500},
	{item = 13884, valor = 15000},
	{item = 19540, valor = 82000},
	{item = 13871, valor = 90000},
	{item = 19542, valor = 26500},
	{item = 12160, valor = 28700},
	{item = 13896, valor = 62000},
	{item = 12166, valor = 90000},
	{item = 13894, valor = 22400},
	{item = 19527, valor = 14800},
	{item = 13795, valor = 28700},
	{item = 12141, valor = 20200},
	{item = 19531, valor = 24300},
	{item = 13897, valor = 24300},	
	{item = 13887, valor = 22400},
	{item = 19506, valor = 18000},
	{item = 19505, valor = 7800},
	{item = 19521, valor = 26500},
	{item = 13886, valor = 1400},
	{item = 19513, valor = 400000},
	{item = 19509, valor = 36000},
	{item = 19534, valor = 20200},
	{item = 12276, valor = 85000},
	{item = 12268, valor = 48000},
	{item = 12180, valor = 200000},
	{item = 12342, valor = 12000},
	{item = 12283, valor = 40000},
	{item = 12148, valor = 160000},
	{item = 12183, valor = 22400},
	{item = 12154, valor = 26200},
	{item = 12158, valor = 26200},
	{item = 12159, valor = 140000},
	{item = 12167, valor = 200000},
	{item = 12169, valor = 200000},
	{item = 12172, valor = 23000},
	{item = 12174, valor = 10400},
	{item = 12178, valor = 60000},
	{item = 12187, valor = 32500},
	{item = 12189, valor = 24900},
	{item = 12191, valor = 26500},
	{item = 12193, valor = 36000},
	{item = 12194, valor = 16000},
	{item = 12197, valor = 44500},
	{item = 12198, valor = 18000},
	{item = 12199, valor = 60000},
	{item = 12204, valor = 68000},
	{item = 12205, valor = 67100},
	{item = 12208, valor = 22300},
	{item = 12209, valor = 82000},
	{item = 12241, valor = 39200},
	{item = 12270, valor = 40000},
	{item = 12271, valor = 18000},
	{item = 12272, valor = 160000},
	{item = 12284, valor = 36000},
	{item = 12285, valor = 70000},
	{item = 12341, valor = 24300},
	{item = 12203, valor = 4800},
	{item = 12207, valor = 18000},
	{item = 13782, valor = 24700},
	{item = 12168, valor = 200000},
	{item = 13795, valor = 19000},
	{item = 13862, valor = 48800},
	{item = 13863, valor = 14800},
	{item = 13864, valor = 40400},	
}

function addCashToPlayer(cid) -- FUNÇÃO DE ADICIONAR CASH AOS PLAYERS DEPENDENDO DO DAILY ITENS.
	
local valor_total = 0
local item1 = getPlayerStorageValue(cid, 251461):explode("|")

	for i = 1, #cash do
		if cash[i].item == tonumber(item1[1]) then
			valor_total = valor_total + (cash[i].valor * tonumber(item1[3])) or tonumber(10000)
		end
		
		if cash[i].item == tonumber(item1[2]) then
			valor_total = valor_total + (cash[i].valor * tonumber(item1[4])) or tonumber(10000)
		end
		
		if cash[i].item == tonumber(item1[5]) then
			valor_total = valor_total + (cash[i].valor * tonumber(item1[7])) or tonumber(10000)
		end
		
		if cash[i].item == tonumber(item1[6]) then
			valor_total = valor_total + (cash[i].valor * tonumber(item1[8])) or tonumber(10000)
		end	   
	end
	
	valor_total = valor_total * 2.50
	doPlayerAddMoney(cid, valor_total)
	return true
end

function resetDailyItens(cid) -- FUNÇÃO PARA RESETAR O DAILYITENS
	
	setPlayerStorageValue(cid, 251480, -1)
	setPlayerStorageValue(cid, 251479, -1)		
	setDailyItens(cid)
	return true
end

function sendMsgCountToItens(cid) -- FUNÇÃO PARA MANDAR A MSG DE QUANTOS ITENS FALTA
	local item1 = getPlayerStorageValue(cid, 251461):explode("|")
	
	if getPlayerItemCount(cid, item1[1]) >= tonumber(item1[3]) then
		valor1 = 0
	else
		valor1 = tonumber(item1[3]) - getPlayerItemCount(cid, item1[1])
	end
		
	if getPlayerItemCount(cid, item1[2]) >= tonumber(item1[4]) then
		valor2 = 0
	else
		valor2 = tonumber(item1[4]) - getPlayerItemCount(cid, item1[2])
	end
				
	if getPlayerItemCount(cid, item1[5]) >= tonumber(item1[7]) then
		valor3 = 0
	else
		valor3 = tonumber(item1[7]) - getPlayerItemCount(cid, item1[5])
	end
				
	if getPlayerItemCount(cid, item1[6]) >= tonumber(item1[8]) then
		valor4 = 0
	else
		valor4 = tonumber(item1[8]) - getPlayerItemCount(cid, item1[6])
	end
		
	selfSay("Ainda falta você me trazer os seguintes itens ["..valor1.."] "..getItemNameById(item1[1])..", ["..valor2.."] "..getItemNameById(item1[2])..", ["..valor3.."] "..getItemNameById(item1[5])..",  ["..valor4.."] "..getItemNameById(item1[6])..".", cid)		
	return true
end

function sendMsgToItens(cid) -- FUNÇÃO PARA MANDAR A MSG DOS ITENS PARA ENTREGAR.
	local item1 = getPlayerStorageValue(cid, 251461):explode("|")
	return selfSay("Você poderia me trazer esses itens ["..tonumber(item1[3]).."] "..getItemNameById(item1[1])..", ["..tonumber(item1[4]).."] "..getItemNameById(item1[2])..", ["..tonumber(item1[7]).."] "..getItemNameById(item1[5])..",  ["..tonumber(item1[8]).."] "..getItemNameById(item1[6]).."?", cid)
end		

function inDailyItens(cid) -- FUNÇÃO PARA CHECAR SE O PLAYER ESTÁ NA DAILY ITENS.
	if getPlayerStorageValue(cid, 251480) >= 1 then
		return true
	end
	return false
end

function doPlayerRemoveDailyItens(cid) -- FUNÇÃO PARA REMOVER ITENS DO DAILY ITENS
	local item1 = getPlayerStorageValue(cid, 251461):explode("|")
	if getPlayerStorageValue(cid, 251461) ~= -1 then
		if getPlayerItemCount(cid, tonumber(item1[1])) >= tonumber(item1[3]) and getPlayerItemCount(cid, tonumber(item1[2])) >= tonumber(item1[4]) and getPlayerItemCount(cid, tonumber(item1[5])) >= tonumber(item1[7]) and getPlayerItemCount(cid, tonumber(item1[6])) >= tonumber(item1[8]) then
			doPlayerRemoveItem(cid, item1[1], item1[3])
			doPlayerRemoveItem(cid, item1[2], item1[4])
			doPlayerRemoveItem(cid, item1[5], item1[7])
			doPlayerRemoveItem(cid, item1[6], item1[8])
			return true
		end
	end	
	return true
end

function getDailyItens(cid) -- FUNÇÃO PARA CHECAR SE O PLAYER JÁ TEM TODOS OS ITENS

	local item1 = getPlayerStorageValue(cid, 251461):explode("|")
	if getPlayerStorageValue(cid, 251461) ~= -1 then
		if getPlayerItemCount(cid, tonumber(item1[1])) >= tonumber(item1[3]) and getPlayerItemCount(cid, tonumber(item1[2])) >= tonumber(item1[4]) and getPlayerItemCount(cid, tonumber(item1[5])) >= tonumber(item1[7]) and getPlayerItemCount(cid, tonumber(item1[6])) >= tonumber(item1[8]) then
			return true
		end
	end

	return false
end	

function getLastDailyItens(cid) -- Checar se o player já fez a task de itens.
	if isPlayer(cid) then
		if getPlayerStorageValue(cid, 251462) ~= -1 then
			return tostring(getPlayerStorageValue(cid, 251462)):explode("|")[1]
		end
	end
	return "00-00-00"
end	
	
function setDailyItens(cid) -- ADICIONAR DAILY ITENS AOS PLAYERS.

--// Reload Itens 1 // --

	local itemq1 = dailyItens.itemQ[math.random(#dailyItens.itemQ)]
	local itemq2 = itemq1
	
	repeat
		itemq2 = dailyItens.itemQ[math.random(#dailyItens.itemQ)]
	until(not (itemq1 == itemq2))

--// Reload Count 1 // --
	
	local count1 = math.random(dailyItens.minCount, dailyItens.maxCount)
	local count2 = count1
	
	repeat
		count2 = math.random(dailyItens.minCount, dailyItens.maxCount)
	until(not (count1 == count2))

--// Reload Rare Itens 1 // --	

	local rare1 = dailyItens.ItemRare[math.random(#dailyItens.ItemRare)]
	local rare2 = rare1
	
	repeat
		rare2 = dailyItens.ItemRare[math.random(#dailyItens.ItemRare)]
	until(not (rare1 == rare2))
	
--// Reload Rare Count 1 // --	

	local rarecount1 = math.random(dailyItens.minRcount, dailyItens.maxRcount)
	local rarecount2 = rarecount1
	
	repeat
		rarecount2 = math.random(dailyItens.minRcount, dailyItens.maxRcount)
	until(not (rarecount1 == rarecount2))

	if getPlayerLevel(cid) >= 350 then
		count1 = math.floor(count1 * 2)
		count2 = math.floor(count2 * 2)
		rarecount1 = math.floor(rarecount1 * 2)
		rarecount2 = math.floor(rarecount2 * 2)
	else
		count1 = count1
		count2 = count2
		rarecount1 = rarecount1
		rarecount2 = rarecount2
	end	
	
	local day = getNumberDay().."-"..getNumberMonth().."-"..getNumberYear()
	setPlayerStorageValue(cid, 251462, "|"..day.."|")	
	setPlayerStorageValue(cid, 251461, tostring("|"..itemq1.."|"..itemq2.."|"..count1.."|"..count2.."|"..rare1.."|"..rare2.."|"..rarecount1.."|"..rarecount2.."|"))
end