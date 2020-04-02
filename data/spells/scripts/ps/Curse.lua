function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Curse")

return true
end