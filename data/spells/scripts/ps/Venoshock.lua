function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Venoshock")

return true
end