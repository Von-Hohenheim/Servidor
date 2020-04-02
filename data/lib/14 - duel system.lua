--lose, deslogar, render e perder por tempo
duelTable = {
	targetName = 55000,
	pokeballsCount = 55001,
	giveUP = 55002,
	infoBalls = 55003,
	wins = 55004,
	loses = 55005,
	isInDuel = 55006,
	acceptedDuel = 55007
}

function alertToPuchPokeball(p1, lose, count)
	if not isCreature(p1) then return true end
	if not lose then
		doPlayerSendTextMessage(p1, 20, "Você ainda pode utilizar "..count.." pokémon(s) e tem 1 minuto para puxar outro pokémon!")
		addEvent(alertToPuchPokeball, 60 * 1000, p1, true)
	else
		if #getCreatureSummons(p1) <= 0 then
			local p2 = getPlayerByName(getPlayerAdvers(p1)) 
			doWin(p2)
			doLoser(p1)
			doPlayerSendTextMessage(p2, 20, "O jogador " .. getCreatureName(p1) .. " passou mais de 1 minuto sem puxar outro pokémon.")
		end
	end
end

function checkGiveUp(cid)
	if getPlayerStorageValue(cid, duelTable.giveUP) >= 1 and getCreatureSkullType(cid) == SKULL_WHITE then --- player 1 desistiu/puxou poke/ poke morreu antes comecar o duel
		local p2 = getPlayerByName(getPlayerAdvers(cid))
		doWin(p2)
		doGiveUP(cid) 
	end
end

function CanAttackerInDuel(p1, p2)
	if not isCreature(p1) or not isCreature(p2) then return true end
	if getPlayerStorageValue(p1, duelTable.isInDuel) >= 1 and getPlayerAdvers(p1) == getCreatureName(p2) and getPlayerAdvers(p2) == getCreatureName(p1) then 
		return true 
	end
	return false
end

function doRemoveCountPokemon(p1)
	if not isCreature(p1) then return true end
	setPlayerStorageValue(p1, duelTable.pokeballsCount, getPlayerStorageValue(p1, duelTable.pokeballsCount) -1)
	doSendAnimatedText(getThingPos(p1), "POKEDOWN!", 215)
	
	if getPokemonsCount(p1) == 0 then
		local p2 = getPlayerByName(getPlayerAdvers(p1))
		doWin(p2)
		doLoser(p1)
		doLoogoutInDuel(p1)
	else
		alertToPuchPokeball(p1, false, getPlayerStorageValue(p1, duelTable.pokeballsCount))
	end	
end

function doLoogoutInDuel(p1)
	if not isCreature(p1) then return true end
	local p2 = getPlayerByName(getPlayerAdvers(p1))
	doEreaseDuel(p1)
	if not p2 then 
		return true
	elseif getPlayerStorageValue(p1, 55006) ~= 1 and isCreature(p2) then
		doEreaseDuel(p2)
	end
	if getCreatureSkullType(p1) == SKULL_WHITE then
		doWin(p2)
		doGiveUP(p1)
	end
end

function doWin(p1)
	if not isCreature(p1) then return true end
	doSendAnimatedText(getThingPos(p1), "WIN!", 215)
	setPlayerStorageValue(p2, duelTable.wins, getPlayerStorageValue(p1, duelTable.wins) +1)
	doPlayerSendTextMessage(p1, 20, "Você ganhou o duelo ("..getPlayerStorageValue(p1, duelTable.infoBalls).."x"..getPlayerStorageValue(p1, duelTable.infoBalls)..") contra o jogador ("..getPlayerAdvers(p1)..").")
	doEreaseDuel(p1)
end

function doGiveUP(p1) 
	if not isCreature(p1) then return true end
	doSendAnimatedText(getThingPos(p1), "GIVE UP!", COLOR_WATER)
	setPlayerStorageValue(p1, duelTable.loses, getPlayerStorageValue(p1, duelTable.loses) +1)
	doPlayerSendTextMessage(p1, 20, "Você desistiu do duelo ("..getPlayerStorageValue(p1, duelTable.infoBalls).."x"..getPlayerStorageValue(p1, duelTable.infoBalls)..") contra o jogador ("..getPlayerAdvers(p1)..").")
	doEreaseDuel(p1)
end

function doLoser(p1)
	if not isCreature(p1) then return true end
	setPlayerStorageValue(p1, duelTable.loses, getPlayerStorageValue(p1, duelTable.loses) +1)
	if getPlayerStorageValue(p1, 55006) >= 1 then 
		doSendAnimatedText(getThingPos(p1), "LOSER!", 180)
		doPlayerSendTextMessage(p1, 20, "Você perdeu o duelo ("..getPlayerStorageValue(p1, duelTable.infoBalls).."x"..getPlayerStorageValue(p1, duelTable.infoBalls)..") contra o jogador ("..getPlayerAdvers(p1)..")." )
	end
	doEreaseDuel(p1)
end

function getPokemonsCount(p1)
	return getPlayerStorageValue(p1, duelTable.pokeballsCount)
end

function getPlayerAdvers(cid) return getPlayerStorageValue(cid, duelTable.targetName) end

function doIniteDuel(p1, p2, pokeballsCount) 

	if not isCreature(p1) or not isCreature(p2) then 
		return true 
	end
	
	if getPlayerStorageValue(p1, duelTable.isInDuel) >= 1  then
		doPlayerSendTextMessage(p1, "Você já está em um duel!")
		return true 
	end
		
	if getPlayerStorageValue(p2, duelTable.isInDuel) >= 1 then	
		doPlayerSendTextMessage(p2, "O player ("..getCreatureName(p2)..") já está em um duelo!")
		return true 
	end
	
	if #getPlayerPokeballs(p1) < pokeballsCount then 
		doPlayerSendTextMessage(p1, 20, "Você não tem a quantidade exigida de pokemon para este duelo.") 
		return true 
	end
	
	if #getCreatureSummons(p1) <= 0 then 
		doPlayerSendTextMessage(p1, 20, "Chame um pokemon para invitar o jogador (" .. getCreatureName(p2) .. ").") 
		return true 
	end
	
	if #getPlayerPokeballs(p2) < pokeballsCount then 
		doPlayerSendTextMessage(p1, 20, "O player ("..getCreatureName(p2)..") não tem a quantidade exigida de pokemon para este duelo.") 
		return true 
	end
	
	if getCreatureSkullType(p1) == SKULL_WHITE then
		doPlayerSendTextMessage(p1, 20, "Você já está em um duelo.")
		return true
	elseif getCreatureSkullType(p1) == 1 then
		doPlayerSendTextMessage(p1, 20, "Você já convidou um player, aguarde a reposta dele.")
		return true
	elseif getCreatureSkullType(p1) == 2 then
		doPlayerSendTextMessage(p1, 20, "Você já foi convidado para um duelo.")
		return true
	end
	
	if getCreatureSkullType(p2) == SKULL_WHITE then
		doPlayerSendTextMessage(p1, 20, "Este player já está em um duelo.")
		return true
	elseif getCreatureSkullType(p2) == 1 then
		doPlayerSendTextMessage(p1, 20, "Este player está convidando um player para duelo.")
		return true
	elseif getCreatureSkullType(p2) == 2 then
		doPlayerSendTextMessage(p1, 20, "Este player já foi convidado para um duelo.")
		return true
	end
	
	if getDistanceBetween(getThingPos(p2), getThingPos(p1)) > 5 then
		doPlayerSendTextMessage(p1, 20, "Chegue mais perto de seu adversário.")
		return true
	end
	
	setPlayerStorageValue(p1, duelTable.targetName, getPlayerName(p2))
	setPlayerStorageValue(p1, duelTable.infoBalls, pokeballsCount)
	setPlayerStorageValue(p2, duelTable.targetName, getPlayerName(p1))
	
	doCreatureSetSkullType(p1, 1) 
	doCreatureSetSkullType(p2, 2)
	
	doPlayerSendTextMessage(p1, 20, "O jogador " .. getCreatureName(p2) .. " foi convidado para o duelo de ".. pokeballsCount .." pokémon"..(pokeballsCount > 1 and "s" or "")..". Aguarde a resposta.")
	doPlayerSendTextMessage(p2, 20, "O jogador " .. getCreatureName(p1) .. " lhe convidou para um duelo de ".. pokeballsCount .." pokémon"..(pokeballsCount > 1 and "s" or "")..".")
	doPlayerSendTextMessage(p2, 20, "Você tem 15 segundos para aceitar o duelo.")
	addEvent(doNotAcceotedDuel, 15 * 1000, p1, p2)
end

function isInvitedDuel(p1, p2)
	if not isCreature(p1) or not isCreature(p2) then return true end
	if getPlayerAdvers(p1) == getCreatureName(p2) then
		return true
	end
	return false
end

function acceptDuel(p1, p2, pokeballsCount)
	if not isCreature(p1) or not isCreature(p2) then return true end
	if #getPlayerPokeballs(p1) < pokeballsCount then 
		doPlayerSendTextMessage(p1, 20, "Você não tem a quantidade de pokemon exigida para este duelo.2") 
		doNotAcceotedDuel(p1, p2)
		return true
	elseif #getPlayerPokeballs(p2) < pokeballsCount then 
		doPlayerSendTextMessage(p2, 20, "Você não tem a quantidade de pokemon exigida para este duelo.1") 
		doNotAcceotedDuel(p2, p1)
		return true	
	end
	if #getCreatureSummons(p1) <= 0 then 
		doNotAcceotedDuel(p1, p2)
		return true 
	elseif #getCreatureSummons(p2) <= 0 then 
		doNotAcceotedDuel(p2, p1)
		return true 
	end
	
	setPlayerStorageValue(p1, duelTable.pokeballsCount, pokeballsCount) -- quantidade de pokeballs 
	setPlayerStorageValue(p2, duelTable.pokeballsCount, pokeballsCount) -- quantidade de pokeballs 
	
	setPlayerStorageValue(p1, duelTable.isInDuel, 1) -- quantidade de pokeballs 
	setPlayerStorageValue(p2, duelTable.isInDuel, 1) -- quantidade de pokeballs 

	mayNotMove(p1, true)		
	mayNotMove(p2, true)		
	
	doSendAnimatedText(getThingPos(p1), "START!", 215)
	doSendAnimatedText(getThingPos(p2), "START!", 215)
	setPlayerStorageValue(p1, duelTable.giveUP, 0)
	setPlayerStorageValue(p2, duelTable.giveUP, 0)
end

function doPantinNoDuel(p1, p2, pokeballsCount, count)
	if not isCreature(p1) or not isCreature(p2) then 
		return true 
	end
	
	if not isInvitedDuel(p1, p2) then 
		return true 
	end

	if #getPlayerPokeballs(p1) < pokeballsCount then 
		doPlayerSendTextMessage(p1, 20, "Você não tem a quantidade exigida de pokemon para este duelo.") 
		return true 
	end
	
	if getCreatureSkullType(p1) ~= SKULL_WHITE and #getCreatureSummons(p1) <= 0 then 
		doPlayerSendTextMessage(p1, 20, "Chame um pokemon para aceitar o duelo com o jogador (" .. getCreatureName(p2) .. ").") 
		return true 
	end	
	
	if getTileInfo(getThingPos(p1)).protection then
		doPlayerSendTextMessage(p1, 20, "Saia da protect-zone para convidar alguém para o duel.")
		return true
	end
	
	if getTileInfo(getThingPos(getCreatureSummons(p1)[1])).protection then
		doPlayerSendTextMessage(p1, 20, "Retire seu pokemon da protect-zone para aceitar este duel.")
		return true
	end
	if getDistanceBetween(getThingPos(p2), getThingPos(p1)) > 5 then
		doPlayerSendTextMessage(p1, 20, "Chegue mais perto do seu adversário.")
		return true
	end
	
	if count == 0 then
		acceptDuel(p1, p2, pokeballsCount)
		return true
	end
	
	setPlayerStorageValue(p1, duelTable.acceptedDuel, 1)
	setPlayerStorageValue(p2, duelTable.acceptedDuel, 1)
	doSendAnimatedText(getThingPos(p1), count.."!", 215)
	doSendAnimatedText(getThingPos(p2), count.."!", 215)
	setPlayerStorageValue(p1, duelTable.giveUP, 1)
	setPlayerStorageValue(p2, duelTable.giveUP, 1)
	addEvent(doPantinNoDuel, 1000, p1, p2, pokeballsCount, count-1)
	doCreatureSetSkullType(p1, SKULL_WHITE) 
	doCreatureSetSkullType(p2, SKULL_WHITE) 
end

function doNotAcceotedDuel(p1, p2)
	if not isCreature(p1) or not isCreature(p2) then return true end
	--if getPlayerStorageValue(p1, duelTable.acceptedDuel) == 0 or getPlayerStorageValue(p2, duelTable.acceptedDuel) == 0 then return true end -- caso o duelo acabe antes dacontagem de tempo de por poke pra fora
	if getPlayerStorageValue(p1, duelTable.acceptedDuel) >= 1 and getPlayerStorageValue(p2, duelTable.acceptedDuel) >= 1 then return true end
	if getCreatureSkullType(p1) ~= 1 then
		return true
	end
	doEreaseDuel(p1)
	doEreaseDuel(p2)
	doPlayerSendTextMessage(p1, 20, "O player (" .. getCreatureName(p2) .. ") não aceitou o duelo.")
	doPlayerSendTextMessage(p2, 20, "O duelo entre você e o player (" .. getCreatureName(p1) .. ") foi cancelado.")
	doCreatureSetSkullType(p1, 0) 
	doCreatureSetSkullType(p2, 0)
end

function doEreaseDuel(p1)

	mayNotMove(p1, false)		
	setPlayerStorageValue(p1, duelTable.acceptedDuel, 0)
	setPlayerStorageValue(p1, duelTable.pokeballsCount, 0) -- quantidade de pokeballs 
	setPlayerStorageValue(p1, duelTable.targetName, 0) -- quantidade de pokeballs 
	setPlayerStorageValue(p1, duelTable.giveUP, 0)
	setPlayerStorageValue(p1, duelTable.isInDuel, 0)
	doCreatureSetSkullType(p1, SKULL_NONE)
	doCreatureSetSkullType(p1, SKULL_NONE)
	
end