function onStepIn(cid, item, position, fromPosition)

local config = {
[5290] = {area = {fromx = 955, fromy = 1577, fromz = 6, tox = 965, toy = 1590, toz= 6}},
[5291] = {area = {fromx = 966, fromy = 1577, fromz = 6, tox = 975, toy = 1590, toz= 6}},
[5292] = {area = {fromx = 955, fromy = 1577, fromz = 5, tox = 969, toy = 1590, toz= 5}},
[5293] = {area = {fromx = 955, fromy = 1581, fromz = 4, tox = 969, toy = 1590, toz= 4}},
}

local cfg = config[item.actionid]
	if isSummon(cid) then return true end
		if #getPlayersInArea(cfg.area) >= 1 then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Já tem uma pessoa nessa área!")
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
			return true
		end
	return true
end