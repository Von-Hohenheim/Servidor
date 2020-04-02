function sendDittoWindow(cid, item)
	local pokename = tostring(getItemAttribute(item.uid, "poke"))
	if not isInArray({"Shiny Ditto", "Ditto"}, pokename) then
		return true
	end
	if not getItemAttribute(item.uid, "memory") and pokename == "Shiny Ditto" then
		doItemSetAttribute(item.uid, "memory", 3)
	end
	if getItemAttribute(item.uid, "memory") ~= "without" then
		local memory = getItemAttribute(item.uid, "memoryDitto")
		if not memory or memory == nil then
			doItemSetAttribute(item.uid, "memoryDitto", "?|?|?")
			memory = getItemAttribute(item.uid, "memoryDitto")
		end
		local memoryOne, memoryTwo, memoryTree = memory:explode("|")[1], memory:explode("|")[2], memory:explode("|")[3]
		
		local str = memoryOne .. "-".. memoryTwo .."-" .. memoryTree
		doSendPlayerExtendedOpcode(cid, 111, str)
	end
end

function isRare(itemid)
	return isInArray(rareItems, itemid)
end

local outland = {"Furious Mantine", "Brave Nidoqueen", "Wingeon Shiny Pidgeot", "Malefic Shiny Muk", "Seavell Tentacruel", "Brute Rhydon", "Raibolt Raichu", "Psy Jynx", "Capoeira Hitmontop", "Seavell Shiny Seadra", "Volcanic Charizard", "Orebound Golem", "Heavy Piloswine", "Gardestriker Ursaring", "Brave Blastoise", "Singer Wigglytuff", "Volcanic Typhlosion", "Gardestriker Shiny Snorlax", "Wingeon Shiny Dragonite", "Volcanic Magmar", "Aviator Pidgeot", "Taekwondo Hitmonlee", "Gardestriker Shiny Hitmonlee", "Brave Noctowl", "Psycraft Shiny Alakazam", "Tribal Feraligatr", "Master Stantler", "Tribal Scyther", "Furious Scyther", "Gardestriker Shiny Hitmontop", "Elder Charizard", "Enraged Typhlosion", "Trickmaster Gengar", "Brave Charizard", "Undefeated Machamp", "Orebound Aerodactyl", "Wingeon Dragonite", "Roll Donphan", "War Gyarados", "Ancient Kingdra", "Elder Raichu", "Elder Pidgeot", "Brute Ursaring", "Elder Venusaur", "Dragon Machamp", "Master Alakazam", "Seavell Blastoise", "Naturia Shiny Venusaur", "Moon Clefable", "Elder Dragonite", "Magnet Electabuzz", "Wardog Arcanine", "Raibolt Electabuzz", "Volcanic Shiny Arcanine", "Metal Scizor", "Bone Marowak", "Enigmatic Girafarig", "Orebound Shiny Golem", "Malefic Shiny Gengar", "Elder Tyranitar", "Seavell Lapras", "Hard Golem", "Raibolt Shiny Jolteon", "Elder Blastoise", "Evil Cloyster", "Iron Steelix", "Banshee Misdreavus", "Furious Ampharos", "Ancient Dragonite", "Naturia Shiny Scyther", "Lava Magmar", "Orebound Shiny Marowak", "Brave Venusaur", "Elder Pinsir", "Elder Arcanine", "Metal Skarmory", "Ancient Meganium", "Raibolt Shiny Raichu", "Boxer Hitmonchan", "War Heracross", "Seavell Shiny Tentacruel", "Psycraft Alakazam", "Ancient Alakazam", "Malefic Umbreon", "Wingeon Shiny Fearow", "Elder Gengar", "Raibolt Shiny Electabuzz", "Hungry Snorlax", "Naturia Venusaur", "Naturia Shiny Tangela", "War Granbull", "Charged Raichu", "Elder Tangela", "Seavell Jynx", "Orebound Golden Rhydon", "Elder Electabuzz", "Gardestriker Shiny Hitmonchan", "Tribal Xatu", "Wingeon Shiny Farfetch'd", "Dark Crobat", "Elder Muk", "Freezing Dewgong", "Octopus Octillery", "Elder Tentacruel", "Volcanic Arcanine", "Furious Sandslash", "Elder Jynx", "Naturia Scyther", "Psycraft Shiny Hypno", "Seavell Shiny Blastoise", "Volcanic Shiny Charizard", "Malefic Misdreavus", "Malefic Gengar", "Milch-Miltank", "Elder Marowak", "Psycraft Shiny Abra", "Psycraft Slowking", "Brave Nidoking"}


function isPokeOutland(name)
	return isInArray(outland, doCorrectString(name))
end

function isBoss(name)
	return isInArray(bossName, doCorrectString(name))
end

function isShinyCharm(name)
	return isInArray(shinyCharm, doCorrectString(name))
end

function isHoenn(name)
	return isInArray(hoeenPoke, doCorrectString(name))
end

function getAccountStorageValue(accid, key)
	local value = db.getResult("SELECT `value` FROM `account_storage` WHERE `account_id` = " .. accid .. " and `key` = " .. key .. " LIMIT 1;")
	if(value:getID() ~= -1) then
		return value:getDataInt("value")
	else
		return -1
	end
	value:free()
end

function setVipSkull(cid)
	if isPremium(cid) and not isInArray({SKULL_WHITE, 1, 2, 5}, getCreatureSkullType(cid)) then
		doCreatureSetSkullType(cid, 5)
	end
end

function getPlayersInArea(fromPos, toPos)
	local players = {}
      for _, pid in ipairs(getPlayersOnline()) do
          if isInRange(getPlayerPosition(pid), fromPos, toPos) then
             table.insert(players, pid)
          end
      end
      return players
end

function doPlayerAddTableItems(cid, table)
	if isPlayer(cid) then
		for _, item in pairs(table) do
			doPlayerAddItem(cid, item[1], item[2])
		end
	end
end

function getPlayerItems(cid, id) -- By OrochiElf
    local retItems = {}

    for slots = 1, 10 do
        local item = getPlayerSlotItem(cid, slots)
        if isContainer(item.uid) then
            for slotsBp = 0, getContainerSize(item.uid) - 1 do
                local itemBp = getContainerItem(item.uid, slotsBp)
                if id ~= nil then
                    if itemBp.itemid == id then

                        table.insert(retItems, itemBp)
                    end
                else

                    table.insert(retItems, itemBp)
                end
            end
        end
        if id ~= nil then
            if item.itemid == id then

                table.insert(retItems, item)
            end
        else

            table.insert(retItems, item)
        end
    end
    return retItems
end

function setAccountStorageValue(accid, key, value)
	local getvalue = db.getResult("SELECT `value` FROM `account_storage` WHERE `account_id` = " .. accid .. " and `key` = " .. key .. " LIMIT 1;")
	if(getvalue:getID() ~= -1) then
		db.executeQuery("UPDATE `account_storage` SET `value` = " .. accid .. " WHERE `key`=" .. key .. " LIMIT 1');")
		getvalue:free()
		return 1
	else
		db.executeQuery("INSERT INTO `account_storage` (`account_id`, `key`, `value`) VALUES (" .. accid .. ", " .. key .. ", '"..value.."');")
		return 1
	end
end

doAreaCombatHealth = doCombatAreaHealth

function createBall(cid, name, boost, unique)
	local mypoke = pokes[name]
	
	local item = addItemInFreeBag(getPlayerSlotItem(cid, 3).uid, 2219, 1)
	doItemSetAttribute(item, "ball", "poke")
	doItemSetAttribute(item, "SmeargleID", math.random(5, 8))
	doSetAttributesBallsByPokeName(cid, item, name)
	if boost and tonumber(boost) > 0 and tonumber(boost) <= 50 then
		doItemSetAttribute(item, "boost", tonumber(boost))
	end
	if name == "Shiny Hitmonchan" or name == "Hitmonchan" then
		doItemSetAttribute(item, "hands", 0)
	end
	doItemSetAttribute(item, "description", "Contains a "..name..".")
	doItemSetAttribute(item, "fakedesc", "Contains a "..name..".")
	local x = pokeballs[name:lower()] or pokeballs[doCorrectString(name)]
	doTransformItem(item, x.on)	
	if unique and unique == "true" then
		doItemSetAttribute(item, "unique", 1)
	end
	return item
end

function getPlayerTotalExtraExperience(cid)
	local percent = 1
	if isPremium(cid) then
		percent = percent + 0.10 -- + 10% de experiência
	end

	if getPlayerStorageValue(cid, 45144) - os.time() > 1 then
		percent = percent + (tonumber(getPlayerStorageValue(cid, 45145)) / 100)
	end
	return percent
end

function getPlayerBlessPercent(cid)
	return (getPlayerStorageValue(cid, 50405) ~= -1 and getPlayerStorageValue(cid, 50405)/100 or 0)
end

function isDay()
	local hour = (os.date("*t").hour)
	return hour >= 6 and hour < 18
end

function isNight()
	return not isDay()
end

function getNumberMonth()
	return os.date("%m")
end

function getNumberYear()
	return os.date("%Y")
end

function isHour()
	return os.date("%X")
end

function getNumberDay()
	return os.date("%d")
end

function getSeason()
	if isInArray({2, 3, 4}, getNumberMonth()) then
		est = "Primavera"
	elseif isInArray({5, 6, 7}, getNumberMonth()) then
		est = "Verão"
	elseif isInArray({8, 9, 10}, getNumberMonth()) then
		est = "Outono"
	elseif isInArray({11, 12, 1}, getNumberMonth()) then
		est = "Inverno"
	end
	return est
end

--[[poketypes = {
	["none"] = {
		super = {},
		weak = {},
		non = {},
	},
	
	["no type"] = {
		super = {},
		weak = {},
		non = {},
	},	
	
	["normal"] = {
		super = {},
		weak = {"rock", "steel"},
		non = {"ghost"},
	},
	
	["fighting"] = {
		super = {"normal", "rock", "steel", "ice"},
		weak = {"flying", "poison", "bug", "psychic", "fairy"},
		non = {},
	},
	
	["flying"] = {
		super = {"fighting", "bug", "grass"}, -- 0.5x
		weak = {"rock", "eletric"}, -- 2x
		non = {"ground"},
	},
	
	["fairy"] = {
		super = {"fighting", "dragon", "dark"},
		weak = {"poison", "steel", "fire"},
		non = {},
	},
	
	["dark"] = {
		super = {"ghost", "psychic"},
		weak = {"ghost", "fighting", "dark", "fairy"},
		non = {"psychic"},
	},
	
	["dragon"] = {
		super = {"dragon"},
		weak = {"steel"},
		non = {"fairy"},
	},
	
	["ice"] = {
		super = {"flying", "ground", "grass", "dragon"},
		weak = {"steel", "fire", "water", "ice"},
		non = {},
	},
	
	["psychic"] = {
		super = {"fighting", "poison"},
		weak = {"steel", "psychic"},
		non = {},
	},
	
	["electric"] = {
		super = {"flying", "water"},
		weak = {"grass", "eletric"},
		non = {},
	},
	
	["grass"] = {
		super = {"ground", "rock", "water"},
		weak = {"flying", "poison", "bug", "steel", "fire", "grass", "dragon"},
		non = {},
	},
	
	["water"] = {
		super = {"ground", "rock", "fire"},
		weak = {"water", "grass", "electric"},
		non = {},
	},
	
	["fire"] = {
		super = {"bug", "steel", "grass", "ice"},
		weak = {"rock", "fire", "water", "dragon"},
		non = {},
	},
	
	["steel"] = {
		super = {"rock", "ice", "fairy"},
		weak = {"steel", "fire", "water", "eletric"},
		non = {"poison"},
	},
	
	["ghost"] = {
		super = {"ghost", "psychic"},
		weak = {"dark"},
		non = {"normal", "fighting"},
	},
	
	["bug"] = {
		super = {"grass", "psychic", "dark"},
		weak = {"fighting", "flying", "poison", "ghost", "steel", "fire", "fairy"},
		non = {},
	},
	
	["rock"] = {
		super = {"flying", "bug", "fire", "ice"},
		weak = {"steel", "fighting", "ground", "steel", "water"},
		non = {},
	},
	
	["ground"] = {
		super = {"poison", "rock", "steel", "fire", "eletric"},
		weak = {"bug", "grass", "water"},
		non = {"electric"},
	},
	
	["poison"] = {
		super = {"grass", "fairy"},
		weak = {"poison", "ground", "rock"},
		non = {},
	}
}
]]--

poketypes = {
	["none"] = {
		super = {},
		weak = {},
		non = {},
	},
	
	["no type"] = {
		super = {},
		weak = {},
		non = {},
	},	
	
	["normal"] = {
		super = {},
		weak = {ROCKDAMAGE, STEELDAMAGE},
		non = {1, GHOSTDAMAGE},
	},
	
	["fighting"] = {
		super = {NORMALDAMAGE, ROCKDAMAGE, STEELDAMAGE, ICEDAMAGE},
		weak = {FLYINGDAMAGE, POISONDAMAGE, BUGDAMAGE, PSYCHICDAMAGE, FAIRYDAMAGE},
		non = {},
	},
	
	["flying"] = {
		super = {FIGHTINGDAMAGE, BUGDAMAGE, GRASSDAMAGE}, -- 0.5x
		weak = {ROCKDAMAGE, ELECTRICDAMAGE}, -- 2x
		non = {GROUNDDAMAGE},
	},
	
	["fairy"] = {
		super = {FIGHTINGDAMAGE, DRAGONDAMAGE, DARKDAMAGE},
		weak = {POISONDAMAGE, STEELDAMAGE, FIREDAMAGE},
		non = {},
	},
	
	["dark"] = {
		super = {GHOSTDAMAGE, PSYCHICDAMAGE},
		weak = {GHOSTDAMAGE, FIGHTINGDAMAGE, DARKDAMAGE, FAIRYDAMAGE},
		non = {PSYCHICDAMAGE},
	},
	
	["dragon"] = {
		super = {DRAGONDAMAGE},
		weak = {STEELDAMAGE},
		non = {FAIRYDAMAGE},
	},
	
	["ice"] = {
		super = {FLYINGDAMAGE, GROUNDDAMAGE, GRASSDAMAGE, DRAGONDAMAGE},
		weak = {STEELDAMAGE, FIREDAMAGE, WATERDAMAGE, ICEDAMAGE},
		non = {},
	},
	
	["psychic"] = {
		super = {FIGHTINGDAMAGE, POISONDAMAGE},
		weak = {STEELDAMAGE, PSYCHICDAMAGE},
		non = {},
	},
	
	["electric"] = {
		super = {FLYINGDAMAGE, WATERDAMAGE},
		weak = {GRASSDAMAGE, ELECTRICDAMAGE},
		non = {},
	},
	
	["grass"] = {
		super = {GROUNDDAMAGE, ROCKDAMAGE, WATERDAMAGE},
		weak = {FLYINGDAMAGE, POISONDAMAGE, BUGDAMAGE, STEELDAMAGE, FIREDAMAGE, GRASSDAMAGE, DRAGONDAMAGE},
		non = {},
	},
	
	["water"] = {
		super = {GROUNDDAMAGE, ROCKDAMAGE, FIREDAMAGE},
		weak = {WATERDAMAGE, GRASSDAMAGE, ELECTRICDAMAGE},
		non = {},
	},
	
	["fire"] = {
		super = {BUGDAMAGE, STEELDAMAGE, GRASSDAMAGE, ICEDAMAGE},
		weak = {ROCKDAMAGE, FIREDAMAGE, WATERDAMAGE, DRAGONDAMAGE},
		non = {},
	},
	
	["steel"] = {
		super = {ROCKDAMAGE, ICEDAMAGE, FAIRYDAMAGE},
		weak = {STEELDAMAGE, FIREDAMAGE, WATERDAMAGE, ELECTRICDAMAGE},
		non = {POISONDAMAGE},
	},
	
	["ghost"] = {
		super = {GHOSTDAMAGE, PSYCHICDAMAGE},
		weak = {DARKDAMAGE},
		non = {1, NORMALDAMAGE, FIGHTINGDAMAGE},
	},
	
	["bug"] = {
		super = {GRASSDAMAGE, PSYCHICDAMAGE, DARKDAMAGE},
		weak = {FIGHTINGDAMAGE, FLYINGDAMAGE, POISONDAMAGE, GHOSTDAMAGE, STEELDAMAGE, FIREDAMAGE, FAIRYDAMAGE},
		non = {},
	},
	
	["rock"] = {
		super = {FLYINGDAMAGE, BUGDAMAGE, FIREDAMAGE, ICEDAMAGE},
		weak = {STEELDAMAGE, FIGHTINGDAMAGE, GROUNDDAMAGE, STEELDAMAGE, WATERDAMAGE},
		non = {},
	},
	
	["ground"] = {
		super = {POISONDAMAGE, ROCKDAMAGE, STEELDAMAGE, FIREDAMAGE, ELECTRICDAMAGE},
		weak = {BUGDAMAGE, GRASSDAMAGE, WATERDAMAGE},
		non = {ELECTRICDAMAGE},
	},
	
	["poison"] = {
		super = {GRASSDAMAGE, FAIRYDAMAGE},
		weak = {POISONDAMAGE, GROUNDDAMAGE, ROCKDAMAGE},
		non = {},
	}
}

poketypes["fly"] = poketypes["flying"]

function isValueBetween(value, min, max)
	return (value >= min and value < max)
end

function getPokemonAdvantage(pokename)
	local pokename = doCorrectString(pokename)
	local stats = {}
	local type1 = pokes[pokename].type
	local type2 = pokes[pokename].type2
	if type1 then
		for _, b in pairs(poketypes[type1].super) do
			table.insert(stats, b)
		end
	end
	if type2 then
		for _, b in pairs(poketypes[type2].super) do
			table.insert(stats, b)
		end
	end
	return stats
end

function getPokemonDisadvantage(pokename)
	pokename = doCorrectString(pokename)
	local stats = {}
	local type1 = pokes[pokename].type or "none"
	local type2 = pokes[pokename].type2 or "none"
	if type1 then
		for _, b in pairs(poketypes[type1].weak) do
			table.insert(stats, b)
		end
	end
	if type2 then
		for _, b in pairs(poketypes[type2].weak) do
			table.insert(stats, b)
		end
	end
	return stats
end

function getPokemonImunity(pokename)
	pokename = doCorrectString(pokename)
	local stats = {}
	local type1 = pokes[pokename].type
	local type2 = pokes[pokename].type2
	
	if type1 then
		for _, b in pairs(poketypes[type1].non) do
			table.insert(stats, b)
		end
	end
	if type2 then
		for _, b in pairs(poketypes[type2].non) do
			table.insert(stats, b)
		end
	end
	return stats
end


waterID = {4608, 4613, 4610, 4611, 4612, 4609, 16674, 16668, 16672, 11756}

taskStorages = {
	432415,
	431400,	
	431401,
	431402,
	431403,
	431404,
	431405,
	431406,
	431407,
	431408,
	431409,
	431410,
	431411,
	431412,
	431413,
	431414,
	431415,
	431416,
	431417,
	431418,
	431419,
	431420,
	431421,
	431422,
	431423,
	431424,
	431425,
	431426,
	431427,
	431428,
	431429,
	431430,
	431431,	
	431432,	
	431433,	
	431434,	
	431435,	
	431436,	
	431437,	
	431438,	
	431439,	
	431440,	
	431441,	
	431442,	
	431443,	
	431444,	
	431445,	
	431446,	
	431447,	
	431448,	
	431449,	
	431450,	
	431451,	
	431452,	
	431453,	
	431454,	
	431455,	
	431456,	
	431457,	
	431458,	
	431459,	
	431460,	
	431461,	
	431462,	
	431463,	
	431464,	
	431465,	
	431466,	
	431467,	
	431468,	
	431469,	
	431470,	
	431471,	
	431472,	
	431473,	
	431474,	
	431475,	
	431476,	
	431477,	
	431478,	
	431479,	
	431480,	
	431481,	
	431482,	
	431483,	
	431484,	
	431485,	
	431486,	
	431487,	
	431488,	
	431489,	
	431490,	
	431491,	
	431492,	
	431493,	
	431494,	
	431495,	
	431496,	
	431497,	
	431498,	
	431499,	
}

stoneToString = {
	["venom"] = 11443,
	["leaf"] = 11441,
	["water"] = 11442,
	["thunder"] = 11444,
	["rock"] = 11445,
	["punch"] = 11446,
	["fire"] = 11447,
	["coccon"] = 11448,
	["crystal"] = 11449, -- antiga crystal
	["dark"] = 11450,
	["earth"] = 11451,
	["enigma"] = 11452,
	["heart"] = 11453,
	["ice"] = 11454,
	["metal"] = 12232,
	["ancient"] = 12244,
	["sun"] = 12242,
	["shiny"] = 19203,
	["feather"] = 19202,
}

function isOwnPokeball(cid, pid)
	for _, pokeball in pairs(getPlayerPokeballs(cid)) do
		if pokeball.uid == pid then
			return true
		end
	end
	return false
end

function hasDepotTile(pos)
	return getTileInfo(pos).depot
end

function isDepot(uid)
	return getTileInfo(getThingPos(uid)).depot
end

function hasCapacityForPokeball(cid)
	if isPlayer(cid) then
		return #getPlayerPokeballs(cid) < 6
	end
	return false
end

function sendPokeballToDepot(cid, ball)
	doPlayerSendMailByName(getCreatureName(cid), ball, 1)
end

function getStepDelay(cid)
	return math.ceil(((1000 * getItemInfo(getTileInfo(getThingPosition(cid)).itemid).speed) / getCreatureSpeed(cid)) * 1.5)
end

function getPositionsBetween(fromPos, toPos)
	local positions = {}
	local min, max = math.min, math.max
	for z = min(fromPos.z, toPos.z), max(fromPos.z, toPos.z) do
		for x = min(fromPos.x, toPos.x), max(fromPos.x, toPos.x) do
			for y = min(fromPos.y, toPos.y), max(fromPos.y, toPos.y) do
				table.insert(positions, {x = x, y = y, z = z})
			end				
		end		
	end
	return positions
end

-- ((1000 * groundSpeed) / creatureSpeed) * 1.5

--[[function needStone(pokemon, boost)

local pokeB = pokeboost[doCorrectString(pokemon)]

	if pokeB then
		if boost <= 5 then 
			return pokeB.b5
		elseif boost <= 7 then 
			return pokeB.b7
		elseif boost <= 12 then 
			return pokeB.b12
		elseif boost <= 15 then 
			return pokeB.b15
		elseif boost <= 20 then
			return pokeB.b20
		elseif boost <= 25 then 
			return pokeB.b25
		elseif boost <= 28 then
			return pokeB.b28
		elseif boost <= 30 then 
			return pokeB.b30
		elseif boost <= 35 then 
			return pokeB.b35
		elseif boost <= 38 then 
			return pokeB.b38
		elseif boost <= 40 then 
			return pokeB.b40
		elseif boost <= 45 then 
			return pokeB.b45
		elseif boost <= 48 then
			return pokeB.b48
		else
			return pokeB.b50 
		end
	end
	
end
]]--

function needStone(boost)
	if boost <= 3 then -- 4
		return 1
	elseif boost <= 7 then -- 8
		return 2
	elseif boost <= 12 then 
		return 3
	elseif boost <= 15 then -- 16
		return 4
	elseif boost <= 20 then
		return 5
	elseif boost <= 25 then -- 24
		return 6
	elseif boost <= 28 then
		return 7
	elseif boost <= 30 then -- 32
		return 8
	elseif boost <= 35 then -- 36
		return 9
	elseif boost <= 38 then -- 40
		return 10
	elseif boost <= 40 then -- 44, 42
		return 11
	elseif boost <= 45 then -- 48
		return 12
	elseif boost <= 48 then -- 48
		return 13	
	else
		return 14 
	end
end

function doReloadPokemon(cid)
	if isPlayer(cid) then
		local pos = getCreaturePosition(getCreatureSummons(cid)[1])
		local direction = getCreatureLookDirection(getCreatureSummons(cid)[1])
		doRemoveCreature(getCreatureSummons(cid)[1])
		doGoPokemon(cid, getPlayerSlotItem(cid, 8), false)
		local pk = getCreatureSummons(cid)[1]
		doTeleportThing(pk, pos, false)
		doCreatureSetLookDirection(pk, direction)
	end
end

function doReloadOTClient(cid)
	if isPlayer(cid) then
		doSendLifePokeToOTC(cid)
		doUpdateMoves(cid)
	end
end

function totalStonesPerBoost(boost)
	local count = 0
	local total = 1
	local final = 0
	for a = 1, 50 do
		if count == 4 then
			count = 0
			total = total + 1
		else
			count = count + 1
		end
		final = final + total
	end
	return final
end

function pokePrice(pokeName)
	local poke = doCorrectString(pokeName)				
	if not pokePrice[poke].price then
		return pokeChance[poke].media
	end	
	return pokePrice[poke].price
end

function getPokeballPrice(ball)
	if isPokeball(ball.itemid) then
		local boost = getItemAttribute(ball.uid, "boost") or 0
		local poke = getItemAttribute(ball.uid, "poke")
		local boostHeld = 0
		local heldx = getItemAttribute(ball.uid, "xHeldItem")
		local heldName, heldTier = string.explode((heldx or ""), "|")[1], string.explode((heldx or ""), "|")[2]
		if heldName == "X-Boost" then
			boostHeld = heldBoost[tonumber(heldTier)]
		end
		if pokeChance[poke] then
			local boostValue = 0
			if (boost - boostHeld) > 0 then
				local stoneId = boostStonePray[poke][1]
				local stoneName = getItemNameById(stoneId)
				local stonePrice = priceItemsList[stoneName].price or 5000
				--boostValue = needStone(poke, boost - boostHeld) * stonePrice	
				boostValue = needStone(boost - boostHeld) * stonePrice						
			end
		
			if pokePrice[poke] then
				valor = pokePrice[poke].price
			else
				valor = pokeChance[poke].media * 150
			end
			
			return valor * 1.3 + boostValue
		end
	end
	return -1
end


boostStonePray = {
	["Bulbasaur"] = {leaf, boostStone},
	["Tropius"] = {leaf, boostStone},
	["Ivysaur"] = {leaf, boostStone},
	["Venusaur"] = {leaf, boostStone},
	["Charmander"] = {fire, boostStone},
	["Charmeleon"] = {fire, boostStone},
	["Charizard"] = {fire, boostStone},
	["Squirtle"] = {water, boostStone},
	["Wartortle"] = {water, boostStone},
	["Blastoise"] = {water, boostStone},
	["Caterpie"] = {coccon, boostStone},
	["Metapod"] = {coccon, boostStone},
	["Butterfree"] = {coccon, boostStone},
	["Weedle"] = {coccon, boostStone},
	["Kakuna"] = {coccon, boostStone},
	["Beedrill"] = {coccon, boostStone},
	["Pidgey"] = {heart, boostStone},
	["Pidgeotto"] = {heart, boostStone},
	["Pidgeot"] = {heart, boostStone},
	["Rattata"] = {heart, boostStone},
	["Raticate"] = {heart, boostStone},
	["Spearow"] = {heart, boostStone},
	["Fearow"] = {heart, boostStone},
	["Ekans"] = {venom, boostStone},
	["Arbok"] = {venom, boostStone},
	["Pikachu"] = {thunder, boostStone},
	["Raichu"] = {thunder, boostStone},
	["Sandshrew"] = {earth, boostStone},
	["Sandslash"] = {earth, boostStone},
	["Nidoran Female"] = {venom, boostStone},
	["Nidorina"] = {venom, boostStone},
	["Nidoqueen"] = {venom, earth, boostStone},
	["Nidoran Male"] = {venom, boostStone},
	["Nidorino"] = {venom, boostStone},
	["Nidoking"] = {venom, earth, boostStone},
	["Clefairy"] = {heart, boostStone},
	["Clefable"] = {heart, boostStone},
	["Vulpix"] = {fire, boostStone},
	["Ninetales"] = {fire, boostStone},
	["Jigglypuff"] = {heart, boostStone},
	["Wigglytuff"] = {heart, boostStone},
	["Zubat"] = {venom, boostStone},
	["Golbat"] = {venom, boostStone},
	["Oddish"] = {leaf, venom, boostStone},
	["Gloom"] = {leaf, venom, boostStone},
	["Vileplume"] = {leaf, venom, boostStone},
	["Paras"] = {coccon, leaf, boostStone},
	["Parasect"] = {coccon, leaf, boostStone},
	["Venonat"] = {coccon, venom, boostStone},
	["Venomoth"] = {coccon, venom, boostStone},
	["Diglett"] = {earth, boostStone},
	["Dugtrio"] = {earth, boostStone},
	["Meowth"] = {heart, boostStone},
	["Persian"] = {heart, boostStone},
	["Psyduck"] = {water, boostStone},
	["Golduck"] = {water, enigma, boostStone},
	["Mankey"] = {punch, boostStone},
	["Primeape"] = {punch, boostStone},
	["Growlithe"] = {fire, boostStone},
	["Arcanine"] = {fire, boostStone},
	["Poliwag"] = {water, boostStone},
	["Poliwhirl"] = {water, boostStone},
	["Poliwrath"] = {water, punch, boostStone},
	["Abra"] = {enigma, boostStone},
	["Kadabra"] = {enigma, boostStone},
	["Alakazam"] = {enigma, boostStone},
	["Machop"] = {punch, boostStone},
	["Machoke"] = {punch, boostStone},
	["Machamp"] = {punch, boostStone},
	["Bellsprout"] = {leaf, venom, boostStone},
	["Weepinbell"] = {leaf, venom, boostStone},
	["Victreebel"] = {leaf, venom, boostStone},
	["Tentacool"] = {water, venom, boostStone},
	["Tentacruel"] = {water, venom, boostStone},
	["Geodude"] = {earth, rock, boostStone},
	["Graveler"] = {earth, rock, boostStone},
	["Golem"] = {earth, rock, boostStone},
	["Ponyta"] = {fire, boostStone},
	["Rapidash"] = {fire, boostStone},
	["Slowpoke"] = {water, enigma, boostStone},
	["Slowbro"] = {water, enigma, boostStone},
	["Magnemite"] = {thunder, boostStone},
	["Magneton"] = {thunder, boostStone},
	["Magnezone"] = {thunder, boostStone},
	["Milotic"] = {water, boostStone},
	["Farfetch'd"] = {heart, boostStone},
	["Doduo"] = {heart, boostStone},
	["Dodrio"] = {heart, boostStone},
	["Seel"] = {water, ice, boostStone},
	["Dewgong"] = {water, ice, boostStone},
	["Grimer"] = {venom, boostStone},
	["Muk"] = {venom, boostStone},
	["Shellder"] = {water, ice, boostStone},
	["Cloyster"] = {water, ice, boostStone},
	["Gastly"] = {dark, boostStone},
	["Haunter"] = {dark, boostStone},
	["Gengar"] = {dark, boostStone},
	["Onix"] = {rock, earth, boostStone},
	["Drowzee"] = {enigma, boostStone},
	["Hypno"] = {enigma, boostStone},
	["Krabby"] = {water, boostStone},
	["Kingler"] = {water, boostStone},
	["Voltorb"] = {thunder, boostStone},
	["Electrode"] = {thunder, boostStone},
	["Exeggcute"] = {enigma, leaf, boostStone},
	["Exeggutor"] = {enigma, leaf, boostStone},
	["Cubone"] = {earth, boostStone},
	["Marowak"] = {earth, boostStone},
	["Hitmonlee"] = {punch, boostStone},
	["Hitmonchan"] = {punch, boostStone},
	["Lickitung"] = {heart, boostStone},
	["Koffing"] = {venom, boostStone},
	["Weezing"] = {venom, boostStone},
	["Rhyhorn"] = {earth, rock, boostStone},
	["Rhydon"] = {earth, rock, boostStone},
	["Chansey"] = {heart, boostStone},
	["Tangela"] = {leaf, boostStone},
	["Kangaskhan"] = {heart, boostStone},
	["Horsea"] = {water, boostStone},
	["Seadra"] = {water, boostStone},
	["Goldeen"] = {water, boostStone},
	["Seaking"] = {water, boostStone},
	["Staryu"] = {water, boostStone},
	["Starmie"] = {water, boostStone},
	["Shiny Mantine"] = {water, boostStone},
	["Mr. Mime"] = {enigma, boostStone},
	["Scyther"] = {coccon, boostStone},
	["Jynx"] = {enigma, ice, boostStone},
	["Electabuzz"] = {thunder, boostStone},
	["Electivire"] = {thunder, boostStone},
	["Shiny Electivire"] = {thunder, boostStone},
	["Magmar"] = {fire, boostStone},
	["Magmortar"] = {fire, boostStone},
	["Shiny Magmortar"] = {fire, boostStone},
	["Pinsir"] = {coccon, boostStone},
	["Tauros"] = {heart, boostStone},
	["Magikarp"] = {water, boostStone},
	["Gyarados"] = {water, crystal, boostStone},
	["Lapras"] = {water, ice, boostStone},
	["Ditto"] = {heart, boostStone},
	["Shiny Ditto"] = {heart, boostStone},
	["Eevee"] = {heart, boostStone},
	["Vaporeon"] = {water, boostStone},
	["Jolteon"] = {thunder, boostStone},
	["Flareon"] = {fire, boostStone},
	["Espeon"] = {enigma, boostStone},
	["Umbreon"] = {dark, boostStone},
	["Absol"] = {dark, boostStone},
	["Wailord"] = {water, boostStone},
	["Porygon"] = {heart, enigma, boostStone},
	["Omanyte"] = {rock, water, boostStone},
	["Omastar"] = {rock, water, boostStone},
	["Kabuto"] = {rock, water, boostStone},
	["Kabutops"] = {rock, water, boostStone},
	["Aerodactyl"] = {rock, boostStone},
	["Snorlax"] = {heart, boostStone},
	["Articuno"] = {ice, boostStone},
	["Zapdos"] = {thunder, boostStone},
	["Moltres"] = {fire, boostStone},
	["Dratini"] = {crystal, boostStone},
	["Dragonair"] = {crystal, boostStone},
	["Dragonite"] = {crystal, boostStone},
	["Salamence"] = {crystal, boostStone},
	["Shiny Salamence"] = {crystal, boostStone},
	["Mewtwo"] = {enigma, boostStone},
	["Mew"] = {enigma, boostStone},
	
	["Shiny Typhlosion"] = {fire, boostStone},
	["Shiny Bulbasaur"] = {leaf, boostStone},
	["Shiny Ivysaur"] = {leaf, boostStone},
	["Shiny Venusaur"] = {leaf, boostStone},
	["Shiny Charmander"] = {fire, boostStone},
	["Shiny Charmeleon"] = {fire, boostStone},
	["Shiny Charizard"] = {fire, boostStone},
	["Shiny Squirtle"] = {water, boostStone},
	["Shiny Wartortle"] = {water, boostStone},
	["Shiny Blastoise"] = {water, boostStone},
	["Shiny Caterpie"] = {coccon, boostStone},
	["Shiny Metapod"] = {coccon, boostStone},
	["Shiny Butterfree"] = {coccon, boostStone},
	["Shiny Weedle"] = {coccon, boostStone},
	["Shiny Kakuna"] = {coccon, boostStone},
	["Shiny Beedrill"] = {coccon, boostStone},
	["Shiny Pidgey"] = {heart, boostStone},
	["Shiny Pidgeotto"] = {heart, boostStone},
	["Shiny Pidgeot"] = {heart, boostStone},
	["Shiny Rattata"] = {heart, boostStone},
	["Shiny Raticate"] = {heart, boostStone},
	["Shiny Spearow"] = {heart, boostStone},
	["Shiny Fearow"] = {heart, boostStone},
	["Shiny Ekans"] = {venom, boostStone},
	["Shiny Arbok"] = {venom, boostStone},
	["Shiny Pikachu"] = {thunder, boostStone},
	["Shiny Raichu"] = {thunder, boostStone},
	["Shiny Sandshrew"] = {earth, boostStone},
	["Shiny Sandslash"] = {earth, boostStone},
	["Shiny Nidoran Female"] = {venom, boostStone},
	["Shiny Nidorina"] = {venom, boostStone},
	["Shiny Nidoqueen"] = {venom, earth, boostStone},
	["Shiny Nidoran Male"] = {venom, boostStone},
	["Shiny Nidorino"] = {venom, boostStone},
	["Shiny Nidoking"] = {venom, earth, boostStone},
	["Shiny Clefairy"] = {heart, boostStone},
	["Shiny Clefable"] = {heart, boostStone},
	["Shiny Vulpix"] = {fire, boostStone},
	["Shiny Ninetales"] = {fire, boostStone},
	["Shiny Jigglypuff"] = {heart, boostStone},
	["Shiny Wigglytuff"] = {heart, boostStone},
	["Shiny Zubat"] = {venom, boostStone},
	["Shiny Golbat"] = {venom, boostStone},
	["Shiny Oddish"] = {leaf, venom, boostStone},
	["Shiny Gloom"] = {leaf, venom, boostStone},
	["Shiny Vileplume"] = {leaf, venom, boostStone},
	["Shiny Paras"] = {coccon, leaf, boostStone},
	["Shiny Parasect"] = {coccon, leaf, boostStone},
	["Shiny Venonat"] = {coccon, venom, boostStone},
	["Shiny Venomoth"] = {coccon, venom, boostStone},
	["Shiny Diglett"] = {earth, boostStone},
	["Shiny Dugtrio"] = {earth, boostStone},
	["Shiny Meowth"] = {heart, boostStone},
	["Shiny Persian"] = {heart, boostStone},
	["Shiny Psyduck"] = {water, boostStone},
	["Shiny Golduck"] = {water, enigma, boostStone},
	["Shiny Mankey"] = {punch, boostStone},
	["Shiny Primeape"] = {punch, boostStone},
	["Shiny Growlithe"] = {fire, boostStone},
	["Shiny Arcanine"] = {fire, boostStone},
	["Shiny Poliwag"] = {water, boostStone},
	["Shiny Poliwhirl"] = {water, boostStone},
	["Shiny Poliwrath"] = {water, punch, boostStone},
	["Shiny Abra"] = {enigma, boostStone},
	["Shiny Kadabra"] = {enigma, boostStone},
	["Shiny Alakazam"] = {enigma, boostStone},
	["Shiny Machop"] = {punch, boostStone},
	["Shiny Machoke"] = {punch, boostStone},
	["Shiny Machamp"] = {punch, boostStone},
	["Shiny Bellsprout"] = {leaf, venom, boostStone},
	["Shiny Weepinbell"] = {leaf, venom, boostStone},
	["Shiny Victreebel"] = {leaf, venom, boostStone},
	["Shiny Tentacool"] = {water, venom, boostStone},
	["Shiny Tentacruel"] = {water, venom, boostStone},
	["Shiny Geodude"] = {earth, rock, boostStone},
	["Shiny Graveler"] = {earth, rock, boostStone},
	["Shiny Golem"] = {rock, boostStone},
	["Shiny Ponyta"] = {fire, boostStone},
	["Shiny Rapidash"] = {fire, boostStone},
	["Shiny Slowpoke"] = {water, enigma, boostStone},
	["Shiny Slowbro"] = {water, enigma, boostStone},
	["Shiny Magnemite"] = {thunder, boostStone},
	["Shiny Magneton"] = {thunder, boostStone},
	["Shiny Farfetch'd"] = {heart, boostStone},
	["Shiny Doduo"] = {heart, boostStone},
	["Shiny Dodrio"] = {heart, boostStone},
	["Shiny Seel"] = {water, ice, boostStone},
	["Shiny Dewgong"] = {water, ice, boostStone},
	["Shiny Grimer"] = {venom, boostStone},
	["Shiny Muk"] = {venom, boostStone},
	["Shiny Shellder"] = {water, ice, boostStone},
	["Shiny Cloyster"] = {water, ice, boostStone},
	["Shiny Gastly"] = {dark, boostStone},
	["Shiny Haunter"] = {dark, boostStone},
	["Shiny Gengar"] = {dark, boostStone},
	["Shiny Onix"] = {rock, earth, boostStone},
	["Shiny Drowzee"] = {enigma, boostStone},
	["Shiny Hypno"] = {enigma, boostStone},
	["Shiny Krabby"] = {water, boostStone},
	["Shiny Kingler"] = {water, boostStone},
	["Shiny Voltorb"] = {thunder, boostStone},
	["Shiny Electrode"] = {thunder, boostStone},
	["Shiny Exeggcute"] = {enigma, leaf, boostStone},
	["Shiny Exeggutor"] = {enigma, leaf, boostStone},
	["Shiny Cubone"] = {earth, boostStone},
	["Shiny Marowak"] = {earth, boostStone},
	["Shiny Hitmonlee"] = {punch, boostStone},
	["Shiny Hitmonchan"] = {punch, boostStone},
	["Shiny Hitmontop"] = {punch, boostStone},
	["Shiny Lickitung"] = {heart, boostStone},
	["Shiny Koffing"] = {venom, boostStone},
	["Shiny Weezing"] = {venom, boostStone},
	["Shiny Rhyhorn"] = {earth, rock, boostStone},
	["Shiny Rhydon"] = {earth, rock, boostStone},
	["Shiny Chansey"] = {heart, boostStone},
	["Shiny Tangela"] = {leaf, boostStone},
	["Shiny Kangaskhan"] = {heart, boostStone},
	["Shiny Horsea"] = {water, boostStone},
	["Shiny Seadra"] = {water, boostStone},
	["Shiny Goldeen"] = {water, boostStone},
	["Shiny Seaking"] = {water, boostStone},
	["Shiny Staryu"] = {water, boostStone},
	["Shiny Starmie"] = {water, boostStone},
	["Shiny Mr. Mime"] = {enigma, boostStone},
	["Shiny Scyther"] = {coccon, boostStone},
	["Shiny Jynx"] = {enigma, ice, boostStone},
	["Shiny Electabuzz"] = {thunder, boostStone},
	["Shiny Magmar"] = {fire, boostStone},
	["Shiny Pinsir"] = {coccon, boostStone},
	["Shiny Tauros"] = {heart, boostStone},
	["Shiny Magikarp"] = {water, boostStone},
	["Shiny Gyarados"] = {water, crystal, boostStone},
	["Shiny Lapras"] = {water, ice, boostStone},
	["Shiny Ditto"] = {heart, boostStone},
	["Shiny Eevee"] = {heart, boostStone},
	["Shiny Vaporeon"] = {water, boostStone},
	["Shiny Jolteon"] = {thunder, boostStone},
	["Shiny Flareon"] = {fire, boostStone},
	["Shiny Porygon"] = {heart, enigma, boostStone},
	["Shiny Omanyte"] = {rock, water, boostStone},
	["Shiny Omastar"] = {rock, water, boostStone},
	["Shiny Kabuto"] = {rock, water, boostStone},
	["Shiny Kabutops"] = {rock, water, boostStone},
	["Shiny Aerodactyl"] = {rock, boostStone},
	["Shiny Snorlax"] = {heart, boostStone},
	["Shiny Articuno"] = {ice, boostStone},
	["Shiny Zapdos"] = {thunder, boostStone},
	["Shiny Moltres"] = {fire, boostStone},
	["Shiny Dratini"] = {crystal, boostStone},
	["Shiny Dragonair"] = {crystal, boostStone},
	["Shiny Dragonite"] = {crystal, boostStone},
	["Shiny Mewtwo"] = {enigma, boostStone},
	["Shiny Mew"] = {enigma, boostStone},
	["Chikorita"] = {leaf, boostStone},
	["Bayleef"] = {leaf, boostStone},
	["Meganium"] = {leaf, boostStone},
	["Cyndaquil"] = {fire, boostStone},
	["Quilava"] = {fire, boostStone},
	["Typhlosion"] = {fire, boostStone},
	["Totodile"] = {water, boostStone},
	["Croconaw"] = {water, boostStone},
	["Feraligatr"] = {water, boostStone},
	["Sentret"] = {heart, boostStone},
	["Furret"] = {heart, boostStone},
	["Hoothoot"] = {heart, enigma, boostStone},
	["Noctowl"] = {heart, enigma, boostStone},
	["Ledyba"] = {coccon, boostStone},
	["Ledian"] = {coccon, boostStone},
	["Spinarak"] = {coccon, venom, boostStone},
	["Ariados"] = {coccon, venom, boostStone},
	["Crobat"] = {venom, boostStone},
	["Chinchou"] = {water, thunder, boostStone},
	["Lanturn"] = {water, thunder, boostStone},
	["Pichu"] = {thunder, boostStone},
	["Cleffa"] = {heart, boostStone},
	["Iglybuff"] = {venom, boostStone},
	["Natu"] = {enigma, boostStone},
	["Xatu"] = {enigma, boostStone},
	["Mareep"] = {thunder, boostStone},
	["Flaaffy"] = {thunder, boostStone},
	["Ampharos"] = {thunder, boostStone},
	["Bellossom"] = {leaf, boostStone},
	["Marill"] = {water, boostStone},
	["Azulmarill"] = {water, boostStone},
	["Sudowoodo"] = {rock, earth, boostStone},
	["Politoed"] = {water, earth, boostStone},
	["Hoppip"] = {leaf, boostStone},
	["Skiploom"] = {leaf, boostStone},
	["Jumpluff"] = {leaf, boostStone},
	["Aipom"] = {heart, boostStone},
	["Sunkern"] = {leaf, boostStone},
	["Sunflora"] = {leaf, boostStone},
	["Yanma"] = {venom, coccon, boostStone},
	["Wooper"] = {water, boostStone},
	["Quagsire"] = {water, earth, boostStone},
	["Murkrow"] = {dark, boostStone},
	["Slowking"] = {enigma, boostStone},
	["Misdreavus"] = {dark, boostStone},
	["Wobbuffet"] = {enigma, boostStone},
	["Girafarig"] = {enigma, boostStone},
	["Pineco"] = {coccon, boostStone},
	["Forretress"] = {coccon, boostStone},
	["Gligar"] = {dark, heart, boostStone},
	["Steelix"] = {metal, boostStone},
	["Snubbull"] = {heart, boostStone},
	["Granbull"] = {heart, boostStone},
	["Qwilfish"] = {water, boostStone},
	["Shuckle"] = {earth, boostStone},
	["Heracross"] = {coccon, boostStone},
	["Teddiursa"] = {heart, boostStone},
	["Ursaring"] = {heart, boostStone},
	["Slugma"] = {fire, boostStone},
	["Magcargo"] = {fire, boostStone},
	["Swinub"] = {ice, earth, boostStone},
	["Piloswine"] = {ice, earth, boostStone},
	["Corsola"] = {water, boostStone},
	["Remoraid"] = {water, boostStone},
	["Octillery"] = {water, boostStone},
	["Delibird"] = {ice, heart, boostStone},
	["Mantine"] = {water, boostStone},
	["Skarmory"] = {metal, boostStone},
	["Houndour"] = {fire, dark, boostStone},
	["Houndoom"] = {fire, dark, boostStone},
	["Kingdra"] = {water, crystal, boostStone},
	["Phanpy"] = {earth, boostStone},
	["Donphan"] = {earth, boostStone},
	["porygon2"] = {enigma, boostStone},
	["Stantler"] = {heart, boostStone},
	["Smeargle"] = {heart, boostStone},
	["Tyrogue"] = {punch, boostStone},
	["Hitmontop"] = {punch, boostStone},
	["Smoochum"] = {ice, enigma, boostStone},
	["Elekid"] = {thunder, boostStone},
	["Magby"] = {fire, boostStone},
	["Miltank"] = {heart, boostStone},
	["Blissey"] = {heart, boostStone},
	["Scizor"] = {metal, boostStone},
	["Beldum"] = {metal, boostStone},
	["Metang"] = {metal, boostStone},
	["Metagross"] = {metal, boostStone},
	["Raikou"] = {thunder, boostStone},
	["Entei"] = {fire, boostStone},
	["Suicune"] = {water, boostStone},
	["Larvitar"] = {earth, dark, boostStone},
	["Pupitar"] = {earth, dark, boostStone},
	["Tyranitar"] = {rock, dark, boostStone},
	["Lugia"] = {enigma, water, boostStone},
	["Ho-oh"] = {enigma, fire, boostStone},
	["Celebi"] = {leaf, enigma, boostStone},
	
	["Shiny Chikorita"] = {leaf, boostStone},
	["Shiny Bayleef"] = {leaf, boostStone},
	["Shiny Meganium"] = {leaf, boostStone},
	["Shiny Cyndaquil"] = {fire, boostStone},
	["Shiny Quilava"] = {fire, boostStone},
	["Shiny Typhlosion"] = {fire, boostStone},
	["Shiny Totodile"] = {water, boostStone},
	["Shiny Croconaw"] = {water, boostStone},
	["Shiny Feraligatr"] = {water, boostStone},
	["Shiny Sentret"] = {heart, boostStone},
	["Shiny Furret"] = {heart, boostStone},
	["Shiny Hoothoot"] = {heart, enigma, boostStone},
	["Shiny Noctowl"] = {heart, enigma, boostStone},
	["Shiny Ledyba"] = {coccon, boostStone},
	["Shiny Ledian"] = {coccon, boostStone},
	["Shiny Spinarak"] = {coccon, venom, boostStone},
	["Shiny Ariados"] = {coccon, venom, boostStone},
	["Shiny Crobat"] = {venom, boostStone},
	["Shiny Chinchou"] = {water, thunder, boostStone},
	["Shiny Lanturn"] = {water, thunder, boostStone},
	["Shiny Pichu"] = {thunder, boostStone},
	["Shiny Cleffa"] = {heart, boostStone},
	["Shiny Iglybuff"] = {venom, boostStone},
	["Shiny Natu"] = {enigma, boostStone},
	["Shiny Xatu"] = {enigma, boostStone},
	["Shiny Mareep"] = {thunder, boostStone},
	["Shiny Flaaffy"] = {thunder, boostStone},
	["Shiny Ampharos"] = {thunder, boostStone},
	["Shiny Bellossom"] = {leaf, boostStone},
	["Shiny Marill"] = {water, boostStone},
	["Shiny Azulmarill"] = {water, boostStone},
	["Shiny Sudowoodo"] = {rock, earth, boostStone},
	["Shiny Politoed"] = {water, earth, boostStone},
	["Shiny Hoppip"] = {leaf, boostStone},
	["Shiny Skiploom"] = {leaf, boostStone},
	["Shiny Jumpluff"] = {leaf, boostStone},
	["Shiny Aipom"] = {heart, boostStone},
	["Shiny Sunkern"] = {leaf, boostStone},
	["Shiny Sunflora"] = {leaf, boostStone},
	["Shiny Yanma"] = {venom, coccon, boostStone},
	["Shiny Wooper"] = {water, boostStone},
	["Shiny Quagsire"] = {water, earth, boostStone},
	["Shiny Murkrow"] = {dark, boostStone},
	["Shiny Slowking"] = {enigma, boostStone},
	["Shiny Misdreavus"] = {dark, boostStone},
	["Shiny Wobbuffet"] = {enigma, boostStone},
	["Shiny Girafarig"] = {enigma, boostStone},
	["Shiny Umbreon"] = {dark, boostStone},
	["Shiny Espeon"] = {enigma, boostStone},
	["Shiny Pineco"] = {coccon, boostStone},
	["Shiny Forretress"] = {coccon, boostStone},
	["Shiny Gligar"] = {dark, heart, boostStone},
	["Shiny Steelix"] = {metal, boostStone},
	["Shiny Snubbull"] = {heart, boostStone},
	["Shiny Granbull"] = {heart, boostStone},
	["Shiny Qwilfish"] = {water, boostStone},
	["Shiny Shuckle"] = {earth, boostStone},
	["Shiny Heracross"] = {coccon, boostStone},
	["Shiny Teddiursa"] = {heart, boostStone},
	["Shiny Ursaring"] = {heart, boostStone},
	["Shiny Slugma"] = {fire, boostStone},
	["Shiny Magcargo"] = {fire, boostStone},
	["Shiny Swinub"] = {ice, earth, boostStone},
	["Shiny Piloswine"] = {ice, earth, boostStone},
	["Shiny Corsola"] = {water, boostStone},
	["Shiny Remoraid"] = {water, boostStone},
	["Shiny Octillery"] = {water, boostStone},
	["Shiny Delibird"] = {ice, heart, boostStone},
	["Shiny Mantine"] = {water, boostStone},
	["Shiny Skarmory"] = {metal, boostStone},
	["Shiny Houndour"] = {fire, dark, boostStone},
	["Shiny Houndoom"] = {fire, dark, boostStone},
	["Shiny Kingdra"] = {water, crystal, boostStone},
	["Shiny Phanpy"] = {earth, boostStone},
	["Shiny Donphan"] = {earth, boostStone},
	["Shiny Porygon2"] = {enigma, boostStone},
	["Shiny Stantler"] = {heart, boostStone},
	["Shiny Smeargle"] = {heart, boostStone},
	["Shiny Tyrogue"] = {punch, boostStone},
	["Shiny Hitmontop"] = {punch, boostStone},
	["Shiny Smoochum"] = {ice, enigma, boostStone},
	["Shiny Elekid"] = {thunder, boostStone},
	["Shiny Magby"] = {fire, boostStone},
	["Shiny Miltank"] = {heart, boostStone},
	["Shiny Blissey"] = {heart, boostStone},
	["Shiny Scizor"] = {metal, boostStone},
	["Shiny Raikou"] = {thunder, boostStone},
	["Shiny Entei"] = {fire, boostStone},
	["Shiny Suicune"] = {water, boostStone},
	["Shiny Larvitar"] = {earth, dark, boostStone},
	["Shiny Pupitar"] = {earth, dark, boostStone},
	["Shiny Tyranitar"] = {rock, dark, boostStone},
	["Shiny Lugia"] = {enigma, water, boostStone},
	["Shiny Ho-oh"] = {enigma, fire, boostStone},
	["Shiny Celebi"] = {leaf, enigma, boostStone},
}

function convertMoneyValue(value)
	if value < 101 then
		return value * 0.01
	elseif value < 10001 then
		return value / 100
	elseif value < 1000001 then
		return value / 100000 .."k"
	elseif value <= 99999999 then
		return value / 100000  .."k"
	else
		return value / 100000000  .."kk"
	end
end

function convertTime(a)
	
	if(type(tonumber(a)) == "number" and a > 0) then
		if (a <= 3599) then
			local minute = math.floor(a/60)
			local second = a - (60 * minute)
			
			if(second == 0) then
				return ((minute)..((minute > 1) and " minutos" or " minuto"))
			else
				return ((minute ~= 0) and ((minute>1) and minute.." minutos e " or minute.." minuto e ").. ((second>1) and second.." segundos" or second.." segundo") or ((second>1) and second.." segundos" or second.. " segundo"))
			end
		else
			local hour = math.floor(a/3600)
			local minute = math.floor((a - (hour * 3600))/60)
			local second = (a - (3600 * hour) - (minute * 60))
			
			if (minute == 0 and second > 0) then
				return (hour..((hour > 1) and " horas e " or " hora e "))..(second..((second > 1) and " segundos" or " segundo"))
			elseif (second == 0 and minute > 0) then
				return (hour..((hour > 1) and " horas e " or " hora e "))..(minute..((minute > 1) and " minutos" or " minuto"))
			elseif (second == 0 and minute == 0) then
				return (hour..((hour > 1) and " horas" or " hora"))
			end
			return (hour..((hour > 1) and " horas, " or " hora, "))..(minute..((minute > 1) and " minutos e " or " minuto e "))..(second..((second > 1) and " segundos" or " segundo"))
		end
	end
end

function doConcatTable(itemsss, sep1, sep2)
	local str = ""
	if #itemsss > 0 then
		for i = 1, #itemsss do
			if #itemsss > 1 then
				if i ~= #itemsss then
					if i ~= 1 then
						str = str..sep1..itemsss[i]
					else
						str = str..itemsss[i]
					end
				else
					str = str..sep2..itemsss[i]
				end
			else
				str = itemsss[i]
			end
		end
	end
	return str
end

function doSendCancel(cid, msg)
	addEvent(doPlayerSendCancel, 5, cid, msg)
end

function doSurf(cid)
	if not isPlayer(cid) then --alterado v1.9
		return false
	end
	if isSurf(cid) then
		return true
	end
	if getPlayerStorageValue(cid, 75846) >= 1 then return true end --alterado v1.9
	
	if isPlayer(cid) and isWatchingTv(cid) then return false end -- TV
	
	if getCreatureOutfit(cid).lookType == 316 or getCreatureOutfit(cid).lookType == 648 then
		doSendMagicEffect(fromPosition, 136)
	end
	
	if (getPlayerStorageValue(cid, 63215) >= 1 or isFly(cid)) then
		return false
	end
	
	if isInDuel(cid) then
		return false
	end
	
	if #getCreatureSummons(cid) == 0 and not isSurf(cid) then
		doSendCancel(cid, "You need a pokemon to surf.")
		return false
	end
	
	if isMega(getCreatureSummons(cid)[1]) then
		doSendCancel(cid, "Mega Pokémons can't surf.")
		return false
	end
	
	local pokeName = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")
	local ditto = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "copyName")
	if ditto and ditto ~= "" then
		pokeName = ditto
	end
	if (not isInArray(specialabilities["surf"], pokeName)) then 
		doSendCancel(cid, "This pokemon can't surf.")
		return false
	end
	
	if isSleeping(getCreatureSummons(cid)[1]) then
		doSendCancel(cid, "Você não pode surfar enquanto seu pokémon estiver dormindo!")
		return false
	end
	
	if isInDuel(cid) then
		doSendCancel(cid, "Você não pode surfar enquanto você estiver batalhando.") --alterado v1.6
		return false
	end
	
	if getPlayerStorageValue(cid, 6598754) == 1 or getPlayerStorageValue(cid, 6598755) == 1 then 
		doSendCancel(cid, "You can't do it while in the PVP Zone!") --alterado v1.7
		return false
	end
	--alterado v1.6
	doSetCreatureOutfit(cid, {lookType = surfs[pokeName].lookType + 351}, -1) 
	setPokemonGhost(cid)
	
	doCreatureSay(cid, ""..getPokeName(getCreatureSummons(cid)[1])..", lets surf!", TALKTYPE_ORANGE_1)
	doChangeSpeed(cid, -(getCreatureSpeed(cid)))
	
	local speed = 75 + PlayerSpeed + getSpeed(getCreatureSummons(cid)[1]) * 8
	setPlayerStorageValue(cid, 54844, speed)
	doChangeSpeed(cid, speed)
	
	local hpToDraw = (getCreatureMaxHealth(getCreatureSummons(cid)[1]) - getCreatureHealth(getCreatureSummons(cid)[1]))
	doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "hpToDraw", hpToDraw)
	
	addEvent(setPlayerStorageValue, 100, cid, 63215, 1)
	
	local item = getPlayerSlotItem(cid, 8)
	if getItemAttribute(item.uid, "boost") and getItemAttribute(item.uid, "boost") >= 50 and getPlayerStorageValue(cid, 42368) <= 0 then
		addEvent(sendAuraEffect, 120, cid, auraSyst[getItemAttribute(item.uid, "aura")]) --alterado v1.8
	end
--	if getItemAttribute(item, "premierAura") then
--        addEvent(sendAuraEffect, 120, cid, auraSyst[getItemAttribute(item.uid, "premierAura")])
--	end
	
	doSendPlayerExtendedOpcode(cid, 95, '12//,hide')
	
	doRemoveCreature(getCreatureSummons(cid)[1])
	return true
end

function isWater(itemid)
	if itemid > 0 then
		if isInArray(waterID, itemid) then 
			return true
		--[[elseif isInArray({"shallow water"}, getItemNameById(itemid)) then
			return true]]
		elseif tonumber(id) and id >= 4608 and id <= 4613 then
			return true
		end
	end
	return false
end

function getNewMoveTable(table, n)
if table == nil or not n then return false end

local moves = {table.move1, table.move2, table.move3, table.move4, table.move5, table.move6, table.move7, table.move8, table.move9,
table.move10, table.move11, table.move12}

return moves[n] or false
end

function doGoPokemon(cid, ball, sendEffect)
	if isPlayer(cid) then
		ball = ball and ball or getPlayerSlotItem(cid, 8)
		if isPokeball(ball.itemid) then
	
			if isPokeballOff(ball) then
                doPlayerSendCancel(cid, "This pokemon has fainted!")
                return true				
			end
			
			if ball.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
				doPlayerSendCancel(cid, "You must put your pokeball in the correct place!")
				return true
			end	
			
			if getItemAttribute(ball.uid, "hp") and getItemAttribute(ball.uid, "hp") <= 0 then
				doTransformItem(ball.uid, pokeballs[btype].off)
				doItemSetAttribute(ball.uid, "hp", 0)
				doPlayerSendCancel(cid, "This pokemon is fainted.")			
				return true
			end

			local pokemon = getItemAttribute(ball.uid, "poke")
			
			if not pokes[pokemon] then
				return true
			end
			
			local btype = getPokeballType(ball.itemid) or "pokeball"

			local x = pokes[pokemon]
			local boost = getItemAttribute(ball.uid, "boost") or 0
			
			if not isInArray({"Charmander", "Squirtle", "Bulbasaur"}, pokemon) then
				if getPlayerLevel(cid) < (x.level+boost) then
					doPlayerSendCancel(cid, "You need level "..(x.level+boost).." to use this pokemon.")
					return true
				end
			end
			
			local nick = getItemAttribute(ball.uid, "poke")
			local pokemonRealName = pokemon

			if getItemAttribute(ball.uid, "copyName") then -- ditto system
				pokemon = getItemAttribute(ball.uid, "copyName")
				pokemonRealName = getItemAttribute(ball.uid, "poke")
			end
			
			if getItemAttribute(ball.uid, "nick") then
				nick = getItemAttribute(ball.uid, "nick")
			end
			
			pokeSourceCode = doCreateMonsterNick(cid, pokemon, retireShinyName(nick) and retireSmeargleNumber(nick) and retireCastformName(nick), getThingPos(cid), true)--doSummonMonster(cid, pokemon
	
			if not pokeSourceCode then
				doPlayerSendCancel(cid, "Você não pode chamar seu pokémon aqui!")
				return true
			end	 

			local pk = getCreatureSummons(cid)[1]
			
			--setMoveSummon(cid, true)

			if not isCreature(pk) then 
				return true 
			end
			
			--[[if getItemAttribute(ball.uid, "nick") and getItemAttribute(ball.uid, "nick") ~= "" then
				nick = getItemAttribute(ball.uid, "nick")
				doCreatureSetNick(pk, nick)
			end]]
			
			local pos = getThingPos(cid)
			local positionsAround = {
				[1] = {x = pos.x + 1, y = pos.y, z = pos.z},
				[2] = {x = pos.x - 1, y = pos.y, z = pos.z},
				[3] = {x = pos.x, y = pos.y + 1, z = pos.z},
				[4] = {x = pos.x, y = pos.y - 1, z = pos.z},
				[5] = {x = pos.x + 1, y = pos.y + 1, z = pos.z},
				[6] = {x = pos.x - 1, y = pos.y + 1, z = pos.z},
				[7] = {x = pos.x - 1, y = pos.y - 1, z = pos.z},
				[8] = {x = pos.x + 1, y = pos.y - 1, z = pos.z},
			}		
			
			for i = 1, 8 do
				if isWalkable(positionsAround[i], true, false, false, true) and doComparePositions(pos, getThingPos(cid)) and not isWater(getTileInfo(positionsAround[i]).itemid) then
					pos = positionsAround[i]
				end
			end

			doTeleportThing(pk, pos)

			if isSummon(pk) then --passiva hitmonchan
				if pokemon == "Shiny Hitmonchan" or pokemon == "Hitmonchan" then
					if not getItemAttribute(ball.uid, "hands") then
						doSetItemAttribute(ball.uid, "hands", 0)
					end
					local hands = getItemAttribute(ball.uid, "hands")
					doSetCreatureOutfit(pk, {lookType = hitmonchans[pokemon][hands].out}, -1)
				end
			end
			
			local EFFECTS = {
				["Magmar"] = 35, 
				["Shiny Magmar"] = 35,
				["Shiny Magmortar"] = 35,
				["Shiny Electabuzz"] = 641,
				["Shiny Electivire"] = 641,
				["Magmortar"] = 35,
				["Electivire"] = 48,	
				["Jynx"] = 17, --alterado v1.5
				["Shiny Jynx"] = 17, 
				["Piloswine"] = 205, --alterado v1.8
				["Swinub"] = 205, 
			}

			if EFFECTS[getCreatureName(pk)] then -- movement magmar, jynx
				markPosEff(pk, getThingPos(pk))
				sendMovementEffect(pk, EFFECTS[getCreatureName(pk)], getThingPos(pk)) 
			end
			
			doCreatureSetLookDir(pk, 2)
			setPlayerStorageValue(cid, 543231, 2 + os.time()) 
			
			adjustStatus(pk, ball.uid, true, true, true)
			doRegenerateWithY(getCreatureMaster(pk), pk)
			doCureWithY(getCreatureMaster(pk), pk)
			doTransformItem(ball.uid, pokeballs[btype].use)
			setPokemonGhost(pk)
			
			if getItemAttribute(ball.uid, "addon") then
				doSetCreatureOutfit(pk, {lookType = PokeAddons[getCreatureName(pk)][getItemAttribute(ball.uid, "addon")].looktype}, -1)
			end

			if getItemAttribute(ball.uid, "aura") == "particle" then
				doCreatureSetSkullType(pk, math.random(10, 20))
			end			
			
			shColor = math.random(0, 132)
			shColor2 = math.random(0, 132)
			if isInArray({"shiny ditto"}, pokemon) then 
				doSetCreatureOutfit(pk, {lookType = getCreatureOutfit(pk).lookType, lookBody = shColor2, lookLegs = shColor}, -1)
			end
			
			doSendLifePokeToOTC(cid)
			--doUpdateCooldowns(cid)
			--doUpdateMoves(cid)
			
			if sendEffect then
				
				local effect = pokeballs[btype].effect
				if not effect then
					effect = 21
				end
				
				local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", (isNicked and nick or retireShinyName(pokemon)))
				doCreatureSay(cid, mgo, TALKTYPE_ORANGE_1)
				doSendMagicEffect(getCreaturePosition(pk), effect)
				doSendPlayerExtendedOpcode(cid, 95, '12//,show')
				doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_BATTLE_POKEMON, tostring(pk))
			end

			if getCreatureName(pk):find("Smeargle") then
				local id = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "SmeargleID")
				setPlayerStorageValue(pk, storages.SmeargleID, "Smeargle " .. id) 
			end
		end
	end
end