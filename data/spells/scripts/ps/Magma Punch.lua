function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Magma Punch")

return true
end