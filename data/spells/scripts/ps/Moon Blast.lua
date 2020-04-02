function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Moon Blast")

return true
end