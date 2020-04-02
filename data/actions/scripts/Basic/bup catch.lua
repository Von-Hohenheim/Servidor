function doChanceCatch(cid, name, pokeballTypee)
	local str = newpokedex[name].stoCatch
	local Wast = getWastedBall(cid, str)
	local doCatch = false
	
	local playerPoints = 0
	
	if Wast.normal > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["pokeball"] * Wast.normal)
	end
	
	if Wast.great > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["greatball"] * Wast.great)
	end
	
	if Wast.super > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["superball"] * Wast.super)
	end
	
	if Wast.ultra > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["ultraball"] * Wast.ultra)
	end
	
	if Wast.saffari > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["saffariball"] * Wast.saffari)
	end
	
	if Wast.premier > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["premierball"] * Wast.premier)
	end
	
	if Wast.magu > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["maguball"] * Wast.magu)
	end
	
	if Wast.sora > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["soraball"] * Wast.sora)
	end
	
	if Wast.yume > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["yumeball"] * Wast.yume)
	end
	
	if Wast.dusk > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["duskball"] * Wast.dusk)
	end
	
	if Wast.tale > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["taleball"] * Wast.tale)
	end
	
	if Wast.moon > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["moonball"] * Wast.moon)
	end
	
	if Wast.net > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["netball"] * Wast.net)
	end
	
	if Wast.tinker > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["tinkerball"] * Wast.tinker)
	end
	
	if Wast.fast > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["fastball"] * Wast.fast)
	end
	
	if Wast.heavy > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["heavyball"] * Wast.heavy)
	end
	
	local pokeTab = pokeChance[name]
	if pokeTab then
		local pokeChance = pokeTab.media * ballsTypesCatch[pokeTab.balltype]
		
		local tableMinBall = { --
			["pokeball"] = "Poke Ball", -- Se eu joguei pokeball, ganhará 1 point por cada
			["greatball"] = "Great Ball", -- Se eu joguei great ball, ganhará 2 points por cada
			["superball"] = "Super Ball", -- Se eu joguei superball, ganhará 3 points por cada
			["ultraball"] = "Ultra Ball", -- Se eu joguei ultraball, ganhará 4 points por cada			
			["saffariball"] = "Saffari Ball", -- Se eu joguei ultraball, ganhará 4 points por cada			
		}
		
		local tablert = { -- typeee para type normal
			["poke"] = 1,
			["great"] = 2,
			["super"] = 3,
			["ultra"] = 5,
			["premier"] = 6,
			["magu"] = 6,
			["sora"] = 6,
			["yume"] = 6,
			["dust"] = 6,
			["tale"] = 6,
			["moon"] = 6,
			["net"] = 6,
			["tinker"] = 6,
			["fast"] = 6,
			["heavy"] = 6,
			["saffari"] = 6,
		}
		
		if tablert[pokeballTypee] < ballsTypesCatch[pokeTab.minBallType] then
			return 2
		end
		
		if playerPoints > pokeChance and not isShinyName(name) then
			
			local extraChance = (pokeChance - playerPoints) * -1
			local Eachpercent = math.ceil(extraChance * 0.6) -- 0.7 velocidade em q aumenta rate por ball
			
			playerPoints = playerPoints + (Eachpercent)		
			
		end
		
		local media = pokeTab.media	
		local finalRand = 0
		
		if media < 26 then
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3)* 1.1)
			
		elseif media >= 26 and media < 60 then
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			finalRand = math.ceil((rand1 + rand2 + rand3)* 1.2)
			
		elseif media >= 60 and media <= 100 then
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			local rand4 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3 + rand4)/1.35)
			
		elseif media > 100 and media <= 180 then
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			local rand4 = math.random(1, pokeChance)
			local rand5 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3 + rand4 + rand5)/1.55)	
			
		elseif media > 180 and media <= 250 then
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			local rand4 = math.random(1, pokeChance)
			local rand5 = math.random(1, pokeChance)
			local rand6 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3 + rand4 + rand5 + rand6)/1.65)
			
		elseif media > 250 and media <= 300 then
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			local rand4 = math.random(1, pokeChance)
			local rand5 = math.random(1, pokeChance)
			local rand6 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3 + rand4 + rand5 + rand6)/1.70)
			
		elseif media > 300 and media <= 350 then
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			local rand4 = math.random(1, pokeChance)
			local rand5 = math.random(1, pokeChance)
			local rand6 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3 + rand4 + rand5 + rand6)/1.75)
			
		elseif media > 350 and media <= 400 then
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			local rand4 = math.random(1, pokeChance)
			local rand5 = math.random(1, pokeChance)
			local rand6 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3 + rand4 + rand5 + rand6)/1.78) -- 1.80
			
		elseif media > 400 and media <= 450 then
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			local rand4 = math.random(1, pokeChance)
			local rand5 = math.random(1, pokeChance)
			local rand6 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3 + rand4 + rand5 + rand6)/1.82) -- 1.85
			
		else
			
			local rand1 = math.random(1, pokeChance)
			local rand2 = math.random(1, pokeChance)
			local rand3 = math.random(1, pokeChance)
			local rand4 = math.random(1, pokeChance)
			local rand5 = math.random(1, pokeChance)
			local rand6 = math.random(1, pokeChance)
			finalRand = math.floor((rand1 + rand2 + rand3 + rand4 + rand5 + rand6)/1.84) -- 1.9		
			
		end
		
		if isGod(cid) and getPlayerStorageValue(cid, 394672) >= 1 then	
			return 3
		elseif typeee == "premier" then	 -- premier ball
			local premierMedia = pokeTab.media		
			local premierBase = 2		 
			
			if name == "Magikarp" then
				premierMedia = 2
				premierBase = 1		 
			elseif premierMedia <= 3 or isInArray({"Rattata", "Caterpie", "Weedle", "Pidgey", "Oddish", "Bellsprout"}, name) then
				premierMedia = 5 -- 2/5 de chance, melhor que 1/3 e menor que 1/2
				premierBase = 2
			elseif premierMedia >= 4 and premierMedia <= 6 then
				premierMedia = 6
				premierBase = 1
			elseif premierMedia >= 7 and premierMedia <= 10 then
				premierMedia = 10
				premierBase = 1
			end		 
			
			local premierChance = math.random(1, premierMedia) 
			
			if premierChance <= premierBase then		
				return 3
			end
		else
			if playerPoints > finalRand then
				return 3
			end
		end
		
	end		
	return 1 -- Don't catch
end

-- 1 don't catch
-- 2 Don't catch because ball
-- 3 doCatch

function doSendPokeBall(cid, catchinfo, showmsg, fullmsg, typeee) --Edited brokes count system	
	
	doRemoveItem(corpse, 1)
	addEvent(doNotCapturePokemon, 3000, cid, name, typeee) 
	doSendMagicEffect(topos, fail)
end

function doCapturePokemon(cid, poke, typeee) 
	
	if not isCreature(cid) or not poke or not typeee then
		return true
	end
	
	local itemid = pokeballs[poke:lower()].on
	
	local depot = false
	if not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) or not hasCapacityForPokeball(cid) then 
		item = doCreateItemEx(itemid + 1)
		depot = true
	else
		item = addItemInFreeBag(getPlayerSlotItem(cid, 3).uid, itemid, 1) 
	end
	
	doItemSetAttribute(item, "poke", poke)
	doItemSetAttribute(item, "hpToDraw", 0)
	doItemSetAttribute(item, "ball", typeee)
	doSetAttributesBallsByPokeName(cid, item, poke)	
	
	if poke == "Hitmonchan" or poke == "Shiny Hitmonchan" then 
		doItemSetAttribute(item, "hands", 0)
	end
	
	for _, oid in ipairs(getPlayersOnline()) do
		doPlayerSendChannelMessage(oid, "Catch System", "O jogador [".. getCreatureName(cid) .."] capturou um ["..poke.."] usando "..typeee.." ball.", TALKTYPE_CHANNEL_W, 10)
	end
	
	if pokeballs[poke:lower()] then
		doTransformItem(item, pokeballs[poke:lower()].on)	
	end	
	
	doPlayerSendTextMessage(cid, 27, "Congratulations, you caught a pokemon ("..poke..")!")
	
	if #getCreatureSummons(cid) >= 1 then
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173) 
	else
		doSendMagicEffect(getThingPos(cid), 173) 
	end
	
	if typeee == "master" then
		doItemSetAttribute(item, "unique", true) 
	elseif typeee == "premier" then
		doItemSetAttribute(item, "aura", "red")
		doPlayerSendTextMessage(cid, 27, "Utilize o comando !aura para trocar de aura")		
	end
	
	if depot then 
		doPlayerSendMailByName(getCreatureName(cid), item, 1)	
		doPlayerSendTextMessage(cid, 27, "Since you are already holding six pokemons, this pokeball has been sent to your depot.") 
	end
	
	if poke == tostring(getPlayerStorageValue(cid, catchModes.storage2)) and not hasCatched(cid) then
		setDailyCatched(cid, true)
		doPlayerSendTextMessage(cid, 27, "Daily Catch: Você terminou a missão! Volte para pegar sua recompensa!")
	end
	
	local storage = newpokedex[poke].stoCatch 
	sendBrokesMsg(cid, storage, typeee, poke, true) 
	setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;") --alterado v1.9 /\
	
end

function doNotCapturePokemon(cid, poke, typeee) 
	
	if not isCreature(cid) then
		return true
	end
	
	failmsgs = {
		"Sorry, you didn't catch that pokemon.",
		"Sorry, your pokeball broke.",
		"Sorry, the pokemon escaped.",
	}
	
	doPlayerSendTextMessage(cid, 27, failmsgs[math.random(#failmsgs)])
	
	if #getCreatureSummons(cid) >= 1 then
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 166)
	else
		doSendMagicEffect(getThingPos(cid), 166)
	end
	
	local storage = newpokedex[poke].stoCatch
	sendBrokesMsg(cid, str, ball, poke, false)
	
end

local ballcatch = { --id normal, id da ball shiy
	[2394] = {cr = 1, on = 193, off = 192, ball = {11826, 11737}, send = 47, typeee = "poke", boost = "0"}, --alterado v1.9 \/
	[2391] = {cr = 3, on = 198, off = 197, ball = {11832, 11740}, send = 48, typeee = "great", boost = "0"},
	[2393] = {cr = 6, on = 202, off = 201, ball = {11835, 11743}, send = 46, typeee = "super", boost = "0"},
	[2392] = {cr = 8, on = 200, off = 199, ball = {11829, 11746}, send = 49, typeee = "ultra", boost = "0"},
	[12617] = {cr = 5, on = 204, off = 203, ball = {10975, 12621}, send = 35, typeee = "saffari", boost = "0"}, 
	[12832] = {cr = 100000, on = 23, off = 24, ball = {12826, 12829}, send = 181, typeee = "master", boost = "50"},
	
	[15677] = {cr = 10, on = 313, off = 314, ball = {16181, 16204}, send = 72, typeee = "magu", boost = "0", type = {"fire", "ground"}},
	[15676] = {cr = 10, on = 316, off = 317, ball = {16182, 16205}, send = 73, typeee = "sora", boost = "0", type = {"ice", "flying"}},
	[15678] = {cr = 10, on = 320, off = 321, ball = {16183, 16206}, send = 74, typeee = "yume", boost = "0", type = {"normal", "psychic"}},
	[15680] = {cr = 10, on = 322, off = 323, ball = {16184, 16207}, send = 75, typeee = "dusk", boost = "0", type = {"rock", "fighting"}},
	[15673] = {cr = 10, on = 331, off = 332, ball = {16187, 16210}, send = 78, typeee = "tale", boost = "0", type = {"dragon", "fairy"}},
	[15674] = {cr = 10, on = 334, off = 335, ball = {16188, 16211}, send = 79, typeee = "moon", boost = "0", type = {"dark", "ghost"}},
	[15675] = {cr = 10, on = 337, off = 338, ball = {16189, 16212}, send = 80, typeee = "net", boost = "0", type = {"bug", "water"}},
	[15681] = {cr = 10, on = 346, off = 347, ball = {16192, 16215}, send = 83, typeee = "tinker", boost = "0", type = {"electric", "steel"}},
	
	[15679] = {cr = 3, on = 343, off = 344, ball = {16191, 16214}, send = 82, typeee = "premier", boost = "0"},
	
	[15682] = {cr = 10, on = 325, off = 326, ball = {16185, 16208}, send = 76, typeee = "fast", boost = "0", pokes = {"Shiny Dodrio", "Dodrio", "Shiny Arcanine", "Arcanine", "Pikachu", "Raichu", "Shiny Raichu", "Beedrill", "Shiny Beedrill"}},
	[15672] = {cr = 10, on = 328, off = 329, ball = {16186, 16209}, send = 77, typeee = "heavy", boost = "0", pokes = {"Snorlax", "Venusaur", "Blastoise", "Rhydon", "Shiny Snorlax", "Shiny Venusaur", "Shiny Blastoise", "Shiny Rhydon", "Graveler", "Golem", "Shiny Golem", "Lapras"}},
}

function onUse(cid, item, frompos, item3, topos)
	
	local item2 = getTopCorpse(topos)
	if item2 == null then
		return true
	end
	
	if getItemAttribute(item2.uid, "catching") == 1 then
		return true
	end 
	
	if getPlayerStorageValue(cid, 55006) >= 1 then 
		doPlayerSendCancel(cid, "Você não pode capturar nenhum pokémon enquanto está em duel.")
		return true
	end
	
	local name = string.lower(getItemAttribute(item2.uid, "pokeName"))
	name = string.gsub(name, "fainted ", "")
	name = string.gsub(name, "defeated ", "")
	name = doCorrectPokemonName(name)
	
	local x = pokecatches[name]
	
	if not x then return true end
	
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
	
	local newidd = isShinyName(name) and ballcatch[item.itemid].ball[2] or ballcatch[item.itemid].ball[1] --alterado v1.9 
	local typeee = ballcatch[item.itemid].typeee
	local boost = ballcatch[item.itemid].boost	
	
	local catchBlocks = {"Moltres", "Articuno", "Zapdos", "Aerodactyl", "Hitmonlee", "Hitmonchan", "Hitmontop", "Tyrogue"}
	if isInArray(catchBlocks, name) then
		doSendMsg(cid, "Você não pode capturar este pokemon.")
		return true
	end
	
	if typeee == "master" and isShinyName(name) then
		doSendMsg(cid, "Você não pode capturar pokemon shiny com a master ball.")
		return true
	end
	
	local effectCatch = ballcatch[item.itemid].on
	local effectDontCatch = ballcatch[item.itemid].off
	
	doBrokesCount(cid, newpokedex[doCorrectPokemonName(name)].stoCatch , typeee)
	doSendDistanceShoot(getThingPos(cid), topos, ballcatch[item.itemid].send)
	doRemoveItem(item.uid, 1)
	
	local d = getDistanceBetween(getThingPos(cid), topos)
	local timeSendBall = d * 70 + 100 - (d * 14)
	
	local catch = doChanceCatch(cid, name, typeee)
	
	doItemSetAttribute(getTopCorpse(topos).uid, "catching", 1)
	
	addEvent(function()
		doRemoveItem(getTopCorpse(topos).uid, 1)
	end, timeSendBall)
	
	addEvent(function()
		if isPlayer(cid) then
			if catch == 3 then
				doCapturePokemon(cid, doCorrectPokemonName(name), typeee)
				doSendMagicEffect(topos, effectCatch)
			elseif catch == 2 then
				doPlayerSendTextMessage(cid, 20, "Você só pode capturar ".. name .." com ".. tableMinBall[pokeTab.minBallType] .." ou superior.")
				doNotCapturePokemon(cid, name, typeee) 
				doSendMagicEffect(topos, effectDontCatch)	
			elseif catch == 1 then
				doNotCapturePokemon(cid, name, typeee)
				doSendMagicEffect(topos, effectDontCatch)
			end
		end
	end, 3000 - timeSendBall - 500)
	return true
end