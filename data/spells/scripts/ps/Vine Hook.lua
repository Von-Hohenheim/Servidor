function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Vine Hook")

return true
end