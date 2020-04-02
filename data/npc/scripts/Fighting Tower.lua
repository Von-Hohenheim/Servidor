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

local config = {
['Hang Wufei'] = {
		pokemons = {"Primeape", "Combusken", "Hitmonlee", "Hitmonchan", "Machamp", "Shiny Hitmonlee"},
		storage = 406500, 
		onlyAttackStorage = 0, --0 pra desativar
		storageforduel = 406500,
		valuetobonus = 2,
		gymName = "fighting tower", 
		CanKillPlayer = 0, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Seja bem vindo, %s, sou duelista da %s gostaria de {batalhar}?", 
			battle = "você está pronto para {iniciar}?.", 
			start = "vamos lá!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, até mais!", 
			win = "Parabéns você me derrotou!", 
			lose = "Infelizmente, seu time perdeu, tente novamente mais tarde.", 
			faraway = "você está muito longe de mim.", 
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
	},	
['Van Damme'] = {
		pokemons = {"Machop", "Machoke", "Poliwrath", "Blaziken", "Lucario", "Shiny Hitmonchan"},
		storage = 406501, 
		onlyAttackStorage = 0, --0 pra desativar
		storageforduel = 406500,
		valuetobonus = 2.3,
		gymName = "fighting tower", 
		CanKillPlayer = 0, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Seja bem vindo, %s, sou duelista da %s gostaria de {batalhar}?", 
			battle = "você está pronto para {iniciar}?.", 
			start = "vamos lá!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, até mais!", 
			win = "Parabéns você me derrotou!", 
			lose = "Infelizmente, seu time perdeu, tente novamente mais tarde.", 
			faraway = "você está muito longe de mim.", 
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
	},
['Mai Shiranui'] = {
		pokemons = {"Combusken", "Machoke", "Machamp", "Heracross", "Hitmontop", " Shiny Hitmontop"},
		storage = 406502, 
		onlyAttackStorage = 0, --0 pra desativar
		storageforduel = 406501,
		valuetobonus = 2.5,
		gymName = "fighting tower", 
		CanKillPlayer = 0, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Seja bem vindo, %s, sou duelista da %s gostaria de {batalhar}?", 
			battle = "você está pronto para {iniciar}?.", 
			start = "vamos lá!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, até mais!", 
			win = "Parabéns você me derrotou!", 
			lose = "Infelizmente, seu time perdeu, tente novamente mais tarde.", 
			faraway = "você está muito longe de mim.", 
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
	},
['Chuck Norris'] = {
		pokemons = {"Machop", "Machoke", "Machamp", "Shiny Lucario", "Lucario", "Shiny Machamp"},
		storage = 406503, 
		onlyAttackStorage = 0, --0 pra desativar
		storageforduel = 406502,
		valuetobonus = 2.8,
		gymName = "fighting tower", 
		CanKillPlayer = 0, 
		items = {{0, 0}, {0, 0}}, 
		Talks = {
			welcome = "Seja bem vindo, %s, sou duelista e dono da %s gostaria de {batalhar}?", 
			battle = "você está pronto para {iniciar}?.", 
			start = "vamos lá!..", 
			callPoke = "First call your pokemon!.", 
			bye = "Ok, até mais!", 
			win = "Parabéns você me derrotou!", 
			lose = "Infelizmente, seu time perdeu, tente novamente mais tarde.", 
			faraway = "você está muito longe de mim.", 
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

local inBattleStorage = 201001 -- storage para quando o player esta em batalha com um NPC pra pode impedir que o player use revive ou qualquer outra coisa
local maxTimeSeconds = 30 * 60--tempo pra colocar outro poke
local storageDaFunction = 54798
local storageGoBack = 54799

function onCreatureDisappear(cid)
	local npcId = getNpcId()
	local npcTable = config[getNpcName()]
	if(npcTable.player == cid) then
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
		selfCanIdle(true)
	end
end

function onCreatureSay(cid, type, msg)
	local npcId = getNpcId()
	local npcTable = config[getNpcName()]
	if npcTable and npcTable.CanKillPlayer == 0 and getPlayerStorageValue(cid , npcTable.storage) ~= 1 and getDistanceBetween(getCreaturePosition(npcId), getCreaturePosition(cid)) <= 5 then
		if((msg == "hi") and (npcTable.talkState == 0) and not (isFocused(cid)) and npcTable.player == nil) then
			if npcTable.player == nil then
				selfSay(string.format(npcTable.Talks.welcome, getCreatureName(cid), npcTable.gymName), cid)
				addFocus(cid)
				selfCanIdle(false)
				npcTable.talkState = 1
				npcTable.player = cid
			end
		elseif ((msg == "batalhar") and (isFocused(cid)) and (npcTable.talkState == 1)) then  
			selfSay(npcTable.Talks.battle, cid)
			npcTable.talkState = 2
		elseif ((msg == "iniciar") and (isFocused(cid)) and (npcTable.talkState == 2))then
			local playerSummon = getCreatureSummons(cid)
			if #playerSummon > 0 then
				selfSay(npcTable.Talks.start, cid)
				npcTable.battleStarted = true
				npcTable.talkState = 3
				local getball = 6
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
		if npcTable.player ~= nil and type(getCreaturePosition(npcId)) == "table" and type(getCreaturePosition(npcTable.player)) == "table" then
			if getDistanceBetween(getCreaturePosition(npcId), getCreaturePosition(npcTable.player)) > 5 or getCreaturePosition(npcTable.player).z ~= getCreaturePosition(npcId).z  then
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
				if #npcSummon == 0 then
					if #npcTable.usedPokemons == #npcTable.pokemons then
						if npcTable.CanKillPlayer == 0 then
							selfSay(npcTable.Talks.win, npcTable.player)
							if getNpcName() == "Chuck Norris" then
								addPokeToPlayer(npcTable.player, "Tyrogue", 0, nil, "poke")
								selfSay("Parabéns você acaba de completar a Fighting Tower, sua recompensa é um {Tyrogue}, cuide bem dele.", npcTable.player)
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
								--local summ = doSummonCreature(v, getClosestFreeTile(npcId, getCreaturePosition(npcId)))
								--doConvinceCreature(npcId, summ)
								setBonusWild(summ, npcTable.valuetobonus)
								addEvent(setPlayerStorageValue, 1000, summ, inBattleStorage, 1)
								npcTable.actualPoke = v
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
	end
	lookAtFocus()
end

function onCreatureAppear(cid) 
end