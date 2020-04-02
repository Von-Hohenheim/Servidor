local Teleports = {
	[20003] = {cityId = 1, TC = true}, -- Saffron TC
	[20011] = {cityId = 1, TC = false}, -- Saffron TR

	[20002] = {cityId = 2, TC = true}, -- Cerulean TC
	[20010] = {cityId = 2, TC = false}, -- Cerulean TR

	[20004] = {cityId = 3, TC = true}, -- Celadon TC
	[20012] = {cityId = 3, TC = false}, -- Celadon TR

	[20005] = {cityId = 4, TC = true}, -- Vermilion TC
	[20013] = {cityId = 4, TC = false}, -- Vermilion TR

	[20001] = {cityId = 5, TC = true}, -- pewter TC
	[20009] = {cityId = 5, TC = false}, -- pewter TR

	[20000] = {cityId = 6, TC = true}, -- viridian TC
	[20008] = {cityId = 6, TC = false}, -- viridian TR

	[20007] = {cityId = 8, TC = true}, -- Cinnabar TC
	[20015] = {cityId = 8, TC = false}, -- Cinnabar TR

	[20006] = {cityId = 9, TC = true}, -- fuchsia TC
	[20014] = {cityId = 9, TC = false}, -- fuchsia TR
	
	[20017] = {cityId = 10, TC = true}, -- Lavender TC
	[20018] = {cityId = 10, TC = false}, -- Lavender TR
	
	[20019] = {cityId = 11, TC = true}, -- Dewford TC
	[20020] = {cityId = 11, TC = false}, -- Dewford TR
	
	[20021] = {cityId = 12, TC = true}, -- Slateport TC
	[20022] = {cityId = 12, TC = false}, -- Slateport TR
	
	[20023] = {cityId = 13, TC = true}, -- Pacifidlog TC
	[20024] = {cityId = 13, TC = false}, -- Pacifidlog TR
}

local TR_Position = {x = 56, y = 40, z = 15}
local TC_Position = {x = 116, y = 39, z = 15}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if item.actionid == 20219 then
		doTeleportThing(cid, {x = 1462, y = 771, z = 13})
		return true
	end
	if item.actionid == 20216 or item.actionid == 20224 then -- Voltar para o CP
		local cityId = (getPlayerStorageValue(cid, 42342) == -1 and 1 or getPlayerStorageValue(cid, 42342))
		doTeleportThing(cid, getTownTemplePosition(cityId))
	else
		local cityId = Teleports[item.actionid].cityId
		doTeleportThing(cid, (Teleports[item.actionid].TC and TC_Position or TR_Position))
		setPlayerStorageValue(cid, 42342, cityId)
	end
	return true
end
