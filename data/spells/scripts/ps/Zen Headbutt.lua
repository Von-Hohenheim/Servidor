function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Zen Headbutt")

return true
end