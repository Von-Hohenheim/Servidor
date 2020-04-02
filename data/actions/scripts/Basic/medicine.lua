function onUse(cid, item, frompos, item2, topos)
	
	if not isCreature(item2.uid) then return true end
	
	if getPlayerStorageValue(cid, 55006) >= 1 and not canUseMedicineOnDuel then
		return doPlayerSendCancel(cid, "You can't do that while a duel.")
	end
	
	if (getPlayerStorageValue(item2.uid, 42347) - os.time()) > 0 then
		doPlayerSendCancel(cid, "Você não pode usar o medicine enquanto seu pokémon está descansando.")
		return true
	end
	
	doCureStatus(item2.uid, "all", false)
	
	if (getCreatureCondition(item2.uid, CONDITION_PARALYZE) == true) then
		doRemoveCondition(item2.uid, CONDITION_PARALYZE)
	end --edited medicine 
	
	doSendMagicEffect(getThingPos(item2.uid), 14)
	doRemoveItem(item.uid, 1)
	
	return true
end