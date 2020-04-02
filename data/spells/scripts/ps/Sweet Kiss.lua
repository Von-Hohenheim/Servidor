function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Sweet Kiss")

return true
end