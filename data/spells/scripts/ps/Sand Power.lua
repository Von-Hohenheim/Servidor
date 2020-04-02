function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Sand Power")

return true
end