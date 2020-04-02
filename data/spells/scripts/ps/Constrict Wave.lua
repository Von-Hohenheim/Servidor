function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Constrict Wave")

return true
end