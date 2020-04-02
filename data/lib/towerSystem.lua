--[[ [andar] = {
		[sala] = {global = storage para não usar a sala 2 vezes, stomsg = storage para mandar msg de kill, = id da room}
	}
	]]--.
	
local embeddedTower = {
	[1] = {
			[1] = {global = 789100, revives = 15, stomsg = 252000, room = 78501, tele = {x = 2041, y = 196, z = 14},  area = {fromx = 1937, fromy = 52, fromz = 14, tox = 2152, toy = 270, toz= 14}},
			[2] = {global = 789101, revives = 15, stomsg = 252001, room = 78501, tele = {x = 2258, y = 192, z = 14},  area = {fromx = 2169, fromy = 55, fromz = 14, tox = 2369, toy = 266, toz= 14}},
			[3] = {global = 789102, revives = 15, stomsg = 252002, room = 78501, tele = {x = 2479, y = 202, z = 14},  area = {fromx = 2383, fromy = 53, fromz = 14, tox = 2590, toy = 276, toz= 14}},
			[4] = {global = 789103, revives = 15, stomsg = 252003, room = 78501, tele = {x = 2706, y = 179, z = 14},  area = {fromx = 2616, fromy = 42, fromz = 14, tox = 2840, toy = 260, toz= 14}}
		},
	[2] = {
			[1] = {global = 789104, revives = 20, stomsg = 252004, room = 78502, tele = {x = 2032, y = 426, z = 14},  area = {fromx = 1926, fromy = 288, fromz = 14, tox = 2143, toy = 500, toz= 14}},
			[2] = {global = 789105, revives = 20, stomsg = 252005, room = 78502, tele = {x = 2247, y = 422, z = 14},  area = {fromx = 2158, fromy = 286, fromz = 14, tox = 2360, toy = 496, toz= 14}},
			[3] = {global = 789106, revives = 20, stomsg = 252006, room = 78502, tele = {x = 2468, y = 432, z = 14},  area = {fromx = 2382, fromy = 277, fromz = 14, tox = 2581, toy = 506, toz= 14}},
			[4] = {global = 789107, revives = 20, stomsg = 252007, room = 78502, tele = {x = 2695, y = 409, z = 14},  area = {fromx = 2605, fromy = 269, fromz = 14, tox = 2824, toy = 481, toz= 14}}
		},
	[3] = {
			[1] = {global = 789108, revives = 25, stomsg = 252008, room = 78503, tele = {x = 2023, y = 658, z = 14},  area = {fromx = 1915, fromy = 501, fromz = 14, tox = 2144, toy = 734, toz= 14}},
			[2] = {global = 789109, revives = 25, stomsg = 252009, room = 78503, tele = {x = 2240, y = 654, z = 14},  area = {fromx = 2156, fromy = 491, fromz = 14, tox = 2361, toy = 734, toz= 14}},
			[3] = {global = 789110, revives = 25, stomsg = 252010, room = 78503, tele = {x = 2461, y = 664, z = 14},  area = {fromx = 2371, fromy = 504, fromz = 14, tox = 2582, toy = 747, toz= 14}},
			[4] = {global = 789111, revives = 25, stomsg = 252011, room = 78503, tele = {x = 2688, y = 641, z = 14},  area = {fromx = 2600, fromy = 479, fromz = 14, tox = 2820, toy = 725, toz= 14}}
		},
	[4] = {
			[1] = {global = 789112, revives = 30, stomsg = 252012, room = 78504, tele = {x = 1989, y = 892, z = 14},  area = {fromx = 1883, fromy = 730, fromz = 14, tox = 2097, toy = 1197, toz= 14}},
			[2] = {global = 789113, revives = 30, stomsg = 252013, room = 78504, tele = {x = 2206, y = 888, z = 14},  area = {fromx = 2128, fromy = 740, fromz = 14, tox = 2323, toy = 1203, toz= 14}},
			[3] = {global = 789114, revives = 30, stomsg = 252014, room = 78504, tele = {x = 2427, y = 898, z = 14},  area = {fromx = 2336, fromy = 747, fromz = 14, tox = 2549, toy = 1200, toz= 14}},
			[4] = {global = 789115, revives = 30, stomsg = 252015, room = 78504, tele = {x = 2654, y = 875, z = 14},  area = {fromx = 2554, fromy = 727, fromz = 14, tox = 2775, toy = 1192, toz= 14}}
		}
	}

local storagesTower = {
	StoRoom1 = 78501,
	StoRoom2 = 78502,
	StoRoom3 = 78503,
	StoRoom4 = 78504,
	StoRoom5 = 78505,
	StoRoom6 = 78506,
	StoRoom7 = 78507,
	StoRoom8 = 78508,
	stoTower = 78500,
	stoChance = 78499,
	FlyLicense = 78497
}

function getPointsTower(cid)
	return getPlayerStorageValue(cid, storagesTower.stoTower)
end

function getTowerChance(cid)
	return getPlayerStorageValue(cid, storagesTower.stoChance)
end

function removeTowerChance(cid, count)
	return setPlayerStorageValue(cid, storagesTower.stoChance, getTowerChance(cid) - count)
end

function removeTowerPoints(cid, count)
	return setPlayerStorageValue(cid, storagesTower.stoTower, getPointsTower(cid) - count)
end
	
function setTowerChance(cid, count)
	return setPlayerStorageValue(cid, storagesTower.stoChance, getTowerChance(cid) + count)
end

function setPointsTower(cid, count)
	return setPlayerStorageValue(cid, storagesTower.stoTower, getPointsTower(cid) + count)
end

function doShowRoom(cid)
	 return doSendPlayerExtendedOpcode(cid, 32, "true|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom1)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom2)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom3)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom4)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom5)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom6)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom7)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom8)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.stoTower)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.stoChance)))
end

function getPlayerInTower(cid)
	if getPlayerStorageValue(cid, 21108) >= 1 then
		return true
	end
	return false
end

function doConditionToTower(cid, storage, teleport, revive, global)			
	removeCondTower(cid)						
	removeTowerChance(cid, 1)			
	doTeleportThing(cid, teleport)
	setRevive(cid, revive)		
	setPlayerStorageValue(cid, 20108, -1)		
	setPlayerStorageValue(cid, storage, 1) -- Checagem de monster!				
	setGlobalStorageValue(global, 1 * 60 * 60 + os.time()) -- Checagem de monster!				
	setPlayerStorageValue(cid, 252525, 1) -- proteção para não usar o fly	
	setPlayerStorageValue(cid, 21108, 1) -- checar se tá na tower.	
	doSendPlayerExtendedOpcode(cid, 32, "false") -- fechar painel
	return true
end

function doTeleportTower(cid, andar)

	for a, b in pairs(embeddedTower) do
		if tonumber(andar) == tonumber(a) then
			for i = 1, #b do
				if getTowerChance(cid) >= 1 and getPlayerStorageValue(cid, b[i].room) >= 1 then
					if #getPlayersInArea(b[i].area) < 1 and getGlobalStorageValue(b[i].global) - os.time() < 0 then
						doConditionToTower(cid, b[i].stomsg, b[i].tele, b[i].revives, b[i].global)
						break
					end
--[[				else
					doSendPlayerExtendedOpcode(cid, 31, "Tower2")	
					break]]--
				end
			end
		end
	end
	
return true
end

function removeCondTower(cid)

	for a, b in pairs(embeddedTower) do
		for c, d in pairs(b) do
			if getPlayerStorageValue(cid, d.stomsg) >= 1 then
				setPlayerStorageValue(cid, 252526, -1)
				setPlayerStorageValue(cid, 252525, -1)
				setPlayerStorageValue(cid, 21108, -1)
				setPlayerStorageValue(cid, 200050, 0)
				setPlayerStorageValue(cid, d.stomsg, -1)
				setGlobalStorageValue(d.global, 1 * 60 * 60 + os.time())	
			end
		end
	end
			
return true
end

function doMsgKillTower(cid)

	for a, b in pairs(embeddedTower) do
		for c, d in pairs(b) do
			if getPlayerStorageValue(cid, d.stomsg) >= 1 then
				doPlayerSendTextMessage(cid, 20, "[Tower]: Ainda falta você derrotar ["..(#getMonsterInArea(d.area)-5).."] pokémon's.")
			end
		end
	end
	
	return true
end

function doKillBossTower(cid, target)

local bossTower = {
	["Shiny Scizor"] = {points = 250},
	["Shiny Salamence"] = {points = 100},
	["Shiny Magmortar"] = {points = 150},
	["Shiny Electivire"] = {points = 200}	
}	

local boss = bossTower[doCorrectString(getCreatureName(target))]
	
	if getPlayerInTower(cid) then
		if boss then
			removeCondTower(cid)
			setPointsTower(cid, boss.points)
			doTeleportThing(cid, {x = 2506, y = 243, z = 7})
			doSendPlayerExtendedOpcode(getCreatureMaster(cid), 31, "Finish")
		end
	end

	return true
end
			
function isPokeTower(target)

	for i = 252520, 252536 do
		if getPlayerStorageValue(target, i) >= 1 then
			return true
		end
	end
	
return false
end

function buyToRoom(cid)

	for i = 78501, 78504 do
		if getPlayerStorageValue(cid, i) ~= 1 then
			setPlayerStorageValue(cid, i, 1)
			doSendMsg(cid, "Você acaba de desbloquear um novo andar!")
			break
		end
	end
	
return true
end		