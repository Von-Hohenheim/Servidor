local posis = {
	{'Volcanic',    {x = 644, y = 721, z = 15}}, 
	{'Seavell',     {x = 646, y = 721, z = 15}},
}

local toPosi = {x = 645, y = 714, z = 15} -- pos pra onde os players serao teleportados
local posCao = {fromx = 563, fromy = 593, fromz = 15, tox = 796, toy = 715, toz= 15}
local posCao1 = {x = 563, y = 593, z = 15}
local posCao2 = {x = 796, y = 715, z = 15}

function onUse(cid, item, frompos, item2, topos)

	for _, array in ipairs(posis) do
		local p = getRecorderPlayer(array[2])
		if not isPlayer(p) then
			doPlayerSendTextMessage(cid, 20, "Vocês não estão na posição correta!")
			return true
		elseif getPlayerStorageValue(p, 245683) >= 1 then
			doPlayerSendTextMessage(cid, 20, "Alguem de vocês já fizeram essa quest!")
			return true		
		elseif getPlayerLevel(p) < 150 then
			doPlayerSendTextMessage(cid, 20, "Alguem do seu grupo é de level inferior a 150!")
			return true	
		elseif getPlayerStorageValue(p, 245682) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 20, "Alguem do seu grupo não pode entrar na quest no momento!")
			return true				
		elseif #getPlayersInArea(posCao) >= 1 then
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
			doSendPlayerExtendedOpcode(p, 133, 61 * 60)	
			setPlayerStorageValue(p, 245681, 1)
			doSendMagicEffect(getThingPos(p), 21)
		end
	end

	removeNpcInArea(posCao1, posCao2, true, false)	
	doCreateFullNpc()
	
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

function doCreateFullNpc()
	doCreateNpcInClones({x = 645, y = 711, z = 15})
	doCreateNpcInClones({x = 645, y = 691, z = 15})
	doCreateNpcInClones({x = 635, y = 678, z = 15})
	doCreateNpcInClones({x = 652, y = 678, z = 15})
	doCreateNpcInClones({x = 645, y = 662, z = 15})
	doCreateNpcInClones({x = 645, y = 645, z = 15})
	doCreateNpcInClones({x = 635, y = 640, z = 15})
	doCreateNpcInClones({x = 620, y = 640, z = 15})
	doCreateNpcInClones({x = 620, y = 627, z = 15})
	doCreateNpcInClones({x = 628, y = 617, z = 15})
	doCreateNpcInClones({x = 611, y = 617, z = 15})
	doCreateNpcInClones({x = 608, y = 639, z = 15})
	doCreateNpcInClones({x = 593, y = 644, z = 15})
	doCreateNpcInClones({x = 594, y = 661, z = 15})
	doCreateNpcInClones({x = 591, y = 678, z = 15})
	doCreateNpcInClones({x = 598, y = 684, z = 15})
	doCreateNpcInClones({x = 615, y = 679, z = 15})
	doCreateNpcInClones({x = 669, y = 679, z = 15})
	doCreateNpcInClones({x = 686, y = 679, z = 15})
	doCreateNpcInClones({x = 692, y = 670, z = 15})
	doCreateNpcInClones({x = 692, y = 654, z = 15})
	doCreateNpcInClones({x = 692, y = 639, z = 15})
	doCreateNpcInClones({x = 673, y = 640, z = 15})
	doCreateNpcInClones({x = 657, y = 640, z = 15})
	doCreateNpcInClones({x = 692, y = 626, z = 15})
	doCreateNpcInClones({x = 692, y = 612, z = 15})
	doCreateNpcInClones({x = 705, y = 612, z = 15})
	doCreateNpcInClones({x = 721, y = 619, z = 15})
	doCreateNpcInClones({x = 711, y = 640, z = 15})
	doCreateNpcInClones({x = 720, y = 630, z = 15})
	doCreateNpcInClones({x = 736, y = 626, z = 15})
	doCreateNpcInClones({x = 741, y = 636, z = 15})
	doCreateNpcInClones({x = 741, y = 651, z = 15})
	doCreateNpcInClones({x = 741, y = 675, z = 15})
	doCreateNpcInClones({x = 723, y = 679, z = 15})
	doCreateNpcInClones({x = 708, y = 679, z = 15})
	doCreateNpcInClones({x = 716, y = 690, z = 15})
	doCreateNpcInClones({x = 716, y = 704, z = 15})
	doCreateNpcInClones({x = 716, y = 711, z = 15})
	doCreateNpcInClones({x = 753, y = 651, z = 15})
	doCreateNpcInClones({x = 765, y = 651, z = 15})
	doCreateNpcInClones({x = 773, y = 644, z = 15})
	doCreateNpcInClones({x = 772, y = 659, z = 15})
end