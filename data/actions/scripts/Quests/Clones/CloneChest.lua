local toPosi = {x = 605, y = 1172, z = 8}

function onUse(cid, item, frompos, item2, topos)
	
	if getContainerSlotsFree(getPlayerSlotItem(cid, 3).uid) >= 25 then	
		if getPlayerStorageValue(cid, 245660) ~= 1 then
			doPlayerAddItem(cid, 19956, 1)			
			doPlayerAddItem(cid, 19956, 1)			
			doPlayerAddItem(cid, 19957, 1)			
			doPlayerAddItem(cid, 19957, 1)			
			doPlayerAddItem(cid, 19958, 1)			
			doPlayerAddItem(cid, 19959, 1)			
			doPlayerAddItem(cid, 19960, 1)
			setPlayerStorageValue(cid, 245660, 1)			
		end
		doPlayerAddItem(cid, 15645, 350)
		doPlayerAddItem(cid, 15646, 175)
		doPlayerAddItem(cid, 15644, 117)
		doTeleportThing(cid, toPosi)
		setPlayerStorageValue(cid, 245678, -1)
		setChanceCard(doPlayerAddItem(cid, 19847, 1), 5)
		setPlayerStorageValue(cid, 245680, 15 * 24 * 60 * 60 + os.time())
		doPlayerSendTextMessage(cid, 20, "Parabéns você acaba de completar a Clone Quest.")
	else
		doPlayerSendCancel(cid, "Você precisa de 25 espaços vazios na bag!")
	end
	
	return true
end
