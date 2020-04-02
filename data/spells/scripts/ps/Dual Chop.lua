function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Dual Chop")

return true
end