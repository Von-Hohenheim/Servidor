function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Kecleon Wild")

return true
end