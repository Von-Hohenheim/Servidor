function getContainerBackpack(containeruid) 

local containers = {} 

	if type(getContainerSize(containeruid)) ~= "number" then 
		return false 
	end 
	
	for slot = 0, getContainerSize(containeruid)-1 do 
	local item = getContainerItem(containeruid, slot) 
	
		if item.itemid == 0 then 
			break 
		end 
		
		if isContainer(item.uid) then 
			table.insert(containers, item.uid) 
		end 
	end 

	for i = 1, #containers do
		if #containers > 1 then
			table.remove(containers, containers[i+1])
		end
		if #containers > 2 then
			table.remove(containers, containers[i+2])
		end
		if #containers > 3 then
			table.remove(containers, containers[i+3])
		end
		if #containers > 4 then
			table.remove(containers, containers[i+4])
		end
		if #containers > 5 then
			table.remove(containers, containers[i+5])
		end
	end
		
	for i = 1, #containers do 
		for _, x in ipairs(getContainerBackpack(containers[i])) do 
			table.insert(containers, x) 
		end 
	end 
	
	return containers 
end

function getContainerItems(containeruid)
	local items = {}
	local containers = {}
	if type(getContainerSize(containeruid)) ~= "number" then
		return false
	end
	for slot = 0, getContainerSize(containeruid)-1 do
		local item = getContainerItem(containeruid, slot)
		if item.itemid == 0 then
			break
		end
		if isContainer(item.uid) then
			table.insert(containers, item.uid)
		end
		table.insert(items, item)
	end
	if #containers > 0 then
		for i,x in ipairs(getContainerItems(containers[1])) do
			table.insert(items, x)
		end
		table.remove(containers, 1)
	end
	return items
end

function isCorpse(item)
	return string.find(getItemNameById(item.itemid), "fainted") or string.find(getItemNameById(item.itemid), "defeated ")
end

function getCorpsesPosition(position)
	local toret = { } -- table to return items
	
	position.stackpos = 1
	
	while true do -- loop to catch the items and insert them in toret table
		local thing = getThingfromPos(position)
		if thing.itemid == 0 then -- thing doesn't exist, break the loop...
			break
		end
		
		if thing.uid > 0 and isContainer(thing.uid) and isCorpse(thing) then
			table.insert(toret,thing)
		end
		
		position.stackpos = position.stackpos + 1 -- get next item
	end
	
	return toret
end

function doPlayerAddItemStacking(cid, itemid, quant) -- by mkalo
	local item = getItemsInContainerById(getPlayerSlotItem(cid, 3).uid, itemid)
	local piles = 0
	if #item > 0 then
		for i,x in pairs(item) do
			if getThing(x).type < 100 then
				local it = getThing(x)
				doTransformItem(it.uid, itemid, it.type+quant)
				if it.type+quant > 100 then
					doPlayerAddItem(cid, itemid, it.type+quant-100)
				end
			else
				piles = piles+1
			end
		end
	else
		return doPlayerAddItem(cid, itemid, quant)
	end
	if piles == #item then
		doPlayerAddItem(cid, itemid, quant)
	end
end

function doLoot(cid, corpse)

	if not isCollectAll(cid) then
		return true
	end
	
	if not isContainer(corpse.uid) then
		return false
	end
	
	local itemsToLootAllWindow = {}
	
	for _, loot in pairs(getContainerItems(corpse.uid)) do
		local slot = getPlayerSlotItem(cid, 3).uid
		local container = getContainerBackpack(slot)
		local item1 = getPlayerStorageValue(cid, 251461):explode("|") or 0
		
		function configLoot()
			local itt = "".. tostring(getItemInfo(loot.itemid).clientId) .."|".. loot.type .."|"
			local ittt1, ittt2 = itt:explode("|")[1], itt:explode("|")[2]
			local itr = ittt1 .."-".. ittt2 .."-"
			table.insert(itemsToLootAllWindow, itr)				
			doRemoveItem(loot.uid)
			doSendPlayerExtendedOpcode(cid, 69, table.concat(itemsToLootAllWindow))	
		end

		--// Sistema de Daily Itens \\--
		
		if inDailyItens(cid) then	
			if tonumber(item1[1]) == loot.itemid then
				doPlayerSendTextMessage(cid, 20, "[Daily Itens]: Resta voc� coletar ["..(tonumber(item1[3]) - getPlayerItemCount(cid, item1[1])) - loot.type.."] "..getItemNameById(loot.itemid)..".")
			end
							
			if tonumber(item1[2]) == loot.itemid then
				doPlayerSendTextMessage(cid, 20, "[Daily Itens]: Resta voc� coletar ["..(tonumber(item1[4]) - getPlayerItemCount(cid, item1[2])) - loot.type.."] "..getItemNameById(loot.itemid)..".")
			end
							
			if tonumber(item1[5]) == loot.itemid then
				doPlayerSendTextMessage(cid, 20, "[Daily Itens]: Resta voc� coletar ["..(tonumber(item1[7]) - getPlayerItemCount(cid, item1[5])) - loot.type.."] "..getItemNameById(loot.itemid)..".")
			end		
			
			if tonumber(item1[6]) == loot.itemid then
				doPlayerSendTextMessage(cid, 20, "[Daily Itens]: Resta voc� coletar ["..(tonumber(item1[8]) - getPlayerItemCount(cid, item1[6])) - loot.type.."] "..getItemNameById(loot.itemid)..".")
			end
		end
			
		--// Sistema de Daily Itens \\--
		
			if #container < 1 then
				doPlayerAddItem(cid, loot.itemid, loot.type)
				configLoot()	
			end					
		
			for i = 1, #container do
				if #container >= 1 then
					if getContainerSlotsFree(container[i]) >= 1 then
						doAddContainerItem(container[i], loot.itemid, loot.type)	
						configLoot()	
						break
					end
				else
					doPlayerAddItem(cid, loot.itemid, loot.type)
					configLoot()				  	
				end
			end			
		end	
	end

function checkLoot(cid, corpse, SemMensagem)

	if not isContainer(corpse.uid) then
		return false
	end

	local quemMatou = getItemAttribute(corpse.uid, "corpseowner")
	
	if quemMatou then
		local player = getCreatureByName(quemMatou)
		if isPlayer(player) then
			local isInParyWithPlayer = false
			if isInParty(cid) and isInParty(player) then
				isInParyWithPlayer = isPartyEquals(player, cid)
			end
			
			if getCreatureName(cid) ~= getCreatureName(player) and not isInParyWithPlayer then
				if not SemMensagem then
					doPlayerSendCancel(cid, "Voc� n�o pode abrir um loot que n�o � seu.")
				end
				return false
			end
		end
	end
	return true
end

function onUse(cid, item, frompos, item2, topos)

	
	if isWatchingTv(cid) then 
		return true 
	end

	if not isContainer(item.uid) then
		return true
	end
	
	if not isCollectAll(cid) then
		return false
	end

	local maxItem = 800
	if isContainer(item.uid)then
		if (getPlayerTotalItem(cid) + #getAllItemsFromContainer(item)) > maxItem then
			doPlayerSendCancel(cid, "Voc� n�o pode carregar mais itens pois j� lotou a quantidade de slot's dispon�veis")
			return false
		end
	else
		if getPlayerTotalItem(cid) + 1 > maxItem then
			doPlayerSendCancel(cid, "Voc� n�o pode carregar mais itens pois j� lotou a quantidade de slot's dispon�veis")
			return false
		end
	end
	
	local openCorpse = 	#getContainerItems(item.uid) < 1

	if checkLoot(cid, item, false) then
		doLoot(cid, item)
	end
	
	for _, corpse in pairs(getCorpsesPosition(getThingPosition(item.uid))) do
		if checkLoot(cid, corpse, false) then
			doLoot(cid, corpse)	
		end
	end
	
	if openCorpse then
		return false
	end
	
	return true
end