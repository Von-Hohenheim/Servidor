local ballcatch = { --id normal, id da ball shiy
	[2394] = {cr = 1, on = 193, off = 192, ball = {11826, 11737}, send = 47, typeee = "poke", boost = "0"}, --alterado v1.9 \/
	[2391] = {cr = 3, on = 198, off = 197, ball = {11832, 11740}, send = 48, typeee = "great", boost = "0"},
	[2393] = {cr = 6, on = 202, off = 201, ball = {11835, 11743}, send = 46, typeee = "super", boost = "0"},
	[2392] = {cr = 8, on = 200, off = 199, ball = {11829, 11746}, send = 49, typeee = "ultra", boost = "0"},
	[12617] = {cr = 5, on = 204, off = 203, ball = {10975, 12621}, send = 35, typeee = "saffari", boost = "0"}, 
	[12832] = {cr = 100000, on = 23, off = 24, ball = {12826, 12829}, send = 181, typeee = "master", boost = "50"},
	
	[15677] = {cr = 12, on = 313, off = 314, ball = {16181, 16204}, send = 72, typeee = "magu", boost = "0", type = {"fire", "ground"}},
	[15676] = {cr = 12, on = 316, off = 317, ball = {16182, 16205}, send = 73, typeee = "sora", boost = "0", type = {"ice", "flying"}},
	[15678] = {cr = 12, on = 320, off = 321, ball = {16183, 16206}, send = 74, typeee = "yume", boost = "0", type = {"normal", "psychic"}},
	[15680] = {cr = 12, on = 322, off = 323, ball = {16184, 16207}, send = 75, typeee = "dusk", boost = "0", type = {"rock", "fighting"}},
	[15673] = {cr = 12, on = 331, off = 332, ball = {16187, 16210}, send = 78, typeee = "tale", boost = "0", type = {"dragon", "fairy"}},
	[15674] = {cr = 12, on = 334, off = 335, ball = {16188, 16211}, send = 79, typeee = "moon", boost = "0", type = {"dark", "ghost"}},
	[15675] = {cr = 12, on = 337, off = 338, ball = {16189, 16212}, send = 80, typeee = "net", boost = "0", type = {"bug", "water"}},
	[15681] = {cr = 12, on = 346, off = 347, ball = {16192, 16215}, send = 83, typeee = "tinker", boost = "0", type = {"electric", "steel"}},
	
	[15679] = {cr = 3, on = 343, off = 344, ball = {16191, 16214}, send = 82, typeee = "premier", boost = "0"},
	
	[15682] = {cr = 12, on = 325, off = 326, ball = {16185, 16208}, send = 76, typeee = "fast", boost = "0", pokes = {"Shiny Dodrio", "Dodrio", "Shiny Arcanine", "Arcanine", "Pikachu", "Raichu", "Shiny Raichu", "Beedrill", "Shiny Beedrill"}},
	[15672] = {cr = 12, on = 328, off = 329, ball = {16186, 16209}, send = 77, typeee = "heavy", boost = "0", pokes = {"Snorlax", "Venusaur", "Blastoise", "Rhydon", "Shiny Snorlax", "Shiny Venusaur", "Shiny Blastoise", "Shiny Rhydon", "Graveler", "Golem", "Shiny Golem", "Lapras"}},
}

function onUse(cid, item, frompos, item3, topos)
	
	local item2 = getTopCorpse(topos)
	if item2 == null then
		return true
	end
	
	if getPlayerStorageValue(cid, 55006) >= 1 then 
		doPlayerSendCancel(cid, "Você não pode capturar nenhum pokémon enquanto está em duel.")
		return true
	end
	
	if getItemAttribute(item2.uid, "catching") == 1 then
		return true
	end 
	
	local name = string.lower(getItemAttribute(item2.uid, "pokeName"))
	name = string.gsub(name, "fainted ", "")
	name = string.gsub(name, "defeated ", "")
	name = doCorrectPokemonName(name)	
		
	local storage = newpokedex[name].stoCatch 
	
	if type(getPlayerStorageValue(cid, storage)) ~= "string" or not string.find(getPlayerStorageValue(cid, storage), "magu") then --alterado v1.9 
		setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;") --alterado v1.9 
	end 
	
	local owner = getItemAttribute(item2.uid, "corpseowner")
	local pOwner = getPlayerByName(owner)
	local isInParyWithPlayer = false
	
	if isInParty(cid) and isInParty(pOwner) then
		isInParyWithPlayer = isPartyEquals(pOwner, cid)
	end
	
	if owner and isCreature(pOwner) and isPlayer(pOwner) and cid ~= pOwner and not isInParyWithPlayer then 
		doPlayerSendCancel(cid, "Desculpa. Isso não é possivel.")
		return true
	end
	
	local newidd = isShinyName(name) and ballcatch[item.itemid].ball[2] or ballcatch[item.itemid].ball[1] or false --alterado v1.9 
	local typeee = ballcatch[item.itemid].typeee
	local boost = ballcatch[item.itemid].boost	
	
	local catchBlocks = {"Kabuto", "Kabutops", "Omanyte", "Omastar", "Magmortar", "Electivire", "Dusknoir", "Milotic", "Rhyperior", "Metagross", "Salamence", "Slaking", "Tangrowth" ,"Shiny Vileplume", "Shiny Golem", "Shiny Nidoking", "Shiny Fearow", "Shiny Hypno", "Shiny Flareon", "Shiny Jolteon", "Shiny Vaporeon", "Shiny Salamence", "Shiny Magmortar", "Shiny Electivire", "Shiny Scizor", "Magmortar", "Electivire", "Slaking", "Absol", "Milotic", "Metagross", "Tangrowth", "Salamence", "Rhyperior", "Dusknoir", "Moltres", "Articuno", "Zapdos", "Aerodactyl", "Hitmonlee", "Hitmonchan", "Hitmontop", "Tyrogue"}
	if isInArray(catchBlocks, name) then
		doSendMsg(cid, "Você não pode capturar este pokemon.")
		return true
	end

	local catchCyber = {"Shiny Dodrio", "Shiny Magneton", "Shiny Espeon", "Shiny Umbreon", "Shiny Rhydon", "Shiny Ninetales", "Shiny Onix", "Shiny Ariados", "Shiny Stantler", "Shiny Politoed"}
	
	if isInArray(catchCyber, name) and getPlayerStorageValue(cid, 50926) ~= 1 then
		doSendMsg(cid, "Você não concluio a Cyber Quest!")
		return true
	end
	
	if getPlayerStorageValue(cid, 1654987) >= 1 then
		doSendMsg(cid, "Você não pode capturar pokémons nesse local.")
		return true
	end
	
	if typeee == "master" and isShinyName(name) then
		doSendMsg(cid, "Você não pode capturar pokemon shiny com a master ball.")
		return true
	end

	-- // New's Bag \\ --
	
	if typeee == "poke" then
		local valor = getPlayerStorageValue(cid, 233200) <= 0 and 1 or getPlayerStorageValue(cid, 233200)
		setPlayerStorageValue(cid, 233200, valor + 1)
	elseif typeee == "great" then
		local valor1 = getPlayerStorageValue(cid, 233201) <= 0 and 1 or getPlayerStorageValue(cid, 233201)
		setPlayerStorageValue(cid, 233201, valor1 + 1)
	elseif typeee == "super" then
		local valor2 = getPlayerStorageValue(cid, 233202) <= 0 and 1 or getPlayerStorageValue(cid, 233202)
		setPlayerStorageValue(cid, 233202, valor2 + 1)
	elseif typeee == "ultra" then
		local valor3= getPlayerStorageValue(cid, 233203) <= 0 and 1 or getPlayerStorageValue(cid, 233203)
		setPlayerStorageValue(cid, 233203, valor3 + 1)
	end
	
	if getPlayerStorageValue(cid, 233200) >= 1000 and getPlayerStorageValue(cid, 232200) ~= 1 then
		doPlayerAddItem(cid, 12683, 1)
		setPlayerStorageValue(cid, 232200, 1)
	elseif getPlayerStorageValue(cid, 233201) >= 2000 and getPlayerStorageValue(cid, 232201) ~= 1 then	
		doPlayerAddItem(cid, 12682, 1)
		setPlayerStorageValue(cid, 232201, 1)
	elseif getPlayerStorageValue(cid, 233202) >= 3000 and getPlayerStorageValue(cid, 232202) ~= 1 then	
		doPlayerAddItem(cid, 12684, 1)
		setPlayerStorageValue(cid, 232202, 1)
	elseif getPlayerStorageValue(cid, 233203) >= 5000 and getPlayerStorageValue(cid, 232203) ~= 1 then	
		doPlayerAddItem(cid, 12685, 1)
		setPlayerStorageValue(cid, 232203, 1)
	end

	if getPlayerStorageValue(cid, 244787) >= 1 and typeee ~= "saffari" then 
		doPlayerSendCancel(cid, "Você não pode capturar esse pokémon com essa Pokébola.")
		return true
	end	
	
	if getPlayerStorageValue(cid, 244787) >= 1 and getPlayerItemCount(cid, 12617) <= 1 then --alterado v1.9
		setPlayerStorageValue(cid, 244787, -1) 
		doTeleportThing(cid, {x = 925, y = 1535, z = 6}, false)
		doSendMagicEffect(getThingPos(cid), 21)
		doPlayerSendTextMessage(cid, 27, "Você não tem mais Saffari Ball!")
	end		
		
--[[	if getPlayerStorageValue(cid, 141416) >= 1 then
		return true
	end]]--
	
	local catchinfo = {}
	
	if isShinyName(name) then
		catchinfo.rate = ballcatch[item.itemid].cr + getPlayerSorte()
	else
		catchinfo.rate = ballcatch[item.itemid].cr + getPlayerSorteInNormal()
	end
	
	catchinfo.catch = ballcatch[item.itemid].on
	catchinfo.fail = ballcatch[item.itemid].off
	catchinfo.newid = newidd 
	catchinfo.name = doCorrectPokemonName(name)
	catchinfo.topos = topos
	--catchinfo.chance = x.chance	
	
	doBrokesCount(cid, newpokedex[doCorrectPokemonName(name)].stoCatch , typeee)
	
	doSendDistanceShoot(getThingPos(cid), topos, ballcatch[item.itemid].send)
	doRemoveItem(item.uid, 1)
	
	---- newsBalls
	if (ballcatch[item.itemid].type ~= nil or ballcatch[item.itemid].pokes ~= nil) then
		catchinfo.rate = getBallsRate(catchinfo.name, item.itemid) + getPlayerSorte()
	end
	
--	if isGod(cid) and getPlayerStorageValue(cid, 394672) >= 1 then catchinfo.rate = 100000 end 
	
	local d = getDistanceBetween(getThingPos(cid), topos)
	
	setPlayerStorageValue(cid, 141416, 1)
	addEvent(setPlayerStorageValue, 725, cid, 141416, -1)
	doItemSetAttribute(item2.uid, "catching", 1)
	addEvent(doSendPokeBall, d * 70 + 100 - (d * 14) , cid, catchinfo, false, false, typeee, 1.5) 
	addEvent(doSendMagicEffect, (d * 70 + 100 - (d * 14)) - 100, topos, 3)
	return true
end

function getPlayerSorte()

	if math.random(1, 200) >= 199 then
		ballS = math.random(250, 450)
	else
		ballS = math.random(1, 35)
	end		
	
	return ballS
end

function getPlayerSorteInNormal()
	
	if math.random(1, 100) >= 95 then
		ballS = math.random(250, 450)
	else
		ballS = math.random(1, 35)
	end		
	
	return ballS
end

function getBallsRate(name, id)
	if pokes[name] then
		if isInArray(ballcatch[id].type, pokes[name].type) or isInArray(ballcatch[id].type, pokes[name].type2) or isInArray(ballcatch[id].pokes, name) then
			return 12
		end
	end
	return 8
end