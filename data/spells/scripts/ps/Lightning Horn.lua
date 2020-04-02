function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Lightning Horn")

return true
end