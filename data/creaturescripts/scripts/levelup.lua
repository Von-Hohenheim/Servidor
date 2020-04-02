function onAdvance(cid, skill, oldLevel, newLevel)

	if skill ~= 8 then return true end
	
	doRegainSpeed(cid)
	doSendMagicEffect(getThingPos(cid), math.random(28, 29))
	doSendAnimatedText(getThingPos(cid), "Level up!", 215)
	doSendMagicEffect(getThingPos(cid), 132) 
	doPlayerSave(cid, true)
	
	if getPlayerStorageValue(cid, 15513) ~= -1 then
		setAccountStorageValue(getPlayerAccountId(cid), 5414, 1) -- Proteção pra quem já recebeu o PREMIUM não receber novamente
	end
	
	return true
end