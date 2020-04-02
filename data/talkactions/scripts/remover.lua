function onSay(cid, words, param, channel)

	if getPlayerStorageValue(cid, 1456894) ~= 1 then
		local slot1 = getPlayerSlotItem(cid, CONST_SLOT_HEAD).uid
		local slot2 = getPlayerSlotItem(cid, CONST_SLOT_RIGHT).uid 
		local slot3 = getPlayerSlotItem(cid, CONST_SLOT_LEFT).uid 
		local slot4 = getPlayerSlotItem(cid, CONST_SLOT_LEGS).uid 
		local slot5 = getPlayerSlotItem(cid, CONST_SLOT_RING).uid
		local slot6 = getPlayerSlotItem(cid, CONST_SLOT_AMMO).uid 
		
		doRemoveItem(slot1, 1)
		doRemoveItem(slot2, 1)
		doRemoveItem(slot3, 1)
		doRemoveItem(slot4, 1)
		doRemoveItem(slot5, 1)
		doRemoveItem(slot6, 1)	
		setPlayerStorageValue(cid, 1456894, 1)
		setPlayerStorageValue(cid, 20025, "all")
	end
	
return true
end
