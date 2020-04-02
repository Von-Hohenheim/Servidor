function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Seed Burst")

return true
end