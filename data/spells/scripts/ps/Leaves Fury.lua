function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Leaves Fury")

return true
end