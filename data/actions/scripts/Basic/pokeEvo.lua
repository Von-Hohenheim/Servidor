function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pokeball = getPlayerSlotItem(cid, 8)
	
	if not isMonster(itemEx.uid) or not isSummon(itemEx.uid) then
		return true
	end
	
	if #getCreatureSummons(cid) > 1 then
		return true --alterado v1.9
	end
	
	if getPlayerStorageValue(cid, 55006) >= 1 then 
		doPlayerSendCancel(cid, "Voc� n�o pode evoluir seu pok�mon enquanto est� em duel.")
		return true
	end
	
	if isInArray({"ditto", "shiny ditto"}, getItemAttribute(pokeball.uid, "poke"):lower()) then
		doPlayerSendCancel(cid, "Ditto n�o tem evolu��o.")
		return true
	end
	
	if getCreatureCondition(itemEx.uid, CONDITION_INVISIBLE) then return true end
	
	local name = getCreatureName(itemEx.uid)
	
	if not specialEvo[name] then
		
		if not hasEvolution(name) then
			doPlayerSendCancel(cid, "Este pok�mon n�o tem evolu��o.")
			return true
		end
		
		if not isPlayer(getCreatureMaster(itemEx.uid)) or getCreatureMaster(itemEx.uid) ~= cid then
			doPlayerSendCancel(cid, "Voc� s� pode evoluir seus pr�prios pok�mon.")
			return true
		end
		
		if not canEvolveWithThisStone(name, item.itemid) then
			if string.find(name, "Shiny") then
				doPlayerSendCancel(cid, "Pokemons Shiny somente evoluem com Shiny Stones.")
				sendMsgToPlayer(cid, 27, "Pokemons Shiny somente evoluem com Shiny Stones. Veja a tabela de Shiny Stones no site!") 
			else	
				doPlayerSendCancel(cid, "Voc� n�o pode evoluir este pok�mon usando est� stone.")
			end	
			return true
		end
	else
		if name == "Eevee" then
			
			if not specialEvo["Eevee"][item.itemid] then
				doPlayerSendCancel(cid, "Voc� n�o pode evoluir este pok�mon usando est� stone.")
				return true
			end
			
			if getPlayerLevel(cid) < pokes[name].level then
				doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes[name].level .." para evoluir este pok�mon.")
				return true
			end
			
			if doEvolvePokemon(cid, itemEx, specialEvo["Eevee"][item.itemid]) then
				doRemoveItem(item.uid, 1)
			end
			return true
		elseif name == "Poliwhirl" then
			if isInArray({11442, 11446, king}, item.itemid) then
				
				if getPlayerItemCount(cid, king) >= 1 then
					if getPlayerLevel(cid) < pokes["Politoad"].level then
						doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Politoad"].level .." para evoluir este pok�mon.")
						return true
					end
					
					if doEvolvePokemon(cid, itemEx, "Politoad") then
						doPlayerRemoveItem(cid, 11442, 1)
						doPlayerRemoveItem(cid, 11446, 1)
					end					
				elseif getPlayerItemCount(cid, 11442) >= 1 and getPlayerItemCount(cid, 11446) >= 1 then
					
					if getPlayerLevel(cid) < pokes["Poliwrath"].level then
						doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Poliwrath"].level .." para evoluir este pok�mon.")
						return true
					end
					
					if doEvolvePokemon(cid, itemEx, "Poliwrath") then
						doPlayerRemoveItem(cid, 11442, 1)
						doPlayerRemoveItem(cid, 11446, 1)
					end
				else
					doPlayerSendCancel(cid, "Voc� n�o tem as stones necess�rias para evoluir este pok�mon.")
				end
			else
				doPlayerSendCancel(cid, "Voc� n�o pode evoluir este pok�mon usando est� stone.")
			end
			return true
		elseif name == "Gloom" then
			if isInArray({12242, leaf, venom}, item.itemid) then
				if getPlayerItemCount(cid, 12242) >= 1 and getPlayerItemCount(cid, leaf) >= 1 then
					if getPlayerLevel(cid) < pokes["Bellossom"].level then
						doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Bellossom"].level .." para evoluir este pok�mon.")
						return true
					end
					
					if doEvolvePokemon(cid, itemEx, "Bellossom") then
						doPlayerRemoveItem(cid, 12242, 1)
						doPlayerRemoveItem(cid, leaf, 1)
					end						
				elseif getPlayerItemCount(cid, leaf) >= 1 and getPlayerItemCount(cid, venom) >= 1 then
					if getPlayerLevel(cid) < pokes["Vileplume"].level then
						doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Vileplume"].level .." para evoluir este pok�mon.")
						return true
					end
					
					if doEvolvePokemon(cid, itemEx, "Vileplume") then
						doPlayerRemoveItem(cid, leaf, 1)
						doPlayerRemoveItem(cid, venom, 1)
					end
				else
					doPlayerSendCancel(cid, "Voc� n�o tem a quantidade necess�ria de stones para evoluir.")
				end
			else
				doPlayerSendCancel(cid, "Voc� n�o pode evoluir este pok�mon usando est� stone.")
			end	
			return true
		elseif name == "Slowpoke" then
			if isInArray({enigma, ancient}, item.itemid) then
				if item.itemid == ancient then
					if getPlayerLevel(cid) < pokes["Slowking"].level then
						doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Slowking"].level .." para evoluir este pok�mon.")
						return true
					end
					
					if doEvolvePokemon(cid, itemEx, "Slowking") then
						doPlayerRemoveItem(cid, ancient, 1)
					end						
				elseif item.itemid == enigma then
					if getPlayerLevel(cid) < pokes["Slowbro"].level then
						doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Slowbro"].level .." para evoluir este pok�mon.")
						
						return true
					end
					
					if doEvolvePokemon(cid, itemEx, "Slowbro") then
						doPlayerRemoveItem(cid, leaf, 2)
					end
				else
					doPlayerSendCancel(cid, "Voc� n�o tem a quantidade necess�ria de stones para evoluir.")
				end
			else
				doPlayerSendCancel(cid, "Voc� n�o pode evoluir este pok�mon usando est� stone.")
			end	
			return true	
		elseif name == "Tyrogue" then
			if item.itemid == punch and getPlayerItemCount(cid, 19543) >= 500 then
			
				if getPlayerLevel(cid) < pokes["Hitmonlee"].level then
					doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Hitmontop"].level .." para evoluir este pok�mon.")
					return true
				end		
				
				if doEvolvePokemon(cid, itemEx, "Hitmonlee") then
					doPlayerRemoveItem(cid, punch, 1)
					doPlayerRemoveItem(cid, 19543, 500)
				end	
			elseif item.itemid == punch and getPlayerItemCount(cid, 19521) >= 500 then
			
				if getPlayerLevel(cid) < pokes["Hitmontop"].level then
					doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Hitmontop"].level .." para evoluir este pok�mon.")
					return true
				end		
				
				if doEvolvePokemon(cid, itemEx, "Hitmontop") then
					doPlayerRemoveItem(cid, punch, 1)
					doPlayerRemoveItem(cid, 19521, 500)
				end	
			elseif item.itemid == punch and getPlayerItemCount(cid, 12191) >= 500 then
			
				if getPlayerLevel(cid) < pokes["Hitmonchan"].level then
					doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes["Hitmontop"].level .." para evoluir este pok�mon.")
					return true
				end		
				
				if doEvolvePokemon(cid, itemEx, "Hitmonchan") then
					doPlayerRemoveItem(cid, punch, 1)
					doPlayerRemoveItem(cid, 12191, 500)
				end	
			else
				doPlayerSendCancel(cid, "Voc� n�o tem os itens necess�rios para evoluir este pok�mon.")
			end				
			return true
		end
		return true
	end
	
	local continue = true
	local evoTab = getPokemonEvolutionTab(name)
	local t = string.explode(evoTab.stones, ",")
	local str = {}
	for _, b in pairs(t) do
		local t2 = b:explode(" ")
		local total = tonumber(t2[1])
		if getPlayerItemCount(cid, stoneToString[t2[2]]) < total then
			continue = false
		end
		table.insert(str, total.." "..getItemNameById(stoneToString[t2[2]])..(total > 1 and "s" or ""))
	end
	
	if not continue then
		doPlayerSendCancel(cid, "Voc� precisa de "..doConcatTable(str, ", ", " e ")..".")
		sendMsgToPlayer(cid, 20, "Voc� precisa de "..doConcatTable(str, ", ", " e ")..".") 
		return true
	end
	
	if getPlayerLevel(cid) < pokes[evoTab.to].level then
		doPlayerSendCancel(cid, "Voc� precisar ser level ".. pokes[evoTab.to].level .." para evoluir este pok�mon.")
		sendMsgToPlayer(cid, 20, "Voc� precisar ser level ".. pokes[evoTab.to].level .." para evoluir este pok�mon.") 
		return true
	end
	
	if doEvolvePokemon(cid, itemEx, evoTab.to) then
		for _, stones in pairs(getStonesToEvolve(name)) do
			doPlayerRemoveItem(cid, stones.id, stones.quant)
		end
	end
	
	return true
end