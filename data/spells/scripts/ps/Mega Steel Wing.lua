function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Mega Steel Wing")

return true
end