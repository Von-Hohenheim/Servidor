local config = {
    positions = {
          ["TESTE DE DANO!"] = { x = 1021, y = 1027, z = 7 },
       --   ["Welcome!"] = { x = 1565, y = 1701, z = 7 },

         -- ["Token Machine!"] = { x = 104, y = 35, z = 15 },
         -- ["Outlands!"] = { x = 116, y = 44, z = 15 },

    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
			if isPlayer(getThingPos(pos)) then
				doCreatureAddHealth(getThingPos(pos), -5000)				
			end
		end
    return true
end  