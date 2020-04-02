function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Dark Accurate")

return true
end