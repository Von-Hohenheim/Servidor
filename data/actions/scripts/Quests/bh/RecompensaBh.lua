local posis = {
	{'Volcanic',    {x = 619, y = 615, z = 15}}, 
	{'Seavell',     {x = 621, y = 615, z = 15}},
}

local toPosi = {x = 621, y = 579, z = 15} --pos pra onde os players serao teleportados
local posCao = {fromx = 563, fromy = 593, fromz = 15, tox = 919, toy = 737, toz= 15}

function onUse(cid, item, frompos, item2, topos)

	for _, array in ipairs(posis) do
		local p = getRecorderPlayer(array[2])
		if not isPlayer(p) then
			doPlayerSendTextMessage(cid, 27, "Você não está na posição correta!")
			return true
		elseif #getNpcInArea(posCao) >= 1 then
			doPlayerSendTextMessage(cid, 27, "Ainda tem duelistas na área, elimine-os.")
			return true
		end
	end
	
	doTransformItem(item.uid, (item.itemid == 1945 and 1945 or 1946))
	
	for _, array in ipairs(posis) do
		local p = getRecorderPlayer(array[2])
		if isPlayer(p) then
			doTeleportThing(p, toPosi)
		end
	end

return true
end
