local focuses = {}
local function isFocused(cid)
	for i, v in pairs(focuses) do
		if(v == cid) then
			return true
		end
	end
	return false
end

local function addFocus(cid)
	if(not isFocused(cid)) then
		table.insert(focuses, cid)
	end
	selfFocus(cid)
end

local function removeFocus(cid)
	for i, v in pairs(focuses) do
		if(v == cid) then
			table.remove(focuses, i)
			break
		end
	end
	selfFocus(0)
end

local function lookAtFocus()
	for i, v in pairs(focuses) do
		if(isPlayer(v)) then
			doNpcSetCreatureFocus(v)
			return
		end
	end
	doNpcSetCreatureFocus(0)
end

local function getTime(s)
    local n = math.floor(s / 60)
    
    s = s - (60 * n)
    return n, s
end

function searchTarget(cid, storage)
	local targetList = {}
	if isCreature(cid) then
		local spectators = getSpectators(getCreaturePosition(cid), 13, 13, false)
		if #spectators > 0 then
			for i, v in pairs(spectators) do
				if isPlayer(v) then
					if storage ~= 0 then
						if getPlayerStorageValue(v, storage) == 1 and getPlayerStorageValue(v, 2152525) ~= 1 then
							table.insert(targetList, v)
						end
					else
						if getPlayerStorageValue(v, 2152525) ~= 1 then
							table.insert(targetList, v)
						end
					end
				end
			end
		end
	end
	if #targetList > 0 then
		return targetList
	else
		return false
	end
end

function getClosestTarget(cid, storage)
	local closest = 15
	local id = nil
	local targets = searchTarget(cid, storage)
	if targets ~= false then 
		for i, v in pairs(targets) do
			local dist = getNpcDistanceTo(v)
			if dist <= closest then
				closest = dist
				id = v
			end
		end
		return id
	end
	return 0
end

local configCard = {owner = nil, attacking = nil, lastAttack = nil, started = nil, lastPos = nil, lastTarget = nil} -- não editar
local combatConfig = {
	--// Mew and Mewtwo Card \\--
	['Mew'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cpsychic", cd = 3, chance = 100, range = 2, lastUse = nil}, 
		{name = "Cconfusion", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = true,
		istower = false
	},
	['Mewtwo'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cpsychic", cd = 3, chance = 100, range = 2, lastUse = nil}, 
		{name = "Cpsyusion", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = true,
		istower = false
	},
	--// Legendary Cards \\--	
	['Moltres'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cmagma Storm", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		{name = "Cinferno", cd = 15, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = true,
		istower = false
	},
	['Articuno'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cblizzard", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		{name = "Csheer Cold", cd = 15, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = true,
		istower = false
	},
	['Zapdos'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cthunder", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		{name = "Celectric Storm", cd = 15, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = true,
		istower = false
	},
	--// Other Card \\--	
	['Big Porygon'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cppsychic", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = true,
		istower = true
	},
	['Snorlax'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cfocus Blast", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = false,
		istower = true
	},
	['Aerodactyl'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cfalling Rocks", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = true,
		istower = true
	},
	['Dragonite'] = {
		basicAttack = {name = "BasicAttack", range = 1, attackSpeed = 2, shoot = nil},
		spells = {
		{name = "Cdraco Meteor", cd = 7, chance = 100, range = 2, lastUse = nil}, 
		},--não editar o lastUse
		time = 60 * 60, -- tempo para o npc ser removido em segundos
		isfly = true,
		istower = true
	}
}

function searchTargetCard(cid)
	local targetList = {}
	local spectators = getSpectators(getCreaturePosition(cid), 11, 11, false)
	if spectators ~= nil then
		if #spectators > 0 then
			for i, v in pairs(spectators) do
				if isWild(v) or (isSummon(v) and isNpc(getCreatureMaster(v)) and not isPlayer(v) and getCreatureSummons(cid)[1] ~= v)  then
					table.insert(targetList, v)
				end
			end
		end
	end
	if #targetList > 0 then
		return targetList
	else
		return false
	end
end

function getClosestTargetCard(cid)
	local closest = 15
	local id = 0
	local targets = searchTargetCard(cid)
	if targets ~= false then 
		for i, v in pairs(targets) do
			local dist = getNpcDistanceTo(v)
			if dist <= closest then
				closest = dist
				id = v
			end
		end
	end
	return id
end

function getFollowTargetCard(cid)
	local target = getClosestTargetCard(cid)
	local follow = nil
	if target > 0 and isCreature(target) then
		follow = target
	else
		follow = cid
	end
	return follow
end

local config = {	
	['Hunter'] = {
		pokemons = {"Pidgeot", "Blastoise", "Alakazam", "Fearow", "Magmar", "Meganium"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 0,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hunter", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	['Huntress'] = {
		pokemons = {"Persian", "Machamp", "Tyranitar", "Venusaur", "Magmar", "Meganium"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 0,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hunterf", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	['Jendon'] = {
		pokemons = {"Arcanine", "Machamp", "Alakazam", "Venusaur", "Electabuzz", "Meganium"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Annie'] = {
		pokemons = {"Mr. mime", "Feraligatr", "Xatu", "Venusaur", "Raichu", "Skarmory"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	
	
	['Lesgeor'] = {
		pokemons = {"Arcanine", "Quagsire", "Jynx", "Maganium", "Tentacruel", "Golem"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	
	
	['Josue'] = {
		pokemons = {"Gengar", "Nidoking", "Alakazam", "Charizard", "Electabuzz", "Blastoise"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Lady'] = {
		pokemons = {"Heracross", "Gengar", "Xatu", "Muk", "Charizard", "Ursaring"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Lesgeor'] = {
		pokemons = {"Arcanine", "Quagsire", "Jynx", "Maganium", "Tentacruel", "Golem"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Marma'] = {
		pokemons = {"Skarmory", "Kangaskhan", "Crobat", "Ampharos", "Meganium", "Sudowoodo"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	
	
	['Jamal'] = {
		pokemons = {"Venusaur", "Thyplosion", "Girafarig", "Omastar", "Skarmory", "Lanturn"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Issei'] = {
		pokemons = {"Omastar", "Venusaur", "Electabuzz", "Thyplosion", "Meganium", "Raichu"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Hick'] = {
		pokemons = {"Charizard", "Omastar", "Azumarill", "Wobbuffet", "Crobat", "Xatu"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Guth'] = {
		pokemons = {"Snorlax", "Alakazam", "Muk", "Golem", "Skarmory", "Piloswine"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Flednan'] = {
		pokemons = {"Omastar", "Magcargo", "Alakazam", "Venusaur", "Snorlax", "Thyplosion"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Danjen'] = {
		pokemons = {"Kabutops", "Sudowoodo", "Politoad", "Quagsire", "Meganium", "Blastoise"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Creator'] = {
		pokemons = {"Electabuzz", "Ursaring","Thyplosion", "Xatu", "Tentacruel", "Gengar"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Caska'] = {
		pokemons = {"Wobbuffet", "Heracross", "Alakazam", "Ursaring", "Electabuzz", "Raichu"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Brandier'] = {
		pokemons = {"Magmar", "Magcargo", "Alakazam", "Piloswine", "Houndoom", "Gyarados"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Annie'] = {
		pokemons = {"Mr. mime", "Feraligatr", "Xatu", "Venusaur", "Raichu", "Skarmory"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Ana'] = {
		pokemons = {"Lapras", "Alakazam", "Venusaur", "Gengar", "Charizard", "Muk"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Waldron'] = {
		pokemons = {"Feraligatr", "Electabuzz", "Muk", "Rhydon", "Exeggutor", "Lanturn"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Taza'] = {
		pokemons = {"Thyplosion", "Ampharos", "Xatu", "Tentacruel", "Scyther", "Girafarig"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Stele'] = {
		pokemons = {"Gyarados", "Lapras", "Ursaring", "Thyplosion", "Ampharos", "Rhydon"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Sarao'] = {
		pokemons = {"Sudowoodo", "Muk", "Venusaur", "Feraligatr", "Ursaring", "Snorlax"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Saphira'] = {
		pokemons = {"Donphan", "Miltank", "Charizard", "Scyther", "Jynx", "Omastar"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Riani'] = {
		pokemons = {"Jynx", "Pinsir", "Mr. mime", "Lapras", "Omastar", "Azumarill"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Nigrim'] = {
		pokemons = {"Venusaur", "Muk", "Raichu", "Golem", "Meganium", "Magmar"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Nielwen'] = {
		pokemons = {"Magmar", "Rapidash", "Xatu", "Charizard", "Venusaur", "Meganium"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodeasy", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	

-- NPCS MEDIUM --

	['Fercon'] = {
		pokemons = {"Aerodactyl", "Shiny Thyplosion", "Gengar", "Venusaur", "Steelix", "Piloswine"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Conmann'] = {
		pokemons = {"Dragonite", "sceptile", "Ludicolo", "Swellow", "Arcanine", "Gardevoir"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Ealorah'] = {
		pokemons = {"Steelix", "Slowking", "Shiny Muk", "Golem", "Altaria", "Crawdaunt"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	
	
	['Eversa'] = {
		pokemons = {"Aerodactyl", "Blaziken", "Exploud", "Camerupt", "Gardevoir", "Kingdra"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Anke'] = {
		pokemons = {"Gardevoir", "Magmar", "Steelix", "Shiny Venusaur", "Flygon", "Blissey"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Dania'] = {
		pokemons = {"Steelix", "Dragonite", "Shiny Dragonair", "Blissey", "Flygon", "Blastoise"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Caiou'] = {
		pokemons = {"Dragonite", "Slowking", "Wobbuffet", "Omastar", "Blaziken", "Rhydon"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Fernya'] = {
		pokemons = {"Muk", "Blissey", "Steelix", "Flygon", "Golem", "Shiny Gengar"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	
	
	['Niel'] = {
		pokemons = {"Shiny Muk", "Arcanine", "Slowking", "Lapras", "Flygon", "Venusaur"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Paulcan'] = {
		pokemons = {"Dragonite", "Gardevoir", "Blissey", "Skarmory", "Steelix", "Swampert"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Munfa'] = {
		pokemons = {"Dragonite", "Snorlax", "Gardevoir", "Shiny Blastoise", "Meganium ", "Alakazam"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Mel'] = {
		pokemons = {"Wobbuffet", "Arcanine", "Shiny Charizard", "Slowking", "Thyplosion", "Flygon"},
		storage = 0, 
		gymName = "No Name",
 		onlyAttackStorage = 2145669, 
		CanKillPlayer = 1, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Loren'] = {
		pokemons = {"Blissey", "Piloswine", "Shiny Golem", "Wobbuffet", "Arcanine", "Aerodactyl"},
		storage = 0, 
		gymName = "No Name", 
 		onlyAttackStorage = 2145669,
		CanKillPlayer = 1, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Lesung'] = {
		pokemons = {"Slowking", "Gardevoir", "Muk", "Gengar", "Shiny Charizard", "Blastoise"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Larisswan'] = {
		pokemons = {"Manectric", "Altaria", "Electabuzz", "Shiny Gengar", "Gengar", "Sceptile"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Kreegel'] = {
		pokemons = {"Aerodactyl", "Steelix", "Flygon", "Snorlax", "Shiny Alakazam", "Venusaur"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Jack'] = {
		pokemons = {"Steelix", "Lapras", "Flygon", "Blaziken", "Meganium", "Shiny Xatu"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Hamchell'] = {
		pokemons = {"Gardevoir", "Flygon", "Venusaur", "Blaziken", "Electabuzz", "Shiny Charizard"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Fred'] = {
		pokemons = {"Slowking", "Steelix", "Shiny Mr. mime", "Arcanine", "Flygon", "Scyther"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Rah'] = {
		pokemons = {"Slowking", "Muk", "Dragonite", "Exploud", "Gardevoir", "Shiny Tangela"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Taja'] = {
		pokemons = {"Blissey", "Shiny Alakazam", "Venusaur", "Sceptile", "Scyther", "Gardevoir"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	
	
	['Ruthta'] = {
		pokemons = {"Gardevoir", "Blissey", "Venusaur", "Shiny Tentacruel", "Gengar", "Crobat"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Tyren'] = {
		pokemons = {"Shiny Pidgeot", "Venusaur", "Gardevoir", "Blastoise", "Gengar", "Meganium"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Stella'] = {
		pokemons = {"Venusaur", "Shiny Vileplume", "Dragonite", "Lapras", "Blaziken", "Charizard"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Ron'] = {
		pokemons = {"Swampert", "Alakazam", "Shiny Xatu", "Muk", "Gardevoir", "Steelix"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodmedium", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	

-- NPCS HARD --	
	
	['Drowner'] = {
		pokemons = {"Gardevoir", "Blissey", "Shiny Muk", "Shiny Electabuzz", "Shiny Vileplume", "Shiny Hitmontop"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	
	['Cristopher'] = {
		pokemons = {"Shiny Mr. Mime", "Shiny Venusaur", "Flygon", "Seviper", "Tropius", "Shiny Tentacruel"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Ace'] = {
		pokemons = {"Flygon", "Shiny Arcanine", "Gardevoir", "Shiny Blastoise", "Steelix", "Shiny Lanturn"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Archela'] = {
		pokemons = {"Shiny Muk", "Shiny Venomoth", "Swampert", "Blaziken", "Gardevoir", "Dragonite"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Egelrah'] = {
		pokemons = {"Shiny Charizard", "Shiny Vaporeon", "Slowking", "Steelix", "Shiny Gengar", "Shiny Jolteon"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Bandio'] = {
		pokemons = {"Shiny Arcanine", "Gardevoir", "Shiny Muk", "Lapras", "Shiny Magmar", "Shiny Alakazam"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
		

	['Carson'] = {
		pokemons = {"Shiny Umbreon", "Shiny Venusaur", "Gardevoir", "Camerupt", "Flygon", "Shiny Jolteon"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Charnea'] = {
		pokemons = {"Shiny Charizard", "Shiny Feraligatr", "Shiny Electrode", "Flygon", "Seviper", "Blissey"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Cia'] = {
		pokemons = {"Seviper", "Shiny Alakazam", "Venusaur", "Shiny Charizard", "Shiny Muk", "Gardevoir"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Anfas'] = {
		pokemons = {"Shiny Ariados", "Shiny Vaporeon", "Slowking", "Shiny Gengar", "Shiny Venusaur", "Gardevoir"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	
	
	['Sylkya'] = {
		pokemons = {"Shiny Charizard", "Shiny Hypno", "Wobbuffet", "Flygon", "Mawile", "Aggron"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Thonya'] = {
		pokemons = {"Shiny Vileplume", "Shiny Gengar", "Shiny Gyarados", "Gardevoir", "Snorlax", "Camerupt"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Tarlon'] = {
		pokemons = {"Slaking", "Venusaur", "Tentacruel", "Shiny Magmar", "Shiny Venusaur", "Blissey"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Solarah'] = {
		pokemons = {"Shiny Vileplume", "Shiny Magcargo", "Shiny Fearow", "Gardevoir", "Blissey", "Flygon"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Rencuth'] = {
		pokemons = {"Shiny Muk", "Shiny Xatu", "Shiny Thyplosion", "Venusaur", "Blaziken", "Sceptile"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Rogerio'] = {
		pokemons = {"Shiny Muk", "Shiny Charizard", "Dragonite", "Flygon", "Blaziken", "Swampert"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Nasrah'] = {
		pokemons = {"Venusaur", "Blaziken", "Sceptile", "Gardevoir", "Steelix", "Shiny Gengar"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Nanhe'] = {
		pokemons = {"Shiny Jolteon", "Shiny Dragonair", "Slowking", "Steelix", "Shiny Tentacruel", "Blaziken"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Marberou'] = {
		pokemons = {"Shiny Jolteon", "Gardevoir", "Shiny Electabuzz", "Shiny Meganium", "Flygon", "Crawdaunt"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Leyeli'] = {
		pokemons = {"Gardevoir", "Steelix", "Shiny Flareon", "Shiny Electabuzz", "Wobbuffet", "Shiny Alakazam"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Kimto'] = {
		pokemons = {"Camerupt", "Seviper", "Shiny Alakazam", "Exploud", "Shiny Muk", "Shiny Nidoking"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Elfmann'] = {
		pokemons = {"Shiny Dragonair", "Shiny Vileplume", "Shiny Muk", "Slowking", "Camerupt", "Sceptile"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Gar'] = {
		pokemons = {"Shiny Alakazam", "Gardevoir", "Shiny Muk", "Snorlax", "Shiny Mr. Mime", "Seviper"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Lessha'] = {
		pokemons = {"Shiny Vaporeon", "Shiny Electabuzz", "Gardevoir", "Steelix", "Shiny Ninetales", "Venusaur"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Wilson'] = {
		pokemons = {"Aerodactyl", "Shiny Magneton", "Shiny Electabuzz", "Wobbuffet", "Flygon", "Shiny Alakazam"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodhard", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

-- NPCS EXPERT --	

	['House'] = {
		pokemons = {"Shiny Snorlax", "Slaking", "Metagross", "Electivire", "Tangrowth", "Shiny Scyther"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1,
 		onlyAttackStorage = 2145669, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodexpert", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Slash'] = {
		pokemons = {"Shiny Snorlax", "Electivire", "Magmortar", "Slaking", "Milotic", "Tangrowth"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodexpert", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Luffy'] = {
		pokemons = {"Slaking", "Metagross", "Shiny Snorlax", "Milotic", "Dusknoir", "Shiny Alakazam"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodexpert", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},

	['Champion'] = {
		pokemons = {"Rhyperior", "Shiny Scyther", "Metagross", "Gardevoir", "Magmortar", "Salamence"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodexpert", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},	
	
	['Tony'] = {
		pokemons = {"Slaking", "Magmortar", "Salamence", "Shiny Scyther", "Metagross", "Milotic"},
		storage = 0, 
		gymName = "No Name", 
		CanKillPlayer = 1, 
 		onlyAttackStorage = 2145669,
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Hoodexpert", -- AQUI TU COLOCA Hoodeasy = facil, Hoodmedium = médio, Hoodhard = dificil, Hoodexpert = expert, Hoodlendary = lendary.
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	},
	--------- NPC GYM -----------------------	
	['Misty'] = {
		pokemons = {"Pikachu", "Onix"},
		storage = 0, 
		onlyAttackStorage = 0, --0 pra desativar
		gymName = "water gym", 
		CanKillPlayer = 0, 
		items = {{2160, 5}, {2145, 50}}, 
		Talks = {
			welcome = "Welcome, %s, to %s do you like {battle} with me?", 
			battle = "say {start} to battle.", 
			start = "ok, lets go!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, Goodbye!", 
			win = "Congratulation you defeat me!", 
			lose = "sorry, you lose this time, try again later.", 
			faraway = "sorry, you go far away. be close of me", 
			go =  "Go!, %s"
		}, 
		deadSummon = "Venusaur",
		goEffect = 188,
		--não editar nada abaixo
		usedPokemons = {}, 
		player = nil, 
		talkState = 0, 
		battleStarted = false, 
		storages = {}, 
		pokes = nil,
		startedpokes = nil,	
		defeats = 0, 
		actualPoke = nil,
		lastDeadPoke = nil
	}
	
}

local inBattleStorage = 58496 -- storage para quando o player esta em batalha com um NPC pra pode impedir que o player use revive ou qualquer outra coisa
local maxTimeSeconds = 30 --tempo pra colocar outro poke
local storageDaFunction = 54798
local storageGoBack = 54799

function onCreatureDisappear(cid)
	local npcId = getNpcId()
	local npcTable = config[getNpcName()]
	if(isFocused(cid)) then
		local npcSummon = getCreatureSummons(npcId)
		if npcTable.CanKillPlayer == 0 then
			if npcSummon then
				if #npcSummon > 0 then
					for i, v in pairs(npcSummon) do
						doRemoveCreature(v)
					end
				end
			end
		end
		removeFocus(cid)
		for k in pairs (npcTable.storages) do
			npcTable.storages[k] = nil
		end
		for k in pairs (npcTable.usedPokemons) do
			npcTable.usedPokemons[k] = nil
		end
		npcTable.defeats = 0
		setPlayerStorageValue(cid, inBattleStorage, 0)
		setPlayerStorageValue(npcTable.player, storageDaFunction, 0)
		npcTable.battleStarted = false
		npcTable.talkState = 0
		npcTable.pokes = nil
		npcTable.player = nil
		npcTable.startedpokes = nil
		selfFocus(0)
		selfCanIdle(true)
	end
end

function onCreatureSay(cid, type, msg)
	local npcId = getNpcId()
	local npcTable = config[getNpcName()]
	if npcTable and npcTable.CanKillPlayer == 0 and getPlayerStorageValue(cid , npcTable.storage) ~= 1 and getDistanceBetween(getCreaturePosition(npcId), getCreaturePosition(cid)) <= 8 then
		if((msg == "hi") and (npcTable.talkState == 0) and not (isFocused(cid)) and npcTable.player == nil) then
			if npcTable.player == nil then
				selfSay(string.format(npcTable.Talks.welcome, getCreatureName(cid), npcTable.gymName), cid)
				addFocus(cid)
				selfCanIdle(false)
				npcTable.talkState = 1
				npcTable.player = cid
			end
		elseif ((msg == "battle") and (isFocused(cid)) and (npcTable.talkState == 1)) then  
			selfSay(npcTable.Talks.battle, cid)
			npcTable.talkState = 2
		elseif ((msg == "start") and (isFocused(cid)) and (npcTable.talkState == 2))then
			local playerSummon = getCreatureSummons(cid)
			if #playerSummon > 0 then
				selfSay(npcTable.Talks.start, cid)
				npcTable.battleStarted = true
				npcTable.talkState = 3
				local mypb = getPlayerSlotItem(npcTable.player, 3).uid
				local getball = #getPokeballsOnInContainer(mypb)
				npcTable.pokes = getball 
				npcTable.startedpokes = getball+1
				setPlayerStorageValue(cid, inBattleStorage, 1)
			else
				selfSay(npcTable.Talks.callPoke, cid)
			end
		elseif ((msg == "bye") and (isFocused(cid))) then
			selfSay(npcTable.Talks.bye, cid, true)
			local npcSummon = getCreatureSummons(npcId)
			if npcSummon then
				if #npcSummon > 0 then
					for i, v in pairs(npcSummon) do
						doRemoveCreature(v)
					end
				end
			end
			removeFocus(cid)
			for k in pairs (npcTable.storages) do
				npcTable.storages[k] = nil
			end
			for k in pairs (npcTable.usedPokemons) do
				npcTable.usedPokemons[k] = nil
			end
			setPlayerStorageValue(cid, inBattleStorage, 0)
			setPlayerStorageValue(npcTable.player, storageDaFunction, 0)
			npcTable.battleStarted = false
			npcTable.talkState = 0
			npcTable.defeats = 0
			npcTable.pokes = nil
			npcTable.player = nil
			npcTable.startedpokes = nil
			selfFocus(0)
			selfCanIdle(true)
		end
	end
end

function onThink() 
	local npcId = getNpcId()
	local npcSummon = getCreatureSummons(npcId)
	local npcTable = config[getNpcName()]
	local combat = combatConfig[getNpcName()]
	if npcTable then
		selfCanKill(npcTable.CanKillPlayer)
		if npcTable.CanKillPlayer == 1 then
			local target = getClosestTarget(npcId, npcTable.onlyAttackStorage)
			if npcTable.player == nil then
				if isPlayer(target) and npcTable.player ~= target then
					npcTable.player = target
					npcTable.battleStarted = true
					selfFocus(target)
					addFocus(target)
					selfAttackedCreature(target)
					selfCanIdle(false)
				end
			end
			mayNotMove(npcId, false)
		else
			mayNotMove(npcId, true)
		end
		if npcTable.battleStarted and npcTable.player ~= nil then
			if isPlayer(npcTable.player) then
				local mypb = getPlayerSlotItem(npcTable.player, 3).uid
				local getball = #getPokeballsOnInContainer(mypb)
				local playerSummon = getCreatureSummons(npcTable.player)
				if npcTable.CanKillPlayer == 0 then
                    selfAttackedCreature(playerSummon[1])
                end
				if getPlayerStorageValue(npcTable.player, storageDaFunction) == 1 then
					npcTable.defeats = npcTable.defeats+1
					npcTable.lastDeadPoke = os.time()
					setPlayerStorageValue(npcTable.player, storageDaFunction, 0)
				end
				if npcTable.CanKillPlayer == 1 and #npcSummon >= 1 then
					if (#getCreatureSummons(npcTable.player) >= 1 and getCreatureTarget(npcSummon[1]) ~= getCreatureSummons(npcTable.player)[1]) or getPlayerStorageValue(npcTable.player, npcTable.onlyAttackStorage) == 1 then
						removeFocus(npcTable.player)
						npcTable.player = nil
						selfFocus(0)
						selfCanIdle(true)
					end
				end
				if type(getCreaturePosition(npcId)) == table and type(getCreaturePosition(npcTable.player)) == table then
					if getDistanceBetween(getCreaturePosition(npcId), getCreaturePosition(npcTable.player)) > 10 or getCreaturePosition(npcTable.player).z ~= getCreaturePosition(npcId).z  then
						if npcTable.CanKillPlayer == 0 then
							selfSay(npcTable.Talks.faraway, npcTable.player)
							if #npcSummon > 0 then
								for i, v in pairs(npcSummon) do
									doRemoveCreature(v)
								end
							end
							setPlayerStorageValue(npcTable.player, inBattleStorage, 0)
							for k in pairs (npcTable.storages) do
								npcTable.storages[k] = nil
							end
							for k in pairs (npcTable.usedPokemons) do
							npcTable.usedPokemons[k] = nil
							end
						else
							doTeleportThing(npcSummon[1], getCreaturePosition(npcId), false)
						end 
						removeFocus(npcTable.player)
						setPlayerStorageValue(npcTable.player, storageDaFunction, 0)
						npcTable.battleStarted = false
						npcTable.talkState = 0
						npcTable.defeats = 0
						npcTable.pokes = nil
						npcTable.player = nil
						npcTable.startedpokes = nil
						selfFocus(0)
						selfCanIdle(true)
					end
				end
				if #npcSummon == 0 then
					if #npcTable.usedPokemons == #npcTable.pokemons then
						if npcTable.CanKillPlayer == 0 then
							selfSay(npcTable.Talks.win, npcTable.player)
							if #npcTable.items > 0 then
								for i, v in pairs(npcTable.items) do
									doPlayerAddItem(npcTable.player, v[1], v[2])
								end
							end
						end
						if npcTable.storage > 0 then
							setPlayerStorageValue(npcTable.player, npcTable.storage, 1)
						end
						if #npcSummon > 0 then
							for i, v in pairs(npcSummon) do
								doRemoveCreature(v)
							end
						end
						removeFocus(npcTable.player)
						for k in pairs (npcTable.storages) do
							npcTable.storages[k] = nil
						end
						for k in pairs (npcTable.usedPokemons) do
							npcTable.usedPokemons[k] = nil
						end
						setPlayerStorageValue(npcTable.player, inBattleStorage, 0)
						setPlayerStorageValue(npcTable.player, storageDaFunction, 0)
						npcTable.battleStarted = false
						npcTable.talkState = 0
						npcTable.defeats = 0
						npcTable.pokes = nil
						npcTable.player = nil
						npcTable.startedpokes = nil
						selfFocus(0)
						selfCanIdle(true)
						if npcTable.CanKillPlayer == 1 then
							local monst = doCreateMonsterNick(0, npcTable.deadSummon, getNpcName(), getCreaturePosition(npcId), false)
							doSetCreatureOutfit(monst, getCreatureOutfit(npcId), -1)
							doRemoveCreature(npcId)
						end
					else
						for i, v in pairs(npcTable.pokemons) do
							if not isInArray(npcTable.usedPokemons, v) then
								local summ = doCreateMonsterNick(npcId, v, v, getClosestFreeTile(npcId, getCreaturePosition(npcId)), true) 						
								npcTable.actualPoke = v	
								local bonusbro = {
									["Hoodeasy"] = {bonus = 2.5},
									["Hunter"] = {bonus = 2},
									["Hunterf"] = {bonus = 2},
									["Hoodmedium"] = {bonus = 3},
									["Hoodhard"] = {bonus = 4},
									["Hoodexpert"] = {bonus = 5},
								}
								for p, j in pairs(bonusbro) do
									if npcTable.deadSummon == p then
										setBonusWild(summ, j.bonus)
										addEvent(setPlayerStorageValue, 1600, summ, p, 1)
									end
								end
								setPlayerStorageValue(summ, npcTable.deadSummon, 1)
								setPlayerStorageValue(cid, inBattleStorage, 1)					
								selfSay(string.format(npcTable.Talks.go, getCreatureName(summ)), npcTable.player, true)
								doSendMagicEffect(getCreaturePosition(summ), npcTable.goEffect)
								table.insert(npcTable.usedPokemons, v)
								break
							end
						end
					end
				end
				if npcTable.CanKillPlayer == 0 and #playerSummon <= 0 then
					if npcTable.defeats >= npcTable.startedpokes then
						selfSay(npcTable.Talks.lose, npcTable.player)
						if #npcSummon > 0 then
							for i, v in pairs(npcSummon) do
								doRemoveCreature(v)
							end
						end
						removeFocus(npcTable.player)
						for k in pairs (npcTable.storages) do
							npcTable.storages[k] = nil
						end
						for k in pairs (npcTable.usedPokemons) do
							npcTable.usedPokemons[k] = nil
						end
						setPlayerStorageValue(npcTable.player, inBattleStorage, 0)
						npcTable.battleStarted = false
						setPlayerStorageValue(npcTable.player, storageDaFunction, 0)
						npcTable.talkState = 0
						npcTable.defeats = 0
						npcTable.pokes = nil
						npcTable.player = nil
						selfFocus(0)
						selfCanIdle(true)
					else
						if npcTable.lastDeadPoke ~= nil then
							if os.time() >= npcTable.lastDeadPoke+maxTimeSeconds then
								selfSay(npcTable.Talks.lose, npcTable.player)
								if #npcSummon > 0 then
									for i, v in pairs(npcSummon) do
										doRemoveCreature(v)
									end
								end
								removeFocus(npcTable.player)
								for k in pairs (npcTable.storages) do
									npcTable.storages[k] = nil
								end
								for k in pairs (npcTable.usedPokemons) do
									npcTable.usedPokemons[k] = nil
								end
								setPlayerStorageValue(npcTable.player, inBattleStorage, 0)
								setPlayerStorageValue(npcTable.player, storageDaFunction, 0)
								npcTable.battleStarted = false
								npcTable.talkState = 0
								npcTable.defeats = 0
								npcTable.pokes = nil
								npcTable.player = nil
								selfFocus(0)
								selfCanIdle(true)
							end
						end
					end
				end
			else
				if npcTable.CanKillPlayer == 0 then
					if #npcSummon > 0 then
						for i, v in pairs(npcSummon) do
							doRemoveCreature(v)
						end
					end
				end
				removeFocus(npcTable.player)
				for k in pairs (npcTable.storages) do
					npcTable.storages[k] = nil
				end
				for k in pairs (npcTable.usedPokemons) do
					npcTable.usedPokemons[k] = nil
				end
				npcTable.battleStarted = false
				npcTable.talkState = 0
				npcTable.defeats = 0
				setPlayerStorageValue(npcTable.player, storageDaFunction, 0)
				setPlayerStorageValue(npcTable.player, inBattleStorage, 0)
				npcTable.pokes = nil
				npcTable.player = nil
				selfFocus(0)
				selfCanIdle(true)
			end
		end
	elseif combat then
		local focus = getNpcFocus()
		selfCanIdle(false)
		if isPlayer(focus) and configCard.owner ~= focus then
			configCard.owner = focus
		end
		if isPlayer(configCard.owner) then
			if configCard.started == nil then
				configCard.started = os.time()
			end
		
			if os.time() >= configCard.started+combat.time then
				doRemoveCreature(npcId)
			end
	
			if isRiderOrFlyOrSurf(configCard.owner) then
				if combat.isfly == false then
					doRemoveCreature(npcId)
				end
			end		
			
			if getPlayerStorageValue(configCard.owner, 465456701) >= 1 or getPlayerStorageValue(configCard.owner, 245681) >= 1 or getPlayerStorageValue(configCard.owner, 58496) >= 1 or getPlayerStorageValue(configCard.owner, 245678) >= 1 or getPlayerStorageValue(configCard.owner, 55006) >= 1 then
				doRemoveCreature(npcId)
			end
			
			if getPlayerInTower(configCard.owner) then
				if combat.istower == false then
					doRemoveCreature(npcId)
				end
			end			
			
			if isCreature(npcId) and getDistanceBetween(getCreaturePosition(configCard.owner), getCreaturePosition(npcId)) > 6 then
				doTeleportThing(npcId, getClosestFreeTile(configCard.owner, getCreaturePosition(configCard.owner)), false)
			end
		
			if isMonster(configCard.attacking) and isNpc(npcId) then
				selfAttackedCreature(configCard.attacking)
				if configCard.lastAttack == nil or (os.time() >= configCard.lastAttack+combat.basicAttack.attackSpeed) then
					if isCreature(npcId) and isCreature(configCard.attacking) and getDistanceBetween(getCreaturePosition(npcId), getCreaturePosition(configCard.attacking)) <= combat.basicAttack.range then
						if combat.basicAttack.range > 1 then
							if combat.basicAttack.shoot ~= nil then
								doSendDistanceShoot(getCreaturePosition(npcId), getCreaturePosition(configCard.attacking), combat.basicAttack.shoot)
							end
						end
						doCreatureCastSpell(npcId, combat.basicAttack.name)
						configCard.lastAttack = os.time()
					end
				end
				if isCreature(npcId) and isCreature(configCard.attacking) then
					for i, v in pairs(combat.spells) do
						if getDistanceBetween(getCreaturePosition(npcId), getCreaturePosition(configCard.attacking)) <= v.range then
							local chance = math.random(100)
							if chance < v.chance and (v.lastUse == nil or (os.time() >= v.lastUse+v.cd or v.lastUse == nil)) then
								doCreatureCastSpell(npcId, v.name)
								v.lastUse = os.time()
							end
						end
					end
				end
			end
			configCard.attacking = getFollowTargetCard(getNpcMaster(npcId))
		else
			doRemoveCreature(npcId)
		end
	end
	lookAtFocus()
end

function onCreatureAppear(cid) 
end