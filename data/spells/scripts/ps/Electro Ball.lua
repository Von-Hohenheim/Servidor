function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Electro Ball")

return true
end