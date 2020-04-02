function onUse(cid, item, fromPosition, itemEx, toPosition)

if itemEx.itemid == 9058 then   -- ground
	doTeleportThing(cid, {x = 1109, y = 414, z = 8})
	doBroadcastMessage("[Big Porygon]: Perigo! O jogador "..getCreatureName(cid).." invadiu nosso mundo querido suditos mate-o!", 20)
	doRemoveItem(item.uid, 1)
	doPlayerRemoveItem(cid, 1956, 1)
end

	return true
end