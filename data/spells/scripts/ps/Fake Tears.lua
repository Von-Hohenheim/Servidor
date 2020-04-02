function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Fake Tears")

return true
end