function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Drill Run")

return true
end