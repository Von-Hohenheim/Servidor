function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Mega Wing")

return true
end