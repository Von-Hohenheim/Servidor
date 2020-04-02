function onStepIn(cid, item, position, fromPosition)

local config = {
[13100] = {teleport = {x = 699, y = 324, z = 2}}
}

local cfg = config[item.actionid]

	doTeleportThing(cid, cfg.teleport, true)
	return true
end