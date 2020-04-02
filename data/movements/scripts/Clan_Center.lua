local Teleports = {
-- Teleport to base clan -- 
	[18000] = {pos = {x = 361, y = 232, z = 12}}, -- Volcanic
	[18001] = {pos = {x = 252, y = 232, z = 12}}, -- Seavell
	[18002] = {pos = {x = 469, y = 232, z = 12}}, -- Naturia
	[18003] = {pos = {x = 578, y = 232, z = 12}}, -- Malefic
	[18004] = {pos = {x = 143, y = 233, z = 12}}, -- Psycraft
	[18005] = {pos = {x = 796, y = 232, z = 12}}, -- Gardestrike
	[18006] = {pos = {x = 908, y = 232, z = 12}}, -- Raibolt
	[18007] = {pos = {x = 687, y = 232, z = 12}}, -- Wingeon
	[18008] = {pos = {x = 35, y = 232, z = 12}}, -- Orebound
	[18009] = {pos = {x = 1021, y = 232, z = 12}}, -- Ironhard
-- Teleport to trade center -- 
	[18010] = {pos = {x = 155, y = 25, z = 14}}, -- Orebound
	[18011] = {pos = {x = 143, y = 25, z = 14}}, -- Psycraft
	[18012] = {pos = {x = 134, y = 25, z = 14}}, -- Seavell
	[18013] = {pos = {x = 131, y = 25, z = 14}}, -- Volcanic
	[18014] = {pos = {x = 137, y = 25, z = 14}}, -- Naturia
	[18015] = {pos = {x = 140, y = 25, z = 14}}, -- Malefic
	[18016] = {pos = {x = 152, y = 25, z = 14}}, -- Wingeon
	[18017] = {pos = {x = 146, y = 25, z = 14}}, -- Gardestrike
	[18018] = {pos = {x = 149, y = 25, z = 14}}, -- Raibolt
	[18019] = {pos = {x = 158, y = 25, z = 14}}, -- Ironhard	
-- Teleport to door clan and trade center --
	[18021] = {pos = {x = 144, y = 27, z = 14}} -- Orebound
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local tele = Teleports[item.actionid]
	doTeleportThing(cid, tele.pos)
	return true
end
