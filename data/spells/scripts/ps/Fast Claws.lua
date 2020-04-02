function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Fast Claws")

return true
end