function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Water Fury")

return true
end