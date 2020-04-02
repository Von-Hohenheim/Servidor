local brotherhood = {
	[60350] = { -- Saffron City -- OK
			storage = 5465800
			},

	[60351] = { -- Cerulean City -- OK
			storage = 5465801
			},

	[60352] = { -- Vermilion City -- OK
			storage = 5465802
			},

	[60353] = { -- Celadon City -- OK
			storage = 5465803
			},

	[60354] = { -- Pewter City
			storage = 5465804
			},
			
	[60355] = { -- Viridian City -- OK
			storage = 5465805
			},
						
	[60356] = { -- Fuchsia City -- OK
			storage = 5465806
			},
			
	[60357] = { -- Cinnabar City -- OK
			storage = 5465807
			},	
			
	[60358] = { -- Pallet City -- OK
			storage = 5465808
			},
			
	[60359] = { -- Lavevnder City -- OK
			storage = 5465809
			}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if not brotherhood[item.actionid] then
		return true
	end
	
	local cfg = brotherhood[item.actionid]
	
	if not isMemberBrotherhood(cid) then
		doPlayerSendCancel(cid, "Só membros da Brotherhood pode pegar os contratos!")
		return true
	end
	
	if getPlayerStorageValue(cid, cfg.storage) - os.time() > 0 then
		doPlayerSendCancel(cid, "Ainda falta "..convertTime(getPlayerStorageValue(cid, cfg.storage) - os.time()).." para você pegar outro contrato.")
		return true
	end
	
	doSummonNpcBrotherhood(cid)
	setPlayerStorageValue(cid, cfg.storage, 6 * 60 * 60 + os.time())
	return true  
end
