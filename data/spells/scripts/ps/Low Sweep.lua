function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Low Sweep")

return true
end