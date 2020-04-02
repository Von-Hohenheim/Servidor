function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Fire Fist")

return true
end