function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Fury Punches")

return true
end