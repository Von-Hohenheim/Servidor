function onSay(cid, words, param)
	local FraseInicio = "Correr" -- frase que você quer que diga, caso queira voltar para Strong hast basta mudar aqui :D
	
	if exhaustion.get(cid, 6012) then
		doPlayerSendCancel(cid, 'Voce precisa esperar 120 segundos para usar novamente.')
		return true
	end
	
	doCreatureSay(cid, FraseInicio.." "..param, TALKTYPE_ORANGE_1)
	doChangeSpeed(cid, 1 * 200)
	doSendMagicEffect(getPlayerPosition(cid), 12)
	exhaustion.set(cid, 6012, 10)
	
	addEvent(function()
		if isCreature(cid) then
			doChangeSpeed(cid, 1 * -100)
		end
	end, 1200000000) -- Tempo que vai durar a talkaction
	
	return true
end