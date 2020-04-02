function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Guard Split")

return true
end