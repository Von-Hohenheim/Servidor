local config = {
	[19947] = {monster = {"Butterfree", "Vileplume", "Venomoth", "Golduck", "Golem", "Seadra", "Vaporeon", "Jolteon", "Flareon"}, bonus = 10},
	[19948] = {monster = {"Starmie", "Arcanine", "Alakazam", "Tentacruel", "Muk", "Kangaskhan", "Rhydon", "Scyther", "Gyarados", "Lapras", "Kabutops", "Omastar"}, bonus = 10}
}

function onUse(cid, item, frompos, item2, topos)

local cfg = config[item.itemid]
local monsters = cfg.monster[math.random(#cfg.monster)]

	if cfg then
		local function growRock(pos)
			doTransformItem(getTileItemById(pos, 19931).uid, item.uid) --id do item arvore quebrada, arvore normal
		end
		doTransformItem(item.uid, 19931)
		addEvent(growRock, 60 * 60 * 1000, getThingPos(item.uid))	
		local clones = getGlobalStorageValue(254000) <= 0 and 0 or getGlobalStorageValue(254000)
		setGlobalStorageValue(254000, clones + 1)
		for _, oid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(oid, 245678) >= 1 then
				doPlayerSendTextMessage(oid, 20, "[Clones]: Ainda restam ["..tonumber(75 - clones).."] recipientes para você quebrar.")
			end
		end
		doCreateMonster(monsters, getThingPos(cid))
	end

return true
end