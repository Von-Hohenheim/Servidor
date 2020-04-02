function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Ice Sparks")

return true
end