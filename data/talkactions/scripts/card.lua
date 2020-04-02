function onSay(cid, words, param)
	
	local stocard = 25487914
	if getGlobalStorageValue(stocard) - os.time() > 0 then
		doSendMsg(cid, "O seu card já está desbugado ou aguarde "..convertTime(getGlobalStorageValue(stocard) - os.time()).." para usar o desbugar novamente.")
		return true
	end	
	
	doCreateNpcWithFocus("Cporygon", {x = 1702, y = 127, z = 15}, cid)	
	local c = getTopCreature({x = 1702, y = 127, z = 15}).uid
	doRemoveCreature(c)
	doSendMsg(cid, "Seu card foi desbugado!")
	setGlobalStorageValue(stocard, 1 * 60 + os.time())
	return true
end