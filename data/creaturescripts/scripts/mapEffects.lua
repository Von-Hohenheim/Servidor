local config = {
    positions = {
          ["TESTE DE DANO!"] = { x = 1021, y = 1027, z = 7 },
    }
}

function onThink(cid, interval)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
	end
		doAreaCombatHealth(cid, WATERDAMAGE, splash, pulse1, -1, -800, 25)
    return true
end  