function onUse(cid, item, fromPosition, itemEx, toPosition)

local config = {
	[1510] = {remove = 19551, seconds = 10, pos = {x = 1167, y = 378, z = 8, stackpos = 1}, pos1 = {x = 1168, y = 378, z = 8, stackpos = 1}}
}

local cfg = config[item.actionid]

	if getTileItemById(cfg.pos, cfg.remove).uid == 0 then 
		return false 
	end
	
	doRemoveItem(getThingfromPos(cfg.pos1).uid, 1)		
	doRemoveItem(getThingfromPos(cfg.pos).uid, 1)	
	addEvent(doCreateItem, cfg.seconds * 1000, cfg.remove, cfg.pos)
	addEvent(doCreateItem, cfg.seconds * 1000, cfg.remove, cfg.pos1)
	doSendMsg(cid, "Corra, você tem apenas 45 segundos para passar!")
	return true
end