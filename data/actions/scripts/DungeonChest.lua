local Quests = {
-- Quest's Bau
	[16000] = {pontos = 125},
	[16001] = {pontos = 125},
	[16002] = {pontos = 175},
	[16003] = {pontos = 175},
	[16004] = {pontos = 175},
	[16005] = {pontos = 125},
	[16006] = {pontos = 125},
	[16007] = {pontos = 125},
	[16008] = {pontos = 125},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not Quests[item.actionid] then
		return true
	end
	
	if getPlayerStorageValue(cid, 2154600) ~= 1 then
		return doPlayerSendCancel(cid, "Você não está dentro da DG.")
	end
	
	local quest = Quests[item.actionid]
	local level = tonumber(getPlayerClanLevel(cid)) or 1
	local formula = tonumber(math.floor(level / 2.5 * quest.pontos * (getPlayerClanRank(cid) / 1.5)))

	doTeleportFinish(cid)
	setPlayerPointsClan(cid, formula)
	setPlayerStorageValue(cid, 123124, -1)
	doPlayerSendTextMessage(cid, 20, "Você completou a DG e ganhou "..formula.." pontos.")	
	return true  
end