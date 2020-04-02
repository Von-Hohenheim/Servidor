function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Silver Gale")

return true
end