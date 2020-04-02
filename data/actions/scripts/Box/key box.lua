function onUse(cid, item, frompos, item2, topos)
		if item.itemid == 19917 then 
			for i = 1, 5 do
				addChaveToClan(cid)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você abriu a Key Box e acaba de ganhar 5x "..getPlayerClanName(cid).." Key.")
			doRemoveItem(item.uid, 1)			
		end
	return true 
end
