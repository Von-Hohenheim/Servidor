function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Song Burst")

return true
end