function onUse(cid, item, fromPosition, item2, toPosition)
	
	if #getCreatureSummons(cid) >= 1 then
		doPlayerSendCancel(cid, "Retorne o pokémon para usar a particle aura.")
		return true
	end

	if getItemAttribute(item2.uid, "aura") then
		doPlayerSendCancel(cid, "Seu pokémon já tem aura.")
		return true
	end
	
	if getItemAttribute(item2.uid, "poke") then
		doSetItemAttribute(item2.uid, "aura", "particle")
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, 20, "Agora seu pokémon tem Particle Aura!")
	else
		doPlayerSendCancel(cid, "Você só pode usar a partice aura em uma pokéball.")
		return true
	end

return true
end