function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Blue Flames")

return true
end