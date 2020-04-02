function onSay(cid, words, param, channel)

local config = {
["/buyunlock"] = {price = 500, add = 6119, extended = 31, count = 1, storage = 210208},
["/buyzardy"] = {price = 18000, add = 15135, extended = 31, count = 1, storage = 210209},
["/buyzardx"] = {price = 18000, add = 15134, extended = 31, count = 1, storage = 210210},
["/buykenga"] = {price = 18000, add = 15783, extended = 31, count = 1, storage = 210211},
["/buyshiny"] = {price = 3500, add = 19203, extended = 31, count = 1, storage = 210212},
["/buysmeargle"] = {price = 1500, add = 12618, extended = 31, count = 1, storage = 210213},
["/buyfly"] = {price = 2000, add = 8189, extended = 31, count = 1, storage = 210214},
["/buyampharos"] = {price = 18000, add = 15794, extended = 31, count = 1, storage = 210215},
["/buygengar"] = {price = 18000, add = 15136, extended = 31, count = 1, storage = 210216},
["/buyalaka"] = {price = 18000, add = 15131, extended = 31, count = 1, storage = 210217},
["/buymawile"] = {price = 18000, add = 15782, extended = 31, count = 1, storage = 210218},
["/buytyranitar"] = {price = 18000, add = 15781, extended = 31, count = 1, storage = 210219},
["/buymemory"] = {price = 3000, add = 19280, extended = 31, count = 1, storage = 210220},
["/buysaur"] = {price = 18000, add = 15793, extended = 31, count = 1, storage = 210221},
["/buysurf"] = {price = 1250, add = 5952, extended = 31, count = 1, storage = 210222},
["/buyblasto"] = {price = 18000, add = 15133, extended = 31, count = 1, storage = 210223}
}

local cfg = config[words]

	if not cfg then return true end

		if getPlayerStorageValue(cid, cfg.storage) ~= 1 then
			setPlayerStorageValue(cid, cfg.storage, 1)		
			doSendPlayerExtendedOpcode(cid, cfg.extended, "Buy")
			addEvent(setPlayerStorageValue, 15 * 1000 , cid, cfg.storage, -1)			
		else
			if getPointsTower(cid) >= cfg.price then
				doPlayerAddItem(cid, cfg.add, cfg.count)
				setPlayerStorageValue(cid, cfg.storage, -1)	
				removeTowerPoints(cid, cfg.price)
			else
				doSendPlayerExtendedOpcode(cid, cfg.extended, false)
				setPlayerStorageValue(cid, cfg.storage, -1)					
		end
	end	
	
	return true
end
