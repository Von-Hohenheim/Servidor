local items = {
	[11000] = {pokemon = "Bulbasaur", storageId = 0},
	[11001] = {pokemon = "Charmander", storageId = 0},
	[11002] = {pokemon = "Squirtle", storageId = 0},
	[15000] = {itemId = 19199, count = 30, storageId = 8},
	[15001] = {itemId = 19200, count = 20, storageId = 8},
	[15002] = {itemId = 19201, count = 10, storageId = 8},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local gain = items[item.actionid]
	
	if gain.storageId >= 8 and gain.storageId <= 9 then
		local storage = item.actionid + 375
		
		if getPlayerStorageValue(cid, storage) ~= -1 then
			doPlayerSendCancel(cid, "Você não pode mais pegar essa ball.")
			return true
		end
		
	else
		if getPlayerStorageValue(cid, 5515) == -1 then
			doPlayerSendCancel(cid, "Você precisa falar com o Prof. Carvalho Oak primeiro.")
			return true
		elseif getPlayerStorageValue(cid, 5515) > 0 and gain.storageId == 0 then
			doPlayerSendCancel(cid, "Você já pegou seu primeiro pokémon.")
			return true
		elseif getPlayerStorageValue(cid, 5515) > 8 and gain.storageId == 8 then
			doPlayerSendCancel(cid, "Você já pegou todos seus itens aqui.")
			return true
		end
	end
	
	if gain.pokemon then
		createBall(cid, gain.pokemon, 0, "true")
		doPlayerSendTextMessage(cid, 20, "Você acaba de pegar seu primeiro pokémon ("..gain.pokemon..").")
		setPlayerStorageValue(cid, 5515, 1)
	else
		if getPlayerStorageValue(cid, 5515) ~= 8 then
			doPlayerSendCancel(cid, "Você ainda não chegou nesta parte da missão.")
			return true
		end		
		local setSto = 0
		setPlayerStorageValue(cid, item.actionid + 375, 1)
		if getPlayerStorageValue(cid, 15000 + 375) ~= -1 then
			setSto = setSto + 1
		end
		if getPlayerStorageValue(cid, 15001 + 375) ~= -1 then
			setSto = setSto + 1
		end
		if getPlayerStorageValue(cid, 15002 + 375) ~= -1 then
			setSto = setSto + 1
		end
		if setSto == 3 then
			setPlayerStorageValue(cid, 5515, 9)
		end
		local item = doPlayerAddItem(cid, gain.itemId, gain.count)
		--doItemSetAttribute(item, "unique", true)
		doPlayerSendTextMessage(cid, 20, "Você acaba de pegar "..gain.count.." "..getItemDescriptionsById(gain.itemId).plural..".")
	end
	doSendMagicEffect(getThingPos(cid), 50)
	return true
end