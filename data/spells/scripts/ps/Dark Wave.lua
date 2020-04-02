function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Dark Wave")

return true
end