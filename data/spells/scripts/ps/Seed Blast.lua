function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Seed Blast")

return true
end