function onMoveItem(cid, item, fromPosition, toPosition, fromItem, toItem, fromGround, toGround, status)
	
	local fromContainer = fromItem
	local toContainer = toItem
	if not isCreature(cid) then return false end
	if item.itemid == 16180 or item.actionid == 12500 or item.actionid == 2309 then return false end
	if isWatchingTv(cid) then return false end
	
	if isInArray(itemsUnmoveable, item.itemid) then
		doPlayerSendCancel(cid, "Você não pode mover este item.")
		return false
	end
	
	if item.itemid == 19275 and isBiking(cid) then
		doPlayerSendCancel(cid, "Você não pode mover este item.")
		return false
	end

	local name = getCreatureName(cid)
	local transform = false
	
	if fromPosition.x ~= 0 and toContainer.uid == 0 and fromContainer.uid == 0 and toPosition.x == 65535 and getPlayerSlotItem(cid, 8).uid ~= 0 then
		doPlayerSendCancel(cid, MSG_NAO_E_POSSIVEL)
		return false
	end
	
	local itemID = item.itemid
	if itemID >= 14795 and itemID <= 14879 or (pokeballs[getPokeballType(itemID)] and (itemID == pokeballs[getPokeballType(itemID)].use and (#getCreatureSummons(cid) > 0 or isRiderOrFlyOrSurf(cid)))) then
		doPlayerSendCancel(cid, "Você não pode mover este item.")
		return false
	end
	
	if isInArray({460, 12171, 12172}, toItem.itemid) or (toContainer.uid == 0 and getThingPos(cid).z ~= toPosition.z) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_CANNOTTHROW)
		return false
	end
	
	if getItemNameById(item.itemid):find("portrait") then
		return false
	end
	
	if isInArray({2589, 15446, 15447, 15448, 15449, 12355}, toContainer.itemid) then -- nao fazer nada no cp
		return true
	end
	
	local lixeira = {15416, 15415}
	local liixeira = false
	
	local pos = toPosition
	local items = getItemsfromPos(pos)
	for i = 1, #items do
		local name = getItemInfo(items[i].itemid).name
		if string.find(name, "fainted") or string.find(name, "defeated") then 
			doSendMsg(cid, "Não pode jogar lá.")
			return false
		elseif getItemInfo(items[i].itemid).blockSolid then
            if isInArray(lixeira, items[i].itemid) then
                liixeira = true
            end
        end
	end
	
	
	local isToTile = (toGround.uid == getTileInfo(toPosition).uid) or fromGround.itemid == 0 and toGround.itemid ~= 0--fromGround.itemid == 0 and toGround.itemid ~= 0
	local isFromTile = not isToTile
	
	local isToSlot = not isToTile and not isContainer(toItem.uid)
	local isFromSlot = not isFromTile and not isContainer(fromItem.uid)
	--if not (fromItem.uid == toItem.uid or (isContainer(fromContainer.uid) and doComparePosition(getThingPos(fromContainer.uid), toPosition)) or (status.inInv == 0 and status.inInvBag == 1)) then
	
	local isGoingToPlayer = isFromTile and toGround.itemid == 0

	local maxItem  = 800
	if isGoingToPlayer and not isPokeball(item.itemid) then
		if isContainer(item.uid)then
			if (getPlayerTotalItem(cid) + #getAllItemsFromContainer(item)) > maxItem then
				doPlayerSendCancel(cid, "Você não pode carregar mais itens pois já lotou a quantidade de slot's disponíveis")
				return false
			end
		else
			if getPlayerTotalItem(cid) + 1 > maxItem then
				doPlayerSendCancel(cid, "Você não pode carregar mais itens pois já lotou a quantidade de slot's disponíveis")
				return false
			end
		end
	end	
	
	if getPlayerSlotItem(cid, 10).uid and item.uid ~= getPlayerSlotItem(cid, 10).uid then
		if isGoingToPlayer and not isFromSlot then
			if isPokeball(item.itemid) then
				if not (fromItem.uid == toItem.uid or (isContainer(fromContainer.uid) and doComparePositions(getThingPos(fromContainer.uid), toPosition)) or (status.inInv == 0 and status.inInvBag == 1)) then
					local totalball = #getPlayerPokeballs(cid)	
					if totalball >= 6 then 
						doPlayerSendCancel(cid, "Você já está carregando 6 pokémons!")
						return false
					end					
				end
			elseif isContainer(item.uid) then
				if #getPlayerPokeballs(item.uid) > 0 then
					local totalBag = #getPlayerPokeballs(item.uid)
					local totalPlayer = #getPlayerPokeballs(cid)	
					local s = ""..(totalBag > 1 and "s" or "")..""
					if (totalBag + totalPlayer) >= 6 then
						doPlayerSendCancel(cid, "Está mochila está com "..totalBag.." pokémon"..s.." e você "..(totalPlayer == 6 and "não" or "só").." pode carregar mais "..(totalPlayer == 6 and "nenhum pokémon" or (6 - totalPlayer).." pokémon"..((6 - totalPlayer) > 1 and "s" or ""))..".")
						return false
					end
				end
			end	
		end
	end
	
	
	if isToTile then
		
		if isInArray(uniqueItems, item.itemid) then
			doPlayerSendCancel(cid, "Isso é um item exclusivo, você não pode joga-lo fora!")
			return false
		end
		
		if getItemAttribute(item.uid, "unique") or isPokeball(item.itemid) or isContainer(item.uid) or isInArray(uniqueItems, item.itemid) then
			if hasSqm(toPosition) and (toGround.itemid ~= 0) then -- Indo para o chão.
				if isContainer(item.uid) then
					
					local itens = getItensUniquesInContainer(item.uid)
					local sendMsg = false
					if #itens >= 1 then
						doPlayerSendCancel(cid, #itens.." ite"..(#itens < 2 and "m" or "ns").." neste recipiente "..(#itens < 2 and "é exclusivo" or "são exclusivos")..". Você não pode jogá-lo"..(#itens < 2 and "" or "s").." fora!")
						return false
					end
					
				else
					
					if getItemAttribute(item.uid, "unique") or getItemAttribute(item.uid, "torneio") or isInArray(uniqueItems, item.itemid) then 
						doPlayerSendCancel(cid, "Isso é um item exclusivo, você não pode joga-lo fora!")
						return false 
					end 
				end
				
			else -- Indo para qual quer outro lugar.
				
				if fromItem.uid == toItem.uid then -- nao fazer nada na poke bag principal
					return true
				end
				
				if not isPosEqual(fromPosition, toPosition) or not isGoingToPlayer then
					if isContainer(item.uid) then
						
						local itens = getItensUniquesInContainer(item.uid)
						local sendMsg = false
						if #itens >= 1 then
							doPlayerSendCancel(cid, #itens.." ite"..(#itens < 2 and "m" or "ns").." neste recipiente "..(#itens < 2 and "é exclusivo" or "são exclusivos")..". Você não pode jogá-lo"..(#itens < 2 and "" or "s").." fora!")
							return false
						end
						
					else
						if getItemAttribute(item.uid, "unique") or getItemAttribute(item.uid, "torneio") or isInArray(uniqueItems, item.itemid) then 
							doPlayerSendCancel(cid, "Isso é um item exclusivo, você não pode joga-lo fora!")
							return false 
						end 
					end
				end
			end
		end
	end
	local isGoingToGround = (hasSqm(toPosition) and toGround.itemid ~= 0)
	if isPokeball(item.itemid) and toPosition.x == 65535 then
		if not getItemAttribute(item.uid, "unique") and #getPlayerPokeballs(cid) < 6 then
			doTransformPokeballIcon(cid, item, isGoingToGround)
		end
	else
		if not getItemAttribute(item.uid, "unique") and not getItemAttribute(item.uid, "torneio") then
			doTransformPokeballIcon(cid, item, isGoingToGround)
		end
	end
	
	if liixeira then
		doRemoveItem(item.uid)
		return false
	end  
	
	return true
end 

function getItemsfromPos(position, fromStackpos)
	local toret = { } -- table to return items
	
	position.stackpos = fromStackpos
	if position.stackpos == nil then
		position.stackpos = 1 -- default
	end
	
	while true do -- loop to catch the items and insert them in toret table
		local thing = getThingfromPos(position)
		if thing.itemid == 0 then -- thing doesn't exist, break the loop...
			break
		end
		
		if getWholeThing ~= nil and getWholeThing ~= 0 then
			-- if getWholeThing isn't nil and isn't 0
			table.insert(toret,thing)
		else
			-- else, insert only item uid in toret table
			table.insert(toret,thing)
		end
		
		position.stackpos = position.stackpos + 1 -- get next item
	end
	
	return toret
end