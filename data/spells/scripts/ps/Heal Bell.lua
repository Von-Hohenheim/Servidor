function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Heal Bell")

return true
end