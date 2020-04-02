local posis = {
	{'Volcanic',    {x = 1938, y = 1032, z = 15}}, 
	{'Seavell',     {x = 1939, y = 1032, z = 15}},
	{'Orebound',    {x = 1938, y = 1033, z = 15}},
	{'Wingeon',     {x = 1939, y = 1033, z = 15}},
}

local toPosi = {x = 1938, y = 1072, z = 15} --pos pra onde os players serao teleportados
local posCao = {fromx = 1712, fromy = 1001, fromz = 15, tox = 1966, toy = 1097, toz= 15}

function onUse(cid, item, frompos, item2, topos)

	for _, array in ipairs(posis) do
		local p = getRecorderPlayer(array[2])
		if not isPlayer(p) then
			doPlayerSendTextMessage(cid, 27, "Você não está na posição correta!")
			return true
		elseif getGlobalStorageValue(254000) < 75 then
			doPlayerSendTextMessage(cid, 27, "Ainda tem recipientes de clonagem na área destrua-os.")
			return true
		elseif #getMonsterInArea(posCao) >= 1 then
			doPlayerSendTextMessage(cid, 27, "Ainda tem pokémons clones na área elimine-os.")
			return true
		end
	end
	
	doTransformItem(item.uid, (item.itemid == 1945 and 1945 or 1946))
	
	for _, array in ipairs(posis) do
		local p = getRecorderPlayer(array[2])
		if isPlayer(p) then
			doTeleportThing(p, toPosi)
			setGlobalStorageValue(254000, 0)
		end
	end

return true
end
