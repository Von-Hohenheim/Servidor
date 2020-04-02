 local config = {
    positions = {
		[410] = {x = 227, y = 431, z = 7},

		[941] = {x = 104, y = 37, z = 15},  -- tem q ser effects diferentes
		[961] = {x = 105, y = 37, z = 15},
		[944] = {x = 112, y = 38, z = 15},
		
		[925] = {x = 890, y = 1469, z = 7}, -- Pilares da Mega Ring quest \/
		[926] = {x = 871, y = 1466, z = 7},
		[927] = {x = 877, y = 1447, z = 7},
		
    }
}

function onThink(cid, interval, lastExecution)
    for effect, pos in pairs(config.positions) do
        doSendMagicEffect(pos, effect)
    end
    
    return TRUE
end  