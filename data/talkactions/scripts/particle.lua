function onSay(cid, words, param, channel)
	
	if not param then
		doPlayerPopupFYI(cid, [[
			Escolha o numero correspondente a aura que você deseja:
					
				Verde: 10
				Laranja: 11
				Azul: 12
				Branco: 13
				Violeta: 14
				Roxo: 15
				Vermelho: 16
				Amarelo: 17
				Preto: 18
				Rosa: 19
				Cinza-Azulado: 20
				Marrom: 21
				Random: 22
				Heart: 101
				Skull: 102 - 105
			]])
		return true
	end
	
	if isInArray({"10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "102", "103", "104", "105"}, param) then
		if getItemAttribute(getPlayerSlotItem(cid, 8).uid, "aura") == "particle" or getItemAttribute(getPlayerSlotItem(cid, 8).uid, "ball") == "premier" then
			if getItemAttribute(getPlayerSlotItem(cid, 8).uid, "ball") == "premier" and getItemAttribute(getPlayerSlotItem(cid, 8).uid, "aura") ~= "particle" then
				doItemEraseAttribute(getPlayerSlotItem(cid, 8).uid, "aura") 
				doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "aura", "particle")
			end
			doCreatureSetSkullType(getCreatureSummons(cid)[1], param)
		end
	else
		doPlayerPopupFYI(cid, [[
			Escolha o numero correspondente a aura que você deseja:
					
				Verde: 10
				Laranja: 11
				Azul: 12
				Branco: 13
				Violeta: 14
				Roxo: 15
				Vermelho: 16
				Amarelo: 17
				Preto: 18
				Rosa: 19
				Cinza-Azulado: 20
				Marrom: 21
				Random: 22
				Heart: 101
				Skull: 102 - 105
			]])		
	end
	return true
end
