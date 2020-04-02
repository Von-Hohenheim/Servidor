function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Frost Breath")

return true
end