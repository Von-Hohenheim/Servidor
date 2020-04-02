function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Venomous Gale")

return true
end