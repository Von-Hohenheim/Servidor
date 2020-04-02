function onSay(cid, words, param, channel)

local config = {
	["/entrar1"] = {storage = 20108, andar = 1},
	["/entrar2"] = {storage = 20109, andar = 2},
	["/entrar3"] = {storage = 20110, andar = 3},
	["/entrar4"] = {storage = 20111, andar = 4}
}
	
local cfg = config[words]	
	
	if getPlayerStorageValue(cid, cfg.storage) - os.time() < 0 then
		setPlayerStorageValue(cid, cfg.storage, 5 + os.time())		
		doSendPlayerExtendedOpcode(cid, 31, "Tower")		
	else
		doTeleportTower(cid, cfg.andar)	
	end
	
return true
end