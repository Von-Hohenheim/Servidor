function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Baton Pass")

return true
end