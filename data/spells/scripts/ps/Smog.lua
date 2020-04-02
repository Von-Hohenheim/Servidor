function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Smog")

return true
end