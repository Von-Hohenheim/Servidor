function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Cutting Sheet")

return true
end