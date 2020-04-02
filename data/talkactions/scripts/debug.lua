function onSay(cid, words, param)
	if getPlayerStorageValue(cid, 5515) ~= 11 then
		doPlayerSendCancel(cid, "Você precisa falar com o Prof. Oak primeiro.")
		return true
	end
	
	if getPlayerStorageValue(cid, 213123) - os.time() > 0 then
		doPlayerSendCancel(cid, "Ainda falta "..convertTime(getPlayerStorageValue(cid, 213123) - os.time()).." para poder utilizar este comando novamente.")
		return true
	end
	local pos = getTownTemplePosition(1) -- posição do lugar onde todos vao
	doTeleportThing(cid, pos)
	doPlayerSendCancel(cid, "Você foi desbugado! Deverá esperar 15 minutos para poder utilizar o comando novamente!")
	db.executeQuery("UPDATE `players` SET `posx` = '"..pos.x.."', `posy` = '"..pos.y.."', `posz` = '"..pos.z.."';")
	setPlayerStorageValue(cid, 213123, 15 * 60 + os.time())
	return true
end