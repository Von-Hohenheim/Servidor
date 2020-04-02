function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Energy Ball")

return true
end