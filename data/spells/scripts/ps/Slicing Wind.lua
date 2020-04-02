function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Slicing Wind")

return true
end