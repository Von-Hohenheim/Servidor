local pokemonsTable = {
	["Moltres"] = {
		{
			range = 100, 
			centerPos = {x = 388, y = 1890, z = 11}, 
			message = "[Moltres Quest] O MVP Moltres acaba de ser derrotado!", 
			deathChannel = true, 
			removedItemTime = 15, -- Tempo em segundos
			RemovedItemsPos = {
				{x = 411, y = 1890, z = 11}, 
				{x = 411, y = 1891, z = 11}, 
			},
		},
	},
	["Articuno"] = {
		{
			range = 100, 
			centerPos = {x = 1020, y = 1879, z = 12}, 
			message = "[Articuno Quest] O MVP Articuno acaba de ser derrotado!", 
			deathChannel = true, 
			removedItemTime = 15, -- Tempo em segundos
			RemovedItemsPos = {
				{x = 1036, y = 1887, z = 12}, 
				{x = 1036, y = 1888, z = 12},
			},
		},
	},
	["Zapdos"] = {
		{
			range = 50, 
			centerPos = {x = 1723, y = 858, z = 8}, 
			message = "[Zapdos Quest] O MVP Zapdos acaba de ser derrotado!", 
			deathChannel = true, 
			removedItemTime = 15, -- Tempo em segundos
			RemovedItemsPos = {
				{x = 1722, y = 852, z = 8}, 
				{x = 1722, y = 851, z = 8},
				{x = 1722, y = 852, z = 8},
			},
		},
	},
	["Big Porygon"] = {
		{
			range = 17, 
			centerPos = {x = 1235, y = 373, z = 9}, 
			message = "[Big Porygon] Perdi a batalha, não à guerra!", 
			deathChannel = true, 
			removedItemTime = 30, -- Tempo em segundos
			RemovedItemsPos = {
				{x = 1244, y = 372, z = 9}, 
				{x = 1244, y = 373, z = 9},
			},
		},
	},
}

function doQuestMonster(poke)
	if not isMonster(poke) then
		return true
	end
	
	if not pokemonsTable[doCorrectString(getCreatureName(poke))] then
		return true
	end
	
	for _, pokeDespawn in pairs(pokemonsTable[doCorrectString(getCreatureName(poke))]) do
		for _, creature in pairs(getSpectators(pokeDespawn.centerPos, pokeDespawn.range, pokeDespawn.range, false)) do
			if creature == poke then
			
				if pokeDespawn.deathChannel then
					--sendChannel(pokeDespawn.message)
				end
			
				doBroadcastMessage(pokeDespawn.message)
			
				doCreatureSay(poke, "Você terá apenas "..convertTime(pokeDespawn.removedItemTime).." até que a passagem se feche.", 20)
			    doPlayerSendTextMessage(cid,20,"Você terá apenas "..convertTime(pokeDespawn.removedItemTime).." até que a passagem se feche.")    		
				
				local items = {}
				
				for i, positions in pairs(pokeDespawn.RemovedItemsPos) do
				    doSendMagicEffect(positions, 175)
					positions.stackpos = 1
					local item = getThingfromPos(positions)
					table.insert(items, i, item.itemid)
					doRemoveItem(item.uid)
				end
			
				addEvent(function() 
					
					for id, newItem in pairs(items) do
						doCreateItem(newItem, 1, pokeDespawn.RemovedItemsPos[id])
					end
					
				end, pokeDespawn.removedItemTime * 1000)
			
				
			
				return true
			end
		end
	end
	
	return true
end