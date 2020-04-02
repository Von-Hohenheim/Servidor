function onUse(cid, item, fromPosition, itemEx, toPosition)

local config = {--
[2309] = {check = 100, checkarea = {fromx = 1215, fromy = 359, fromz = 9, tox = 1265, toy = 393, toz= 9}, tele = {x = 1235, y = 375, z = 9}, monster = "Big Porygon", storage = 0},
--
[2310] = {check = 6, checkarea = {fromx = 1948, fromy = 44, fromz = 14, tox = 2152, toy = 270, toz= 14}, tele = {x = 2030, y = 196, z = 14}, monster = "Shiny Salamence", storage = 789000},
[2311] = {check = 6, checkarea = {fromx = 2169, fromy = 55, fromz = 14, tox = 2369, toy = 266, toz= 14}, tele = {x = 2247, y = 192, z = 14}, monster = "Shiny Salamence", storage = 789001},
[2312] = {check = 6, checkarea = {fromx = 2383, fromy = 53, fromz = 14, tox = 2590, toy = 276, toz= 14}, tele = {x = 2468, y = 202, z = 14}, monster = "Shiny Salamence", storage = 789002},
[2313] = {check = 6, checkarea = {fromx = 2616, fromy = 42, fromz = 14, tox = 2840, toy = 260, toz= 14}, tele = {x = 2695, y = 179, z = 14}, monster = "Shiny Salamence", storage = 789003},
-- Tower 2
[2314] = {check = 6, checkarea = {fromx = 1926, fromy = 288, fromz = 14, tox = 2143, toy = 500, toz= 14}, tele = {x = 2021, y = 426, z = 14}, monster = "Shiny Magmortar", storage = 789004},
[2315] = {check = 6, checkarea = {fromx = 2158, fromy = 286, fromz = 14, tox = 2360, toy = 496, toz= 14}, tele = {x = 2238, y = 422, z = 14}, monster = "Shiny Magmortar", storage = 789005},
[2316] = {check = 6, checkarea = {fromx = 2382, fromy = 277, fromz = 14, tox = 2581, toy = 506, toz= 14}, tele = {x = 2459, y = 432, z = 14}, monster = "Shiny Magmortar", storage = 789006},
[2317] = {check = 6, checkarea = {fromx = 2605, fromy = 269, fromz = 14, tox = 2824, toy = 481, toz= 14}, tele = {x = 2686, y = 409, z = 14}, monster = "Shiny Magmortar", storage = 789007},
-- Tower 3
[2318] = {check = 6, checkarea = {fromx = 1915, fromy = 501, fromz = 14, tox = 2144, toy = 734, toz= 14}, tele = {x = 2014, y = 658, z = 14}, monster = "Shiny Electivire", storage = 789008},
[2319] = {check = 6, checkarea = {fromx = 2156, fromy = 491, fromz = 14, tox = 2361, toy = 734, toz= 14}, tele = {x = 2231, y = 654, z = 14}, monster = "Shiny Electivire", storage = 789009},
[2320] = {check = 6, checkarea = {fromx = 2371, fromy = 504, fromz = 14, tox = 2582, toy = 747, toz= 14}, tele = {x = 2452, y = 664, z = 14}, monster = "Shiny Electivire", storage = 789010},
[2321] = {check = 6, checkarea = {fromx = 2600, fromy = 479, fromz = 14, tox = 2820, toy = 725, toz= 14}, tele = {x = 2679, y = 641, z = 14}, monster = "Shiny Electivire", storage = 789011},
-- Tower 4
[2322] = {check = 6, checkarea = {fromx = 1883, fromy = 730, fromz = 14, tox = 2097, toy = 1197, toz= 14}, tele = {x = 1980, y = 892, z = 14}, monster = "Shiny Scizor", storage = 789012},
[2323] = {check = 6, checkarea = {fromx = 2128, fromy = 740, fromz = 14, tox = 2323, toy = 1203, toz= 14}, tele = {x = 2197, y = 888, z = 14}, monster = "Shiny Scizor", storage = 789013},
[2324] = {check = 6, checkarea = {fromx = 2336, fromy = 747, fromz = 14, tox = 2549, toy = 1200, toz= 14}, tele = {x = 2418, y = 898, z = 14}, monster = "Shiny Scizor", storage = 789014},
[2325] = {check = 6, checkarea = {fromx = 2554, fromy = 727, fromz = 14, tox = 2775, toy = 1192, toz= 14}, tele = {x = 2645, y = 875, z = 14}, monster = "Shiny Scizor", storage = 789015},
}

local cfg = config[item.actionid]

	if not cfg then return true end

		if #getMonsterInArea(cfg.checkarea) <= cfg.check then -- checarárea	
			
			if item.actionid == 2309 then
				local upper = {x = 1215, y = 359, z = 9}
				local lower = {x = 1261, y = 394, z = 9}
				creatureInSurvival(upper, lower, true, true)
			end
			
			doTeleportThing(cid, cfg.tele) -- teleportar
			monsters = doCreateMonster(cid, cfg.monster, cfg.tele, false)
			setPlayerStorageValue(monsters, cfg.storage, 1)
		else
			doPlayerSendTextMessage(cid, 20, "[Tower]: Ainda falta "..(#getMonsterInArea(cfg.checkarea)-6).." pokémon's para poder acessar a sala do Boss.")
		end
	
	return true
end