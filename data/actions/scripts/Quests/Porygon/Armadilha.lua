function onUse(cid, item, fromPosition, itemEx, toPosition)

local pos = {{x = 1164, y = 409, z = 8}, {x = 1167, y = 412, z = 8}, {x = 1170, y = 409, z = 8}, {x = 1170, y = 413, z = 8}, {x = 1164, y = 413, z = 8}}	

	if getPlayerStorageValue(cid, 2526489713) < 1 then	
		for i = 1, #pos do
			doCreateMonster(cid, "Porygon", pos[i], false)
		end
		doSendMsg(cid, "Você caiu na armadilha, rsrsrs.")
		setPlayerStorageValue(cid, 2526489713, 1)
	else
		doSendMsg(cid, "Você já caiu nessa armadilha, deixa de ser trouxa!")		
		return true
	end

return true
end