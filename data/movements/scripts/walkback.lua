function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	doTeleportThing(cid, fromPosition)
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if item.uid > 0 and item.uid <= 65535 then
		if position == fromPosition then
			if isPlayer(cid) then
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			else
				doRemoveCreature(cid)	
			end
		else
			doTeleportThing(cid, fromPosition, false)
		end
	end
	return true
end
