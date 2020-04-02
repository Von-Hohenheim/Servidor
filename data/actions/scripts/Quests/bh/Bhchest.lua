local toPosi = {x = 645, y = 722, z = 15}

function onUse(cid, item, frompos, item2, topos)
	
	if getContainerSlotsFree(getPlayerSlotItem(cid, 3).uid) >= 7 then	
		doPlayerAddItem(cid, 15645, 100)
		doPlayerAddItem(cid, 15646, 50)
		doPlayerAddItem(cid, 15644, 50)
		doPlayerAddItem(cid, 2160, 300)
		doTeleportThing(cid, toPosi)
		setPlayerStorageValue(cid, 245681, -1)
		setPlayerStorageValue(cid, 245683, 1)
		setPlayerStorageValue(cid, 181691, 1)
		doPlayerSendTextMessage(cid, 20, "Parabéns você acaba de completar a Quest.")
	else
		doPlayerSendCancel(cid, "Você precisa de 7 espaços vazios na bag!")
	end
	
	return true
end
