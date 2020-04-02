function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Dark Ball")

return true
end