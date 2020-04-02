function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Magnetic Flux")

return true
end