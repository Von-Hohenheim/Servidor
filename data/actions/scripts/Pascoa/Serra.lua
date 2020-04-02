function onUse(cid, item, fromPosition, item2, toPosition)

	if isInArray({18328, 18333, 18327}, item2.itemid) then
		if math.random(1, 100) >= 15 then
			doTransformItem(item2.uid, 6216)
			local function growRock(pos)
				doTransformItem(getTileItemById(pos, 6216).uid, item2.itemid) --id do item arvore quebrada, arvore normal
			end
			doPlayerAddItem(cid, 2684, math.random(1, 27))
			addEvent(growRock, 60 * 60 * 1000, getThingPos(item2.uid))
		else
			doRemoveItem(item.uid, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sua serra quebrou!")
		end
	end

return true
end