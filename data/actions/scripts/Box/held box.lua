function onUse(cid, item, frompos, item2, topos)
		if item.itemid == 19916 then 
			doPlayerAddRandomHeld(cid, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você abriu a Held Box e acaba de ganhar um Held T1.")
			doRemoveItem(item.uid, 1)			
		end
	return true 
end
