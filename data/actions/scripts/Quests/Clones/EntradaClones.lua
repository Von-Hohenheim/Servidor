local posis = {
	{'Volcanic',    {x = 603, y = 1170, z = 8}}, 
	{'Seavell',     {x = 603, y = 1172, z = 8}},
	{'Orebound',    {x = 604, y = 1171, z = 8}},
	{'Wingeon',     {x = 602, y = 1171, z = 8}},
}

local toPosi = {x = 1789, y = 1081, z = 15} --pos pra onde os players serao teleportados
local posCao = {fromx = 1712, fromy = 1001, fromz = 15, tox = 1966, toy = 1097, toz= 15}
local posCao1 = {x = 1712, y = 1001, z = 15} 
local posCao2 = {x = 1966, y = 1097, z = 15} 

function onUse(cid, item, frompos, item2, topos)

	for _, array in ipairs(posis) do
		local p = getRecorderPlayer(array[2])
		if not isPlayer(p) then
			doPlayerSendTextMessage(cid, 20, "Vocês não estão na posição correta!")
			return true
		elseif getPlayerStorageValue(p, 413702) ~= 1 then
			doPlayerSendTextMessage(cid, 20, "Você não tem acesso a essa quest!")
			return true		
		elseif getPlayerLevel(p) < 250 then
			doPlayerSendTextMessage(cid, 20, "Alguem do seu grupo é de level inferior a 250!")
			return true		
		elseif getPlayerStorageValue(p, 245680) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 20, "Alguem do seu grupo não pode entrar na quest no momento!")
			return true			
		elseif #getPlayersInArea(posCao) >= 1 or getGlobalStorageValue(245679) >= 1 then
			doPlayerSendTextMessage(cid, 20, "Quest indisponível no momento, tente mais tarde.")
			return true
		end
	end
	
	doTransformItem(item.uid, (item.itemid == 1945 and 1945 or 1946))
	
	for _, array in ipairs(posis) do
		local p = getRecorderPlayer(array[2])
		if isPlayer(p) then
			doTeleportThing(p, toPosi)
			addEvent(doRemoveCreature, 60 * 60 * 1000, cid)
			doSendPlayerExtendedOpcode(cid, 133, 61 * 60)	
			setPlayerStorageValue(p, 245678, 1)
			setGlobalStorageValue(245679, 2 * 60 * 60 + os.time())
			doSendMagicEffect(getThingPos(p), 21)
		end
	end
	
	removeNpcInArea(posCao1, posCao2, true, false)	
	creatureInSurvival(posCao1, posCao2, true, false)	
	doCreateFullNpcsss()
	return true
end

function doCreateNpcInClones(posi)

local config = {
	npcs = {"B-ana", "B-annie", "B-brandier", "B-caska", "B-creator", "B-danjen", "B-flednan", "B-guth", "B-hick", "B-issei", "B-jamal", "B-jendon", "B-josue", "B-lady", "B-lesgeor", "B-marma", "B-nielwen", "B-nigrim", "B-nigrim", "B-riani", "B-saphira", "B-sarao", "B-stele", "B-taza", "B-waldron"}
}

	local name = config.npcs[math.random(1, #config.npcs)]
	doCreateNpc(name, posi)	
	return true
end

function doCreateFullNpcsss()
	doCreateNpcInClones({x = 1789, y = 1061, z = 15})
	doCreateNpcInClones({x = 1764, y = 1065, z = 15})
	doCreateNpcInClones({x = 1732, y = 1055, z = 15})
	doCreateNpcInClones({x = 1751, y = 1048, z = 15})
	doCreateNpcInClones({x = 1747, y = 1032, z = 15})
	doCreateNpcInClones({x = 1771, y = 1024, z = 15})
	doCreateNpcInClones({x = 1791, y = 1029, z = 15})
	doCreateNpcInClones({x = 1809, y = 1036, z = 15})
	doCreateNpcInClones({x = 1836, y = 1036, z = 15})
	doCreateNpcInClones({x = 1854, y = 1045, z = 15})
	doCreateNpcInClones({x = 1866, y = 1061, z = 15})
	doCreateNpcInClones({x = 1892, y = 1050, z = 15})
	doCreateNpcInClones({x = 1850, y = 1029, z = 15})
	doCreateNpcInClones({x = 1874, y = 1020, z = 15})
	doCreateNpcInClones({x = 1895, y = 1026, z = 15})
	doCreateNpcInClones({x = 1912, y = 1032, z = 15})
	doCreateNpcInClones({x = 1938, y = 1043, z = 15})
end