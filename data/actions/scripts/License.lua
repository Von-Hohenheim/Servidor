function onUse(cid, item, item2, frompos, itemEx, topos)

local config = {
[8189] = {storage = 78497, txt = "Fly"}, -- Fly
[5952] = {storage = 78498, txt = "Surf"} -- Surf
}

	if item.itemid == 6119 then
		if getPlayerStorageValue(cid, 78504) < 1 then
			buyToRoom(cid)
			doRemoveItem(item.uid, 1)
		else
			doPlayerSendCancel(cid, "Você já liberou todos os andares disponíveis no momento!")
		end
	else				
		setPlayerStorageValue(cid, config[item.itemid].storage, 1)
		doSendMsg(cid, "Você acaba de ter acesso ao "..config[item.itemid].txt.." license em Hoenn!")
		doRemoveItem(item.uid, 1)	
	end
	
	return true
end