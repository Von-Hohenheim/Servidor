function onUse(cid, item, fromPosition, item2, toPosition)
	
	if #getCreatureSummons(cid) >= 1 then
		doPlayerSendCancel(cid, "Retorne o pok�mon para usar a particle aura.")
		return true
	end

	if getItemAttribute(item2.uid, "aura") then
		doPlayerSendCancel(cid, "Seu pok�mon j� tem aura.")
		return true
	end
	
	if getItemAttribute(item2.uid, "poke") then
		doSetItemAttribute(item2.uid, "aura", "particle")
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, 20, "Agora seu pok�mon tem Particle Aura!")
	else
		doPlayerSendCancel(cid, "Voc� s� pode usar a partice aura em uma pok�ball.")
		return true
	end

return true
end