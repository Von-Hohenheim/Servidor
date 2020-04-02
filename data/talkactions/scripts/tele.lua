local poke = {"Beldum", "Metang", "Metagross", "Claydol", "Grumpig", "Meditite", "Medicham", "Ralts", "Kirlia", "Gardevoir" ,"Espeon", "Shiny Xatu", "Jynx", "Shiny Jynx", "Xatu", "Natu", "Exeggutor", "Slowking", "Slowbro", "Shiny Mr. Mime", 'Mew', 'Mewtwo', 'Abra', 'Kadabra', 'Alakazam', 'Drowzee', 'Hypno', 'Mr. Mime', 'Porygon', 'Shiny Abra', 'Shiny Alakazam', 
'Shiny Hypno', 'Porygon2'} --alterado v1.9

local places = {
	[1] = {name = "saffron", id = 1, sto = 897530},
	[2] = {name = "cerulean", id = 2, sto = 897531},
	[3] = {name = "celadon", id = 3, sto = 897532},
	[4] = {name = "lavender", id = 10, sto = 897533},
	[5] = {name = "vermilion", id = 4, sto = 897534},
	[6] = {name = "fuchsia", id = 9, sto = 897535}, --alterado v1.7
	[7] = {name = "cinnabar", id = 8, sto = 897536},
	[8] = {name = "viridian", id = 6, sto = 897537}, 
	[9] = {name = "pewter", id = 5},
	[10] = {name = "survival island", id = 14},
--[[	[10] = {name = "Slateport", id = 12},
	[11] = {name = "Dewford", id = 11}
	[12] = {name = "Pacifidlog", id = 13},
]]--	
}

function onSay(cid, words, param)

	if #getCreatureSummons(cid) == 0 then
		return 	doPlayerSendCancel(cid, "Você precisa de um pokémon para teleportar.")
	end
	
	if getPlayerStorageValue(cid, 55006) >= 1 then 
		return doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está duelando!") --alterado v2.6
	end
	
	if getPlayerStorageValue(cid, 245678) >= 1 then
		return doPlayerSendCancel(cid, "Você não pode se teletransportar enquanto estiver na Clones Quest!")
	end

	if (param == '') then
	
		local str = ""
		str = str .. "Places to go :\n\nHouse\n"
		
		for a = 1, #places do
			str = str..""..doCorrectString(places[a].name).."\n"
		end
		
		doShowTextDialog(cid, 7416, str)
		return true
	end
	
	local item = getPlayerSlotItem(cid, 8)
	local nome = getRealPokeballName(item.uid) -- getPokeballName retorna o nick.
	local summon = getCreatureSummons(cid)[1]
	local lastppos = getThingPos(cid)
	local lastspos = getThingPos(summon)
	local telepos = {}
	local myplace = ""
	local townid = 0
	
	if (#getCreatureSummons(cid) >= 1) and (not isInArray(poke, nome)) then
	    doPlayerSendCancel(cid, "Esse pokemon não possui a habilidade Teleport.")
		return true
	end
	
	local heldy = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "yHeldItem")
	
	if heldy then
		local heldName, heldTier = string.explode(heldy, "|")[1], string.explode(heldy, "|")[2]
		if heldName == "Y-Teleport" then -- do ACCURACY
			time = 60 * heldTeleport[tonumber(heldTier)]
		end
	else
		time = 60 * 60
	end	
	
	if getPlayerStorageValue(cid, 9499) - os.time() > 1 then--exhaustion.get(cid, etele) and exhaustion.get(cid, etele) > 0 then
		doPlayerSendCancel(cid, "Você precisa esperar "..convertTime(getPlayerStorageValue(cid, 9499) - os.time()).." para teleportar novamente.")
		return true
	end
	
	if getCreatureCondition(cid, CONDITION_INFIGHT) then
		doPlayerSendCancel(cid, "Your pokemon can't concentrate during battles.")
		return true
	end
	
	if string.lower(param) == "house" then
		
		if not getHouseByPlayerGUID(getPlayerGUID(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You don't own a house.")
			return true
		end

		telepos = getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(cid)))
		myplace = "our home"
		
	else
		local t = string.explode(param, '"')
		for x = 1, #places do
			if string.find(string.lower(places[x].name), string.lower(t[1])) then
				townid = places[x].id
				myplace = places[x].name
			end
		end
		
		if myplace == "" then
			doPlayerSendCancel(cid, "That place doesn't exist.")
			return true
		end
		
	end
	
	if getPlayerStorageValue(cid, 123124) >= 1 then
		setPlayerStorageValue(cid, 123124, -1)
	end

	if getPlayerStorageValue(cid, 2154600) >= 1 then
		setPlayerStorageValue(cid, 2154600, -1)	
		setPlayerStorageValue(cid, 2154601, -1)	
		setPlayerStorageValue(cid, 1654987, -1)	
		setPlayerStorageValue(cid, 468703, 15 * 60 + os.time())	
		return true
	end
	
	if getPlayerInGolden(cid) then
		removeConditionArena(cid)
	end
		
	if myplace ~= "" and townid > 0 then
		telepos = getTownTemplePosition(townid)
	end
	
	if not isPremium(cid) and (myplace == "survival island" or myplace == "Survival Island") then
		doPlayerSendCancel(cid, "Você só pode se teletransportar para Survival Island se for vip!")
		return true
	end
	
	doSendMagicEffect(getThingPos(summon), 29)
	doSendMagicEffect(getThingPos(cid), 29)
	
	doTeleportThing(cid, telepos, false)
	doTeleportThing(summon, {x = telepos.x + 1, y = telepos.y, z = telepos.z}, false)
	doCreatureSetLookDir(summon, SOUTH)
	
	doSendMagicEffect(getThingPos(summon), 29)
	doSendMagicEffect(getThingPos(cid), 29)
	
	doCreatureSay(cid, ""..nome..", teleport to "..doCorrectString(myplace).."!", TALKTYPE_ORANGE_1)
	doCreatureSay(cid, ""..nome..", teleport to "..doCorrectString(myplace).."!", TALKTYPE_ORANGE_1, false, 0, lastppos)
	
	doCreatureSetLookDir(cid, SOUTH)
	setPlayerStorageValue(cid, 244787, -1) -- remover valores do saffari
	setPlayerStorageValue(cid, 9499, time * (isPremium(cid) and 0.20 or 1) + os.time()) -- 35
	
	return true
end