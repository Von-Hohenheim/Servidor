function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Flash Kick")

return true
end