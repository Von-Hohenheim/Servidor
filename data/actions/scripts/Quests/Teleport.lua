local config = {
	[9001] = {teleport = {x = 1462, y = 1222, z = 7}},
	[9002] = {teleport = {x = 1307, y = 1143, z = 8}},
	[9003] = {teleport = {x = 1705, y = 859, z = 8}},
	[9004] = {teleport = {x = 1360, y = 874, z = 7}},
	[9005] = {teleport = {x = 993, y = 1331, z = 8}},
	[9006] = {teleport = {x = 980, y = 1418, z = 6}}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local cfg = config[item.actionid]	

	if not isPremium(cid) and (item.action == 9005 or item.action == 9005) then
		doPlayerSendCancel(cid, "Para você entrar nessa área é necessário ser um membro premium.")
		return true
	end
	
	doTeleportThing(cid, cfg.teleport)
	return true  
end
