function onUse(cid, item, frompos, item3, topos)

local config = {
[14600] = {
	pos = {
		{x = 1057, y = 1466, z = 8}, 
		{x = 1057, y = 1467, z = 8}
		  }, 
	pos2 = {
		{x = 1059, y = 1468, z = 8},
		{x = 1059, y = 1469, z = 8}
		},
	teleport = {x = 1061, y = 1469, z = 8},
	teleport2 ={x = 1055, y = 1464, z = 8}
		  },
[14601] = {
	pos = {
		{x = 1267, y = 635, z = 7}, 
		{x = 1267, y = 636, z = 7}
		  }, 
	pos2 = {
		{x = 1269, y = 635, z = 7},
		{x = 1269, y = 636, z = 7}
		},
	teleport = {x = 1275, y = 637, z = 7},
	teleport2 = {x = 1264, y = 632, z = 7}
		  },	
[14602] = {
	pos = {
		{x = 1430, y = 1241, z = 8}, 
		{x = 1430, y = 1240, z = 8},
		{x = 1430, y = 1239, z = 8},
		{x = 1430, y = 1242, z = 8}
		  }, 
	pos2 = {
		{x = 1428, y = 1239, z = 8},
		{x = 1428, y = 1240, z = 8},
		{x = 1428, y = 1241, z = 8}
		},
	teleport = {x = 1427, y = 1240, z = 8},
	teleport2 = {x = 1431, y = 1240, z = 8}
		  },	
[14603] = {
	pos = {
		{x = 1433, y = 1241, z = 8}, 
		{x = 1433, y = 1242, z = 8},
		{x = 1433, y = 1240, z = 8},
		{x = 1433, y = 1239, z = 8}
		  }, 
	pos2 = {
		{x = 1435, y = 1239, z = 8},
		{x = 1435, y = 1240, z = 8},
		{x = 1435, y = 1241, z = 8}
		},
	teleport = {x = 1437, y = 1240, z = 8},
	teleport2 = {x = 1432, y = 1240, z = 8}
		  },		
[14604] = {
	pos = {
		{x = 313, y = 1870, z = 7}, 
		{x = 313, y = 1871, z = 7},
		{x = 313, y = 1872, z = 7}
		  }, 
	pos2 = {
		{x = 315, y = 1871, z = 7},
		{x = 315, y = 1872, z = 7}
		},
	teleport = {x = 316, y = 1871, z = 7},
	teleport2 = {x = 311, y = 1870, z = 7}
		  },			
[14605] = {
	pos = {
		{x = 1328, y = 873, z = 2}, 
		{x = 1330, y = 873, z = 2},
		{x = 1329, y = 873, z = 2},
		{x = 1331, y = 873, z = 2}
		  }, 
	pos2 = {
		{x = 1329, y = 875, z = 2},
		{x = 1330, y = 875, z = 2},
		{x = 1331, y = 875, z = 2},
		{x = 1332, y = 875, z = 2}
		},
	teleport = {x = 1330, y = 875, z = 2},
	teleport2 = {x = 1330, y = 873, z = 2}
		  },		
[14606] = {
	pos = {
		{x = 669, y = 1162, z = 7}, 
		{x = 668, y = 1162, z = 7},
		{x = 667, y = 1162, z = 7}
		  }, 
	pos2 = {
		{x = 668, y = 1160, z = 7},
		{x = 667, y = 1160, z = 7},
		{x = 666, y = 1160, z = 7},
		{x = 665, y = 1160, z = 7}
		},
	teleport = {x = 667, y = 1159, z = 7},
	teleport2 = {x = 668, y = 1163, z = 7}
		  },			
[14607] = {
	pos = {
		{x = 850, y = 1446, z = 3}, 
		{x = 851, y = 1446, z = 3}
		  }, 
	pos2 = {
		{x = 850, y = 1448, z = 3},
		{x = 851, y = 1448, z = 3}
		},
	teleport = {x = 850, y = 1450, z = 3},
	teleport2 = {x = 850, y = 1444, z = 3}
		  },				
[14608] = {
	pos = {
		{x = 618, y = 318, z = 5}, 
		{x = 618, y = 319, z = 5}
		  }, 
	pos2 = {
		{x = 620, y = 318, z = 5},
		{x = 620, y = 319, z = 5}
		},
	teleport = {x = 622, y = 319, z = 5},
	teleport2 = {x = 615, y = 318, z = 5}
		  },			  
}

local cfg = config[item.actionid]

	if not cfg then
		return true
	end

	if getPlayerStorageValue(cid, 50926) >= 1 then	
		for i = 1, #cfg.pos do
			if doComparePositions(cfg.pos[i], getThingPos(cid)) then
				doTeleportThing(cid, cfg.teleport)
			elseif doComparePositions(cfg.pos2[i], getThingPos(cid)) then
				doTeleportThing(cid, cfg.teleport2)	
			end
		end
	else
		doPlayerSendCancel(cid, "Você não completou a Cyber Quest!")
	end
	
return true 
end