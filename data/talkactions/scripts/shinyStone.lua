local MSG = [[
	Evolução dos pokémons shiny:
	
	- Shiny Growlithe -> Shiny Arcanine (8 Shiny Stone)
	- Shiny Magikarp -> Shiny Gyarados (8 Shiny Stone)
	- Shiny Rattata -> Shiny Raticate (1 Shiny Stone)
	- Shiny Zubat -> Shiny Golbat (2 Shiny Stone)
	- Shiny Cubone -> Shiny Marowak (6 Shiny Stone)
	- Shiny Horsea -> Shiny Seadra (2 Shiny Stone)
	- Shiny Voltorb -> Shiny Electrode (2 Shiny Stone)
	- Shiny Venonat -> Shiny Venomoth (5 Shiny Stone)
	- Shiny Paras -> Shiny Parasect (5 Shiny Stone)
	- Shiny Tentacool -> Shiny Tentacruel (7 Shiny Stone)
	- Shiny Grimer -> Shiny Muk (7 Shiny Stone)
	- Shiny Krabby -> Shiny Kingler (5 Shiny Stone)
	- Shiny Dratini -> Shiny Dragonair (6 Shiny Stone)
	
	ATENÇÃO:
	NÃO é possivel TRANSFORMAR normais em shinys. 
	A Shiny Stone SOMENTE EVOLUI shinys.
]]

-- - Continente liberado sem custos adicionais VIP. (Johto)

function onSay(cid, words, param)
	doPlayerPopupFYI(cid, MSG)
	return true
end