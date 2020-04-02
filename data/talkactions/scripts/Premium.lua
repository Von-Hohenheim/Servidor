local MSG = [[
	Quais as vantagens de ser VIP?
	
	- 10% a mais de experiência.
	- Podem comprar House.
	- Tempo de teleport reduzido em 65%.
	- Comando !walk para o Fly, Ride e Surf.
	- Quests e Hunts exclusivas liberadas.
	- Ícone exclusivo ao lado do nome.
]]

-- - Continente liberado sem custos adicionais VIP. (Johto)

function onSay(cid, words, param)
	doPlayerPopupFYI(cid, MSG)
	return true
end