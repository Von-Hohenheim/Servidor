function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Double Kick")

return true
end