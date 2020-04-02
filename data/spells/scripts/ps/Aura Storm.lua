function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Aura Storm")

return true
end