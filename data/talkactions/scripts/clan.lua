function onSay(cid, words, param, channel)

local config = {
-- Ironhard --
["Ironhard40"] = {clan = "Ironhard", cost = 40, rank = 1},
["Ironhard50"] = {clan = "Ironhard", cost = 50, rank = 2},
["Ironhard60"] = {clan = "Ironhard", cost = 60, rank = 3},
["Ironhard70"] = {clan = "Ironhard", cost = 70, rank = 4},
["Ironhard80"] = {clan = "Ironhard", cost = 80, rank = 5},
-- Malefic --
["Malefic40"] = {clan = "Malefic", cost = 40, rank = 1},
["Malefic50"] = {clan = "Malefic", cost = 50, rank = 2},
["Malefic60"] = {clan = "Malefic", cost = 60, rank = 3},
["Malefic70"] = {clan = "Malefic", cost = 70, rank = 4},
["Malefic80"] = {clan = "Malefic", cost = 80, rank = 5},
-- Psycraft --
["Psycraft40"] = {clan = "Psycraft", cost = 40, rank = 1},
["Psycraft50"] = {clan = "Psycraft", cost = 50, rank = 2},
["Psycraft60"] = {clan = "Psycraft", cost = 60, rank = 3},
["Psycraft70"] = {clan = "Psycraft", cost = 70, rank = 4},
["Psycraft80"] = {clan = "Psycraft", cost = 80, rank = 5},
-- Volcanic --
["Volcanic40"] = {clan = "Volcanic", cost = 40, rank = 1},
["Volcanic50"] = {clan = "Volcanic", cost = 50, rank = 2},
["Volcanic60"] = {clan = "Volcanic", cost = 60, rank = 3},
["Volcanic70"] = {clan = "Volcanic", cost = 70, rank = 4},
["Volcanic80"] = {clan = "Volcanic", cost = 80, rank = 5},
-- Seavell --
["Seavell40"] = {clan = "Seavell", cost = 40, rank = 1},
["Seavell50"] = {clan = "Seavell", cost = 50, rank = 2},
["Seavell60"] = {clan = "Seavell", cost = 60, rank = 3},
["Seavell70"] = {clan = "Seavell", cost = 70, rank = 4},
["Seavell80"] = {clan = "Seavell", cost = 80, rank = 5},
-- Orebound --
["Orebound40"] = {clan = "Orebound", cost = 40, rank = 1},
["Orebound50"] = {clan = "Orebound", cost = 50, rank = 2},
["Orebound60"] = {clan = "Orebound", cost = 60, rank = 3},
["Orebound70"] = {clan = "Orebound", cost = 70, rank = 4},
["Orebound80"] = {clan = "Orebound", cost = 80, rank = 5},
-- Naturia --
["Naturia40"] = {clan = "Naturia", cost = 40, rank = 1},
["Naturia50"] = {clan = "Naturia", cost = 50, rank = 2},
["Naturia60"] = {clan = "Naturia", cost = 60, rank = 3},
["Naturia70"] = {clan = "Naturia", cost = 70, rank = 4},
["Naturia80"] = {clan = "Naturia", cost = 80, rank = 5},
-- Raibolt --
["Raibolt40"] = {clan = "Raibolt", cost = 40, rank = 1},
["Raibolt50"] = {clan = "Raibolt", cost = 50, rank = 2},
["Raibolt60"] = {clan = "Raibolt", cost = 60, rank = 3},
["Raibolt70"] = {clan = "Raibolt", cost = 70, rank = 4},
["Raibolt80"] = {clan = "Raibolt", cost = 80, rank = 5},
-- Wingeon --
["Wingeon40"] = {clan = "Wingeon", cost = 40, rank = 1},
["Wingeon50"] = {clan = "Wingeon", cost = 50, rank = 2},
["Wingeon60"] = {clan = "Wingeon", cost = 60, rank = 3},
["Wingeon70"] = {clan = "Wingeon", cost = 70, rank = 4},
["Wingeon80"] = {clan = "Wingeon", cost = 80, rank = 5},
-- Gardestrike --
["Gardestrike40"] = {clan = "Gardestrike", cost = 40, rank = 1},
["Gardestrike50"] = {clan = "Gardestrike", cost = 50, rank = 2},
["Gardestrike60"] = {clan = "Gardestrike", cost = 60, rank = 3},
["Gardestrike70"] = {clan = "Gardestrike", cost = 70, rank = 4},
["Gardestrike80"] = {clan = "Gardestrike", cost = 80, rank = 5}
}

local cfg = config[param]

	if not cfg then return false end

	if getPlayerItemCount(cid, 2145) >= cfg.cost then
		setPlayerClan(cid, cfg.clan)		
		setPlayerClanRank(cid, cfg.rank)
		doPlayerRemoveItem(cid, 2145, cfg.cost)
		return true
	end
	
return true
end
